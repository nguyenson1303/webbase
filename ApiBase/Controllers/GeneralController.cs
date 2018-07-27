using ApiBase.Models.AdminViewModels;
using ApiBase.Models.BusinessAccess;
using ApiBase.Models.DB;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ApiBase.Controllers
{
    [Route("api/[controller]")]
    public class GeneralController : Controller
    {
        // GET api/<controller>/5
        [HttpGet("{id}"), Authorize(Roles = "Admin")]
        public IActionResult Get(int? id, string lang)
        {
            IActionResult response = null;
            GeneralModels generalModels = new GeneralModels();
            General general = new General();
            var generalView = new AdminGeneralView();

            id = id ?? 0;

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            general = generalModels.GetGeneral((int)id, lang);
            if(general != null)
            {
                generalView.GeneralId = general.GeneralId;
                generalView.GeneralName = general.GeneralName;
                generalView.GeneralContent = general.GeneralContent;
                generalView.Show = general.Show;
                generalView.Lang = general.Lang;

                response = Json(generalView);
            }

            return response;
        }

        // GET api/<controller>/5
        [HttpGet("getGeneral/{name}"), Authorize]
        public IActionResult GetGeneral(string name, string lang)
        {
            IActionResult response = null;
            GeneralModels generalModels = new GeneralModels();
            General general = new General();
            var generalView = new AdminGeneralView();

            if (string.IsNullOrEmpty(lang))
            {
                lang = LanguageModels.ActiveLanguage().LangCultureName;
            }

            general = generalModels.GetGeneral(name, lang);
            if (general != null)
            {
                generalView.GeneralId = general.GeneralId;
                generalView.GeneralName = general.GeneralName;
                generalView.GeneralContent = general.GeneralContent;
                generalView.Show = general.Show;
                generalView.Lang = general.Lang;

                response = Json(generalView);
            }

            return response;
        }

        // POST api/<controller>
        [HttpPost, Authorize(Roles = "Admin")]
        public IActionResult Post([FromBody]AdminGeneralEditView generalView)
        {
            IActionResult response = null;
            GeneralModels generalModels = new GeneralModels();
            General general = new General();
            var rt = false;

            general.GeneralName = generalView.GeneralName;
            general.GeneralContent = generalView.GeneralContent;
            general.Show = generalView.Show;
            general.Lang = generalView.Lang;

            rt = generalModels.Add(general);

            if (rt)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageCreateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageCreateUncompleted });
            }

            return response;
        }

        // PUT api/<controller>/5
        [HttpPut("{name}")]
        public IActionResult Put(string name, [FromBody]AdminGeneralEditView generalView)
        {
            IActionResult response = null;
            GeneralModels generalModels = new GeneralModels();
            General general = null;
            var rt = false;

            general = generalModels.GetGeneral(name, generalView.Lang);

            if(general != null)
            {
                general.GeneralName = generalView.GeneralName;
                general.GeneralContent = generalView.GeneralContent;
                general.Show = generalView.Show;
                general.Lang = generalView.Lang;

                rt = generalModels.Update(general);
            }
            else
            {
                general = new General();
                general.GeneralName = generalView.GeneralName;
                general.GeneralContent = generalView.GeneralContent;
                general.Show = generalView.Show;
                general.Lang = generalView.Lang;

                rt = generalModels.Add(general);
            }
            
            if (rt)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageUpdateUncompleted });
            }

            return response;
        }

        // PUT api/<controller>/5
        [HttpPut("updateGeneral{id}")]
        public IActionResult Put(int id, [FromBody]AdminGeneralEditView generalView)
        {
            IActionResult response = null;
            GeneralModels generalModels = new GeneralModels();
            General general = null;
            var rt = false;

            general = generalModels.GetGeneral(id, generalView.Lang);

            if (general != null)
            {
                general.GeneralName = generalView.GeneralName;
                general.GeneralContent = generalView.GeneralContent;
                general.Show = generalView.Show;
                general.Lang = generalView.Lang;

                rt = generalModels.Update(general);
            }
            else
            {
                general = new General();
                general.GeneralName = generalView.GeneralName;
                general.GeneralContent = generalView.GeneralContent;
                general.Show = generalView.Show;
                general.Lang = generalView.Lang;

                rt = generalModels.Add(general);
            }

            if (rt)
            {
                response = Json(new { code = Constant.Success, message = Constant.MessageUpdateCompleted });
            }
            else
            {
                response = Json(new { code = Constant.Fail, message = Constant.MessageUpdateUncompleted });
            }

            return response;
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}/{lang}"), Authorize(Roles = "Admin")]
        public IActionResult Delete(int id, string lang)
        {
            IActionResult response = null;
            GeneralModels generalModels = new GeneralModels();
            General general = null;
            general = generalModels.GetGeneral((int)id, lang);

            if (general != null)
            {
                ////delete category
                bool rt = generalModels.DeleteById((int)id);

                if (rt)
                {
                    response = Json(new { code = Constant.Success, message = Constant.MessageDeleteCompleted });
                }
                else
                {
                    response = Json(new { code = Constant.Fail, message = Constant.MessageDeleteUncompleted });
                }
            }
            else
            {
                response = Json(new { code = Constant.NotExist, message = Constant.MessageNotExist });
            }

            return response;
        }
    }
}
