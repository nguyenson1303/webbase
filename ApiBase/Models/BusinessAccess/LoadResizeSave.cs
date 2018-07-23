using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using SkiaSharp;

namespace ApiBase.Models.BusinessAccess
{
    public class LoadResizeSave
    {
        const int ThumbnailSize = 150;
        const int Quality = 75;
        const string SkiaSharpCanvas = nameof(SkiaSharpCanvas);
        const string SkiaSharpBitmap = nameof(SkiaSharpBitmap);

        readonly IEnumerable<string> _images;
        readonly string _outputDirectory;

        public LoadResizeSave()
        {
            //// Find the closest images directory
            //var imageDirectory = Path.GetFullPath(".");
            //while (!Directory.Exists(Path.Combine(imageDirectory, "images")))
            //{
            //    imageDirectory = Path.GetDirectoryName(imageDirectory);
            //    if (imageDirectory == null)
            //    {
            //        throw new FileNotFoundException("Could not find an image directory.");
            //    }
            //}
            //imageDirectory = Path.Combine(imageDirectory, "images");
            //// Get at most 20 images from there
            //_images = Directory.EnumerateFiles(imageDirectory).Take(20);
            //// Create the output directory next to the images directory
            //_outputDirectory = Path.Combine(Path.GetDirectoryName(imageDirectory), "output");
            //if (!Directory.Exists(_outputDirectory))
            //{
            //    Directory.CreateDirectory(_outputDirectory);
            //}
        }

        static string OutputPath(string inputPath, string outputDirectory, string postfix)
        {
            return Path.Combine(
                outputDirectory,
                Path.GetFileNameWithoutExtension(inputPath)
                + "-" + postfix
                + Path.GetExtension(inputPath));
        }

        public static (int width, int height) ScaledSize(int inWidth, int inHeight, int outSize)
        {
            int width, height;
            if (inWidth > inHeight)
            {
                width = outSize;
                height = (int)Math.Round(inHeight * outSize / (double)inWidth);
            }
            else
            {
                width = (int)Math.Round(inWidth * outSize / (double)inHeight);
                height = outSize;
            }

            return (width, height);
        }

        public static SKEncodedImageFormat GetSkiaTypeImage(string fileType)
        {

            SKEncodedImageFormat fileTypeEnCode = 0;
            switch (fileType.ToLower())
            {
                case ".bmp":
                    fileTypeEnCode = SKEncodedImageFormat.Bmp;
                    break;
                case ".gif":
                    fileTypeEnCode = SKEncodedImageFormat.Gif;
                    break;
                case ".ico":
                    fileTypeEnCode = SKEncodedImageFormat.Ico;
                    break;
                case ".wbmp":
                    fileTypeEnCode = SKEncodedImageFormat.Wbmp;
                    break;
                case ".webp":
                    fileTypeEnCode = SKEncodedImageFormat.Webp;
                    break;
                case ".pkm":
                    fileTypeEnCode = SKEncodedImageFormat.Pkm;
                    break;
                case ".Ktx":
                    fileTypeEnCode = SKEncodedImageFormat.Ktx;
                    break;
                case ".astc":
                    fileTypeEnCode = SKEncodedImageFormat.Astc;
                    break;
                case ".jpg":
                    fileTypeEnCode = SKEncodedImageFormat.Jpeg;
                    break;
                case ".jpeg":
                    fileTypeEnCode = SKEncodedImageFormat.Jpeg;
                    break;
                case ".png":
                    fileTypeEnCode = SKEncodedImageFormat.Png;
                    break;
                case ".dng":
                    fileTypeEnCode = SKEncodedImageFormat.Dng;
                    break;
                default:
                    fileTypeEnCode = 0;
                    break;
            }

            return fileTypeEnCode;
        }

        // [Benchmark(Description = "SkiaSharp Canvas Load, Resize, Save")]
        // SkiaSharp Canvas Load, Resize, Save
        public void SkiaCanvasLoadResizeSaveBenchmark()
        {
            foreach (var image in _images)
            {
                SkiaCanvasLoadResizeSave(image, ThumbnailSize, _outputDirectory);
            }
        }

        internal static void SkiaCanvasLoadResizeSave(string path, int size, string outputDirectory)
        {
            using (var input = File.OpenRead(path))
            {
                using (var inputStream = new SKManagedStream(input))
                {
                    using (var original = SKBitmap.Decode(inputStream))
                    {
                        var scaled = ScaledSize(original.Width, original.Height, size);
                        var surface = SKSurface.Create(scaled.width, scaled.height, original.ColorType, original.AlphaType);
                        var canvas = surface.Canvas;
                        var scale = (float)scaled.width / original.Width;
                        canvas.Scale(scale);
                        var paint = new SKPaint();
                        paint.FilterQuality = SKFilterQuality.High;
                        canvas.DrawBitmap(original, 0, 0, paint);
                        canvas.Flush();

                        using (var output = File.OpenWrite(OutputPath(path, outputDirectory, SkiaSharpCanvas)))
                        {
                            surface.Snapshot()
                                .Encode(SKEncodedImageFormat.Jpeg, Quality)
                                .SaveTo(output);
                        }
                    }
                }
            }
        }

        // [Benchmark(Description = "SkiaSharp Bitmap Load, Resize, Save")]
        // SkiaSharp Bitmap Load, Resize, Save
        public void SkiaBitmapLoadResizeSaveBenchmark()
        {
            foreach (var image in _images)
            {
                SkiaBitmapLoadResizeSave(image, ThumbnailSize, _outputDirectory);
            }
        }

        internal static void SkiaBitmapLoadResizeSave(string path, int size, string outputDirectory)
        {
            using (var input = File.OpenRead(path))
            {
                using (var inputStream = new SKManagedStream(input))
                {
                    using (var original = SKBitmap.Decode(inputStream))
                    {
                        var scaled = ScaledSize(original.Width, original.Height, size);
                        using (var resized = original.Resize(new SKImageInfo(scaled.width, scaled.height), SKBitmapResizeMethod.Lanczos3))
                        {
                            if (resized == null)
                                return;

                            using (var image = SKImage.FromBitmap(resized))
                            {
                                using (var output = File.OpenWrite(OutputPath(path, outputDirectory, SkiaSharpBitmap)))
                                {
                                    image.Encode(SKEncodedImageFormat.Jpeg, Quality)
                                        .SaveTo(output);
                                }
                            }
                        }
                    }
                }
            }
        }

        internal static void SkiaBitmapResize(string path, int size)
        {
            using (var input = File.OpenRead(path))
            {
                using (var inputStream = new SKManagedStream(input))
                {
                    using (var original = SKBitmap.Decode(inputStream))
                    {
                        var scaled = ScaledSize(original.Width, original.Height, size);
                        using (var resized = original.Resize(new SKImageInfo(scaled.width, scaled.height), SKBitmapResizeMethod.Lanczos3))
                        {
                            if (resized == null)
                                return;

                            using (var image = SKImage.FromBitmap(resized))
                            {
                                using (var output = File.OpenWrite(path))
                                {
                                    image.Encode(SKEncodedImageFormat.Jpeg, Quality)
                                        .SaveTo(output);
                                }
                            }
                        }
                    }
                }
            }
        }

        
    }
}
