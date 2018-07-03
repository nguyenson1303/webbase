namespace Web.Models
{
    using System.Drawing;
    using System.Drawing.Drawing2D;
    using System.Drawing.Imaging;

    /// <summary>
    /// Images Library
    /// </summary>
    public class ImagesLibrary
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ImagesLibrary"/> class.
        /// </summary>
        public ImagesLibrary()
        {
            ////
            //// TODO: Add constructor logic here
            ////
        }

        /// <summary>
        /// Anchor Position
        /// </summary>
        public enum AnchorPosition
        {
            /// <summary>
            /// The top
            /// </summary>
            Top,

            /// <summary>
            /// The center
            /// </summary>
            Center,

            /// <summary>
            /// The bottom
            /// </summary>
            Bottom,

            /// <summary>
            /// The left
            /// </summary>
            Left,

            /// <summary>
            /// The right
            /// </summary>
            Right
        }

        /// <summary>
        /// the Dimensions
        /// </summary>
        public enum Dimensions
        {
            /// <summary>
            /// The width
            /// </summary>
            Width,

            /// <summary>
            /// The height
            /// </summary>
            Height
        }

        /// <summary>
        /// Constrains the proportions.
        /// </summary>
        /// <param name="imagePhoto">The image photo.</param>
        /// <param name="size">The size.</param>
        /// <param name="dimension">The dimension.</param>
        /// <returns>Constrain Proportions</returns>
        public Image ConstrainProportions(Image imagePhoto, int size, Dimensions dimension)
        {
            int sourceWidth = imagePhoto.Width;
            int sourceHeight = imagePhoto.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;
            float percent = 0;

            switch (dimension)
            {
            case Dimensions.Width:
                percent = (float)size / (float)sourceWidth;
                break;
            default:
                percent = (float)size / (float)sourceHeight;
                break;
            }

            int destWidth = (int)(sourceWidth * percent);
            int destHeight = (int)(sourceHeight * percent);

            Bitmap bitmapPhoto = new Bitmap(destWidth, destHeight, PixelFormat.Format24bppRgb);
            bitmapPhoto.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);

            Graphics graphicsPhoto = Graphics.FromImage(bitmapPhoto);
            graphicsPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphicsPhoto.CompositingMode = CompositingMode.SourceCopy;
            graphicsPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphicsPhoto.InterpolationMode = InterpolationMode.NearestNeighbor;

            graphicsPhoto.DrawImage(imagePhoto, new Rectangle(destX, destY, destWidth, destHeight), new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight), GraphicsUnit.Pixel);

            graphicsPhoto.Dispose();

            return bitmapPhoto;
        }

        /// <summary>
        /// Crops the specified image photo.
        /// </summary>
        /// <param name="imagePhoto">The image photo.</param>
        /// <param name="width">The width.</param>
        /// <param name="height">The height.</param>
        /// <param name="anchor">The anchor.</param>
        /// <returns>the Crop</returns>
        public Image Crop(Image imagePhoto, int width, int height, AnchorPosition anchor)
        {
            int sourceWidth = imagePhoto.Width;
            int sourceHeight = imagePhoto.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;

            float numberPercent = 0;
            float numberPercentW = 0;
            float numberPercentH = 0;

            numberPercentW = (float)width / (float)sourceWidth;
            numberPercentH = (float)height / (float)sourceHeight;

            if (numberPercentH < numberPercentW)
            {
                numberPercent = numberPercentW;
                switch (anchor)
                {
                case AnchorPosition.Top:
                    destY = 0;
                    break;
                case AnchorPosition.Bottom:
                    destY = (int)(height - (sourceHeight * numberPercent));
                    break;
                default:
                    destY = (int)((height - (sourceHeight * numberPercent)) / 2);
                    break;
                }
            }
            else
            {
                numberPercent = numberPercentH;
                switch (anchor)
                {
                case AnchorPosition.Left:
                    destX = 0;
                    break;
                case AnchorPosition.Right:
                    destX = (int)(width - (sourceWidth * numberPercent));
                    break;
                default:
                    destX = (int)((width - (sourceWidth * numberPercent)) / 2);
                    break;
                }
            }

            int destWidth = (int)(sourceWidth * numberPercent);
            int destHeight = (int)(sourceHeight * numberPercent);

            Bitmap bitmapPhoto = new Bitmap(width, height, PixelFormat.Format24bppRgb);
            bitmapPhoto.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);

            Graphics graphicsPhoto = Graphics.FromImage(bitmapPhoto);
            graphicsPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphicsPhoto.CompositingMode = CompositingMode.SourceCopy;
            graphicsPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphicsPhoto.InterpolationMode = InterpolationMode.NearestNeighbor;

            graphicsPhoto.DrawImage(imagePhoto, new Rectangle(destX, destY, destWidth, destHeight), new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight), GraphicsUnit.Pixel);

            graphicsPhoto.Dispose();

            return bitmapPhoto;
        }

        /// <summary>
        /// Fixed the size.
        /// </summary>
        /// <param name="imagePhoto">The image photo.</param>
        /// <param name="width">The width.</param>
        /// <param name="height">The height.</param>
        /// <returns>Fixed Size</returns>
        public Image FixedSize(Image imagePhoto, int width, int height)
        {
            int sourceWidth = imagePhoto.Width;
            int sourceHeight = imagePhoto.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;

            float numberPercent = 0;
            float numberPercentW = 0;
            float numberPercentH = 0;

            numberPercentW = (float)width / (float)sourceWidth;
            numberPercentH = (float)height / (float)sourceHeight;

            ////if we have to pad the height pad both the top and the bottom
            ////with the difference between the scaled height and the desired height
            if (numberPercentH < numberPercentW)
            {
                numberPercent = numberPercentH;
                destX = (int)((width - (sourceWidth * numberPercent)) / 2);
            }
            else
            {
                numberPercent = numberPercentW;
                destY = (int)((height - (sourceHeight * numberPercent)) / 2);
            }

            int destWidth = (int)(sourceWidth * numberPercent);
            int destHeight = (int)(sourceHeight * numberPercent);

            Bitmap bitmapPhoto = new Bitmap(width, height, PixelFormat.Format24bppRgb);
            bitmapPhoto.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);

            Graphics graphicsPhoto = Graphics.FromImage(bitmapPhoto);
            graphicsPhoto.Clear(Color.White);
            graphicsPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphicsPhoto.CompositingMode = CompositingMode.SourceCopy;
            graphicsPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphicsPhoto.InterpolationMode = InterpolationMode.NearestNeighbor;

            graphicsPhoto.DrawImage(imagePhoto, new Rectangle(destX, destY, destWidth, destHeight), new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight), GraphicsUnit.Pixel);

            graphicsPhoto.Dispose();

            return bitmapPhoto;
        }

        /// <summary>
        /// Image the copy right.
        /// </summary>
        /// <param name="imagePhoto">The image photo.</param>
        /// <param name="copyright">The copyright.</param>
        /// <returns>Images Copy Right</returns>
        public System.Drawing.Image ImagesCopyRight(System.Drawing.Image imagePhoto, string copyright)
        {
            ////string WorkingDirectory = @"C:\Documents and Settings\sonnv\Desktop\test";

            ////create a image object containing the photograph to watermark
            ////System.Drawing.Image imgPhoto = System.Drawing.Image.FromFile(WorkingDirectory + "\\F15-Eagle3_1.jpg");
            int photoWidth = imagePhoto.Width;
            int photoHeight = imagePhoto.Height;

            ////create a Bitmap the Size of the original photograph
            Bitmap bitmapPhoto = new Bitmap(photoWidth, photoHeight, PixelFormat.Format24bppRgb);

            bitmapPhoto.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);

            ////load the Bitmap into a Graphics object
            Graphics graphicsPhoto = Graphics.FromImage(bitmapPhoto);

            ////create a image object containing the watermark
            ////System.Drawing.Image imgWatermark = new Bitmap(WorkingDirectory + "\\untitled.bmp");
            ////int wmWidth = imgWatermark.Width;
            ////int wmHeight = imgWatermark.Height;

            ////------------------------------------------------------------
            ////Step #1 - Insert Copyright message
            ////------------------------------------------------------------

            ////Set the rendering quality for this Graphics object
            graphicsPhoto.SmoothingMode = SmoothingMode.AntiAlias;
            graphicsPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphicsPhoto.CompositingMode = CompositingMode.SourceCopy;
            graphicsPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphicsPhoto.InterpolationMode = InterpolationMode.NearestNeighbor;

            ////Draws the photo Image object at original size to the graphics object.
            graphicsPhoto.DrawImage(
                imagePhoto,                               //// Photo Image object
                new Rectangle(0, 0, photoWidth, photoHeight), //// Rectangle structure
                0,                                      //// x-coordinate of the portion of the source image to draw.
                0,                                      //// y-coordinate of the portion of the source image to draw.
                photoWidth,                                //// Width of the portion of the source image to draw.
                photoHeight,                               //// Height of the portion of the source image to draw.
                GraphicsUnit.Pixel);                    //// Units of measure

            ////-------------------------------------------------------
            ////to maximize the size of the Copyright message we will
            ////test multiple Font sizes to determine the largest posible
            ////font we can use for the width of the Photograph
            ////define an array of point sizes you would like to consider as possiblities
            ////-------------------------------------------------------
            int[] sizes = new int[] { 16, 14, 12, 10, 8, 6, 4 };

            Font copyrightFont = null;
            SizeF copyrightSize = new SizeF();

            ////Loop through the defined sizes checking the length of the Copyright string
            ////If its length in pixles is less then the image width choose this Font size.
            for (int i = 0; i < 7; i++)
            {
                ////set a Font object to Arial (i)pt, Bold
                copyrightFont = new Font("tahoma", sizes[i], FontStyle.Bold);
                ////Measure the Copyright string in this Font
                copyrightSize = graphicsPhoto.MeasureString(copyright, copyrightFont);

                if (((ushort)copyrightSize.Width / 4) < (ushort)photoWidth)
                {
                    break;
                }
            }

            ////Since all photographs will have varying heights, determine a
            ////position 5% from the bottom of the image
            int verticalAxisPixlesFromBottom = (int)(photoHeight * .05);

            ////Now that we have a point size use the Copyrights string height
            ////to determine a y-coordinate to draw the string of the photograph
            float verticalAxisPosFromBottom = (photoHeight - verticalAxisPixlesFromBottom) - (copyrightSize.Height / 2);

            ////Determine its x-coordinate by calculating the center of the width of the image
            float horizontalAxisCenterOfImg = photoWidth / 2;

            ////Define the text layout by setting the text alignment to centered
            StringFormat stringFormat = new StringFormat();
            stringFormat.Alignment = StringAlignment.Far;

            ////define a Brush which is semi trasparent black (Alpha set to 153)
            SolidBrush semiTransBrush2 = new SolidBrush(Color.FromArgb(153, 0, 0, 0));

            ////Draw the Copyright string
            ////string of text
            ////font
            ////Brush
            ////Position
            graphicsPhoto.DrawString(copyright, copyrightFont, semiTransBrush2, new PointF(horizontalAxisCenterOfImg + 1, verticalAxisPosFromBottom + 1), stringFormat);

            ////define a Brush which is semi trasparent white (Alpha set to 153)
            SolidBrush semiTransBrush = new SolidBrush(Color.FromArgb(153, 255, 255, 255));

            ////Draw the Copyright string a second time to create a shadow effect
            ////Make sure to move this text 1 pixel to the right and down 1 pixel
            ////string of text
            ////font
            ////Brush
            ////Position
            ////Text alignment
            graphicsPhoto.DrawString(copyright, copyrightFont, semiTransBrush, new PointF(horizontalAxisCenterOfImg, verticalAxisPosFromBottom), stringFormat);                               

            return bitmapPhoto;
        }

        /// <summary>
        /// Image the copyright and watermark.
        /// </summary>
        /// <param name="imagePhoto">The Image photo.</param>
        /// <param name="copyright">The copyright.</param>
        /// <param name="imageWatermark">The Image watermark.</param>
        /// <returns>Images Copyright And Watermark</returns>
        public System.Drawing.Image ImagesCopyrightAndWatermark(System.Drawing.Image imagePhoto, string copyright, System.Drawing.Image imageWatermark)
        {
            ////string WorkingDirectory = @"C:\Documents and Settings\sonnv\Desktop\test";

            ////create a image object containing the photograph to watermark
            ////System.Drawing.Image imgPhoto = System.Drawing.Image.FromFile(WorkingDirectory + "\\F15-Eagle3_1.jpg");
            int photoWidth = imagePhoto.Width;
            int photoHeight = imagePhoto.Height;

            ////create a Bitmap the Size of the original photograph
            Bitmap bitmapPhoto = new Bitmap(photoWidth, photoHeight, PixelFormat.Format24bppRgb);

            bitmapPhoto.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);

            ////load the Bitmap into a Graphics object
            Graphics graphicsPhoto = Graphics.FromImage(bitmapPhoto);

            ////create a image object containing the watermark
            ////System.Drawing.Image imgWatermark = new Bitmap(WorkingDirectory + "\\untitled.bmp");
            int watermarkWidth = imageWatermark.Width;
            int watermarkHeight = imageWatermark.Height;

            ////------------------------------------------------------------
            ////Step #1 - Insert Copyright message
            ////------------------------------------------------------------

            ////Set the rendering quality for this Graphics object
            graphicsPhoto.SmoothingMode = SmoothingMode.AntiAlias;
            graphicsPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphicsPhoto.CompositingMode = CompositingMode.SourceCopy;
            graphicsPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphicsPhoto.InterpolationMode = InterpolationMode.NearestNeighbor;

            ////Draws the photo Image object at original size to the graphics object.
            graphicsPhoto.DrawImage(
                imagePhoto,                               //// Photo Image object
                new Rectangle(0, 0, photoWidth, photoHeight), //// Rectangle structure
                0,                                      //// x-coordinate of the portion of the source image to draw.
                0,                                      //// y-coordinate of the portion of the source image to draw.
                photoWidth,                                //// Width of the portion of the source image to draw.
                photoHeight,                               //// Height of the portion of the source image to draw.
                GraphicsUnit.Pixel);                    //// Units of measure

            ////-------------------------------------------------------
            ////to maximize the size of the Copyright message we will
            ////test multiple Font sizes to determine the largest posible
            ////font we can use for the width of the Photograph
            ////define an array of point sizes you would like to consider as possiblities
            ////-------------------------------------------------------
            int[] sizes = new int[] { 16, 14, 12, 10, 8, 6, 4 };

            Font copyrightFont = null;
            SizeF copyrightSize = new SizeF();

            ////Loop through the defined sizes checking the length of the Copyright string
            ////If its length in pixles is less then the image width choose this Font size.
            for (int i = 0; i < 7; i++)
            {
                ////set a Font object to Arial (i)pt, Bold
                copyrightFont = new Font("tahoma", sizes[i], FontStyle.Italic);
                ////Measure the Copyright string in this Font
                copyrightSize = graphicsPhoto.MeasureString(copyright, copyrightFont);

                if (((ushort)copyrightSize.Width / 4) < (ushort)photoWidth)
                {
                    break;
                }
            }

            ////Since all photographs will have varying heights, determine a
            ////position 5% from the bottom of the image
            int verticalAxisPixlesFromBottom = (int)(photoHeight * .05);

            ////Now that we have a point size use the Copyrights string height
            ////to determine a y-coordinate to draw the string of the photograph
            float verticalAxisPosFromBottom = (photoHeight - verticalAxisPixlesFromBottom) - (copyrightSize.Height / 2);

            ////Determine its x-coordinate by calculating the center of the width of the image
            float horizontalAxisCenterOfImg = photoWidth / 2;

            ////Define the text layout by setting the text alignment to centered
            StringFormat stringFormat = new StringFormat();
            stringFormat.Alignment = StringAlignment.Center;

            ////define a Brush which is semi trasparent black (Alpha set to 153)
            SolidBrush semiTransBrush2 = new SolidBrush(Color.FromArgb(153, 0, 0, 0));

            ////Draw the Copyright string
            ////string of text
            ////font
            ////Brush
            ////Position
            graphicsPhoto.DrawString(copyright, copyrightFont, semiTransBrush2, new PointF(horizontalAxisCenterOfImg + 1, verticalAxisPosFromBottom + 1), stringFormat);

            ////define a Brush which is semi trasparent white (Alpha set to 153)
            SolidBrush semiTransBrush = new SolidBrush(Color.FromArgb(153, 255, 255, 255));

            ////Draw the Copyright string a second time to create a shadow effect
            ////Make sure to move this text 1 pixel to the right and down 1 pixel

            ////string of text
            ////font
            ////Brush
            ////Position
            graphicsPhoto.DrawString(copyright, copyrightFont, semiTransBrush, new PointF(horizontalAxisCenterOfImg, verticalAxisPosFromBottom), stringFormat);

            ////------------------------------------------------------------
            ////Step #2 - Insert Watermark image
            ////------------------------------------------------------------

            ////Create a Bitmap based on the previously modified photograph Bitmap
            Bitmap bitmapWatermark = new Bitmap(bitmapPhoto);
            bitmapWatermark.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);
            ////Load this Bitmap into a new Graphic Object
            Graphics graphicWatermark = Graphics.FromImage(bitmapWatermark);

            ////To achieve a transulcent watermark we will apply (2) color
            ////manipulations by defineing a ImageAttributes object and
            ////seting (2) of its properties.
            ImageAttributes imageAttributes = new ImageAttributes();

            ////The first step in manipulating the watermark image is to replace
            ////the background color with one that is trasparent (Alpha=0, R=0, G=0, B=0)
            ////to do this we will use a Colormap and use this to define a RemapTable
            ColorMap colorMap = new ColorMap();

            ////My watermark was defined with a background of 100% Green this will
            ////be the color we search for and replace with transparency
            colorMap.OldColor = Color.FromArgb(255, 0, 255, 0);
            colorMap.NewColor = Color.FromArgb(0, 0, 0, 0);

            ColorMap[] remapTable = { colorMap };

            imageAttributes.SetRemapTable(remapTable, ColorAdjustType.Bitmap);

            ////The second color manipulation is used to change the opacity of the
            ////watermark.  This is done by applying a 5x5 matrix that contains the
            ////coordinates for the RGBA space.  By setting the 3rd row and 3rd column
            ////to 0.7f we achive a level of opacity
            float[][] colorMatrixElements = { new float[] { 1.0f, 0.0f, 0.0f, 0.0f, 0.0f }, new float[] { 0.0f, 1.0f, 0.0f, 0.0f, 0.0f }, new float[] { 0.0f, 0.0f, 1.0f, 0.0f, 0.0f }, new float[] { 0.0f, 0.0f, 0.0f, 0.7f, 0.0f }, new float[] { 0.0f, 0.0f, 0.0f, 0.0f, 1.0f } };
            ColorMatrix watermarColorMatrix = new ColorMatrix(colorMatrixElements);

            imageAttributes.SetColorMatrix(watermarColorMatrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);

            ////For this example we will place the watermark in the upper right
            ////hand corner of the photograph. offset down 10 pixels and to the
            ////left 10 pixles

            int horizontalAxisPosOfWm = (photoWidth - watermarkWidth) - 10;
            int verticalAxisPosOfWm = 10;
            ////Set the detination Position
            //// x-coordinate of the portion of the source image to draw.
            //// y-coordinate of the portion of the source image to draw.
            //// Watermark Width
            //// Watermark Height
            //// Unit of measurment
            ////ImageAttributes Object
            graphicWatermark.DrawImage(imageWatermark, new Rectangle(horizontalAxisPosOfWm, verticalAxisPosOfWm, watermarkWidth, watermarkHeight), 0, 0, watermarkWidth, watermarkHeight, GraphicsUnit.Pixel, imageAttributes);   

            ////Replace the original photgraphs bitmap with the new Bitmap
            imagePhoto = bitmapWatermark;
            graphicsPhoto.Dispose();
            graphicWatermark.Dispose();

            return bitmapWatermark;
        }

        /// <summary>
        /// Image the watermark.
        /// </summary>
        /// <param name="imagePhoto">The Image photo.</param>
        /// <param name="imgWatermark">The Image watermark.</param>
        /// <returns>Images Watermark</returns>
        public System.Drawing.Image ImagesWatermark(System.Drawing.Image imagePhoto, System.Drawing.Image imgWatermark)
        {
            ////set a working directory
            ////string WorkingDirectory = @"C:\Documents and Settings\sonnv\Desktop\test";

            ////define a string of text to use as the Copyright message
            ////string Copyright = "Copyright © 2010";

            ////create a image object containing the photograph to watermark
            ////System.Drawing.Image imgPhoto = System.Drawing.Image.FromFile(WorkingDirectory + "\\F15-Eagle3_1.jpg");
            int photoWidth = imagePhoto.Width;
            int photoHeight = imagePhoto.Height;

            ////create a Bitmap the Size of the original photograph
            Bitmap bitmapPhoto = new Bitmap(photoWidth, photoHeight, PixelFormat.Format24bppRgb);

            bitmapPhoto.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);

            ////load the Bitmap into a Graphics object
            Graphics graphicsPhoto = Graphics.FromImage(bitmapPhoto);

            ////create a image object containing the watermark
            ////System.Drawing.Image imgWatermark = new Bitmap(WorkingDirectory + "\\untitled.bmp");
            int watermarkWidth = imgWatermark.Width;
            int watermarHeight = imgWatermark.Height;

            ////------------------------------------------------------------
            ////Step #2 - Insert Watermark image
            ////------------------------------------------------------------
            ////Set the rendering quality for this Graphics object
            graphicsPhoto.SmoothingMode = SmoothingMode.AntiAlias;
            graphicsPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphicsPhoto.CompositingMode = CompositingMode.SourceCopy;
            graphicsPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphicsPhoto.InterpolationMode = InterpolationMode.NearestNeighbor;

            ////Draws the photo Image object at original size to the graphics object.
            graphicsPhoto.DrawImage(
                imagePhoto,                               //// Photo Image object
                new Rectangle(0, 0, photoWidth, photoHeight), //// Rectangle structure
                0,                                      //// x-coordinate of the portion of the source image to draw.
                0,                                      //// y-coordinate of the portion of the source image to draw.
                photoWidth,                                //// Width of the portion of the source image to draw.
                photoHeight,                               //// Height of the portion of the source image to draw.
                GraphicsUnit.Pixel);                    //// Units of measure

            ////Create a Bitmap based on the previously modified photograph Bitmap
            Bitmap bitmapWatermark = new Bitmap(bitmapPhoto);
            bitmapWatermark.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);
            ////Load this Bitmap into a new Graphic Object
            Graphics graphicsWatermark = Graphics.FromImage(bitmapWatermark);

            ////To achieve a transulcent watermark we will apply (2) color
            ////manipulations by defineing a ImageAttributes object and
            ////seting (2) of its properties.
            ImageAttributes imageAttributes = new ImageAttributes();

            ////The first step in manipulating the watermark image is to replace
            ////the background color with one that is trasparent (Alpha=0, R=0, G=0, B=0)
            ////to do this we will use a Colormap and use this to define a RemapTable
            ColorMap colorMap = new ColorMap();

            ////My watermark was defined with a background of 100% Green this will
            ////be the color we search for and replace with transparency
            colorMap.OldColor = Color.FromArgb(255, 0, 255, 0);
            colorMap.NewColor = Color.FromArgb(0, 0, 0, 0);

            ColorMap[] remapTable = { colorMap };

            imageAttributes.SetRemapTable(remapTable, ColorAdjustType.Bitmap);

            ////The second color manipulation is used to change the opacity of the
            ////watermark.  This is done by applying a 5x5 matrix that contains the
            ////coordinates for the RGBA space.  By setting the 3rd row and 3rd column
            ////to 0.7f we achive a level of opacity
            float[][] colorMatrixElements = { new float[] { 1.0f, 0.0f, 0.0f, 0.0f, 0.0f }, new float[] { 0.0f, 1.0f, 0.0f, 0.0f, 0.0f }, new float[] { 0.0f, 0.0f, 1.0f, 0.0f, 0.0f }, new float[] { 0.0f, 0.0f, 0.0f, 0.7f, 0.0f }, new float[] { 0.0f, 0.0f, 0.0f, 0.0f, 1.0f } };
            ColorMatrix watermarkColorMatrix = new ColorMatrix(colorMatrixElements);

            imageAttributes.SetColorMatrix(watermarkColorMatrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);

            ////For this example we will place the watermark in the upper right
            ////hand corner of the photograph. offset down 10 pixels and to the
            ////left 10 pixles

            int horizontalAxisPosOfWm = (photoWidth - watermarkWidth) - 10;
            int verticalAxisPosOfWm = (photoHeight - watermarHeight) - 10;
            ////Set the detination Position
            //// x-coordinate of the portion of the source image to draw.
            //// y-coordinate of the portion of the source image to draw.
            //// Watermark Width
            //// Watermark Height
            //// Unit of measurment
            ////ImageAttributes Object
            graphicsWatermark.DrawImage(imgWatermark, new Rectangle(horizontalAxisPosOfWm, verticalAxisPosOfWm, watermarkWidth, watermarHeight), 0, 0, watermarkWidth, watermarHeight, GraphicsUnit.Pixel, imageAttributes);   

            ////Replace the original photgraphs bitmap with the new Bitmap
            imagePhoto = bitmapWatermark;
            graphicsPhoto.Dispose();
            graphicsWatermark.Dispose();

            return bitmapWatermark;

            ////save new image to file system.
            ////imgPhoto.Save(WorkingDirectory + "\\watermark_final.jpg", ImageFormat.Jpeg);
            ////imgPhoto.Dispose();
            ////imgWatermark.Dispose();
        }

        /// <summary>
        /// Scales the by percent.
        /// </summary>
        /// <param name="imagePhoto">The image photo.</param>
        /// <param name="percent">The percent.</param>
        /// <returns>Scale By Percent</returns>
        public Image ScaleByPercent(Image imagePhoto, int percent)
        {
            float numberPercent = (float)percent / 100;

            int sourceWidth = imagePhoto.Width;
            int sourceHeight = imagePhoto.Height;
            int sourceX = 0;
            int sourceY = 0;

            int destX = 0;
            int destY = 0;
            int destWidth = (int)(sourceWidth * numberPercent);
            int destHeight = (int)(sourceHeight * numberPercent);

            Bitmap bitmapPhoto = new Bitmap(destWidth, destHeight, PixelFormat.Format24bppRgb);
            bitmapPhoto.SetResolution(imagePhoto.HorizontalResolution, imagePhoto.VerticalResolution);

            Graphics graphicsPhoto = Graphics.FromImage(bitmapPhoto);
            graphicsPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphicsPhoto.CompositingMode = CompositingMode.SourceCopy;
            graphicsPhoto.PixelOffsetMode = PixelOffsetMode.HighQuality;
            graphicsPhoto.InterpolationMode = InterpolationMode.NearestNeighbor;

            graphicsPhoto.DrawImage(imagePhoto, new Rectangle(destX, destY, destWidth, destHeight), new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight), GraphicsUnit.Pixel);

            graphicsPhoto.Dispose();

            return bitmapPhoto;
        }
    }
}