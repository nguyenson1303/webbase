using System.IO;
using System.Threading.Tasks;
using ApiBase.Models.BusinessAccess;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class DownloadController : Controller
    {
        //GET api/download/path_file
        [HttpGet]
        [HttpGet, Authorize]
        public async Task<IActionResult> Download(string filename)
        {
            if (!string.IsNullOrEmpty(filename))
            {
                filename = filename.Replace("/", "\\");
            }
            BaseClass baseClass = new BaseClass();
            var path = Path.Combine(
                           Directory.GetCurrentDirectory(),
                           "wwwroot", filename);

            var memory = new MemoryStream();
            using (var stream = new FileStream(path, FileMode.Open))
            {
                await stream.CopyToAsync(memory);
            }
            memory.Position = 0;

            return File(memory, baseClass.GetContentType(path), Path.GetFileName(path));
        }
    }
}
