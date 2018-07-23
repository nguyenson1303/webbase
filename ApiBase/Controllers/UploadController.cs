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
                string fullPathSmall = string.Empty;
                string imageSmall = string.Empty;
                string imageLager = string.Empty;

                var file = Request.Form.Files[0];
                string folderName = Request.Form["FilePath"] + DateTime.Now.Year.ToString() + "\\" + DateTime.Now.Month.ToString();
                string fileOld = Request.Form["FileOld"];

                string webRootPath = _hostingEnvironment.WebRootPath;
                string newPath = Path.Combine(webRootPath, folderName);
                if (!Directory.Exists(newPath))
                {
                    Directory.CreateDirectory(newPath);
                }
                if (file.Length > 0)
                {
                   // string fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    imageSmall =  "sc_small_" + "_" + ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    imageLager =  "sc_full_" + "_" + ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');

                    if (!string.IsNullOrEmpty(fileOld))
                    {
                        string fileDelete = Path.Combine(fileOld);
                        if (System.IO.File.Exists(fileDelete))
                        {
                            System.IO.File.Delete(fileDelete);
                        }

                        string fileDelete2 = Path.Combine(fileOld.Replace("sc_small_", "sc_full_"));
                        if (System.IO.File.Exists(fileDelete2))
                        {
                            System.IO.File.Delete(fileDelete2);
                        }
                    }

                    fullPathSmall = Path.Combine(newPath, imageSmall);
                    using (var stream = new FileStream(fullPathSmall, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }

                    //string fullPathFull = Path.Combine(newPath, imageLager);
                    //using (var stream = new FileStream(fullPathFull, FileMode.Create))
                    //{
                    //    file.CopyTo(stream);
                    //}
                }
                string returnPath = (folderName + "\\" + imageSmall).Replace("\\", "/");
                return Json(returnPath);
            }
            catch (System.Exception ex)
            {
                return Json("Upload Failed: " + ex.Message);
            }
        }

        
    }
}
