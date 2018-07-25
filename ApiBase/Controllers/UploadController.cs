using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using ApiBase.Models.BusinessAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using SkiaSharp;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class UploadController : Controller
    {
        private IHostingEnvironment _hostingEnvironment;

        public UploadController(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        [HttpPost]
        [Authorize]
        [DisableRequestSizeLimit]
        public ActionResult UploadFile()
        {
            try
            {
                string smallPath = string.Empty;
                string imageSmall = string.Empty;
                string imageLager = string.Empty;

                int thumbnailSize = 150;
                int quality = 100;

                var file = Request.Form.Files[0];
                string folderName = Request.Form["FilePath"] + DateTime.Now.Year.ToString() + "\\" + DateTime.Now.Month.ToString();
                string fileOld = Request.Form["FileOld"];
                string thumbnailSizeStr = Request.Form["ThumbnailSize"];
                if (!string.IsNullOrEmpty(thumbnailSizeStr)) {
                    thumbnailSize = int.Parse(thumbnailSizeStr);
                }

                string webRootPath = _hostingEnvironment.WebRootPath;
                string newPath = Path.Combine(webRootPath, folderName);
                if (!Directory.Exists(newPath))
                {
                    Directory.CreateDirectory(newPath);
                }
                if (file.Length > 0)
                {
                    var uniqueName = BaseClass.GetUniqueFileName(ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"'));
                    imageSmall =  "sc_small_" + uniqueName;
                    imageLager =  "sc_full_" + uniqueName;

                    if (!string.IsNullOrEmpty(fileOld))
                    {
                        string fileDelete = Path.Combine(webRootPath, fileOld.Replace("/", "\\"));
                        if (System.IO.File.Exists(fileDelete))
                        {
                            System.IO.File.Delete(fileDelete);
                        }

                        string fileDelete2 = Path.Combine(webRootPath, fileOld.Replace("/", "\\").Replace("sc_small_", "sc_full_"));
                        if (System.IO.File.Exists(fileDelete2))
                        {
                            System.IO.File.Delete(fileDelete2);
                        }
                    }

                    smallPath = Path.Combine(newPath, imageSmall);

                    // save image full size
                    string fullPath = Path.Combine(newPath, imageLager);
                    using (var stream = new FileStream(fullPath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }

                    // save image Resize
                    var fileType = Path.GetExtension(fullPath);

                    using (var input = System.IO.File.OpenRead(fullPath))
                    {
                        using (var inputStream = new SKManagedStream(input))
                        {
                            using (var original = SKBitmap.Decode(inputStream))
                            {
                                var scaled = LoadResizeSave.ScaledSize(original.Width, original.Height, thumbnailSize);
                                using (var resized = original.Resize(new SKImageInfo(scaled.width, scaled.height), SKBitmapResizeMethod.Lanczos3))
                                {
                                    if (resized != null)
                                    {
                                        using (var image = SKImage.FromBitmap(resized))
                                        {
                                            using (var output = System.IO.File.OpenWrite(smallPath))
                                            {
                                                image.Encode(LoadResizeSave.GetSkiaTypeImage(fileType), quality)
                                                    .SaveTo(output);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                }
                // return path thumbnail image
                string returnPath = (folderName + "\\" + imageSmall).Replace("\\", "/");
                return Json(returnPath);
            }
            catch (System.Exception ex)
            {
                return Json(string.Empty);
            }
        }

        
    }
}
