using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ApiBase.Models.BusinessAccess
{
    public class BaseClass
    {
        private readonly IHostingEnvironment hostingEnvironment;

        public BaseClass() { }

        public BaseClass(IHostingEnvironment environment)
        {
            hostingEnvironment = environment;
        }

        /// <summary>
        /// Lists the select language.
        /// </summary>
        /// <param name="selected">The selected.</param>
        /// <returns>list select language</returns>
        public List<SelectListItem> ListSelectLanguage(string selected)
        {
            var list_lang = LanguageModels.AvailableLanguages;
            var list_item_lang = new List<SelectListItem>();

            foreach (var it in list_lang)
            {
                list_item_lang.Add(new SelectListItem { Selected = selected == it.LangCultureName ? true : false, Text = it.LangFullName.ToString(), Value = it.LangCultureName.ToString() });
            }

            return list_item_lang;
        }

        /// <summary>
        /// Gets the size paging public.
        /// </summary>
        /// <param name="selectedValue">The selected value.</param>
        /// <returns>Get Size Paging Public</returns>
        public List<SelectListItem> GetSizePagingPublic(int selectedValue)
        {
            List<SelectListItem> sizeDrop = new List<SelectListItem>();
            sizeDrop.AddRange(new SelectListItem[]
            {
                new SelectListItem { Selected = selectedValue == 9 ? true : false, Text = "9", Value = "9" },
                new SelectListItem { Selected = selectedValue == 18 ? true : false, Text = "18", Value = "18" },
                new SelectListItem { Selected = selectedValue == 36 ? true : false, Text = "36", Value = "36" },
                new SelectListItem { Selected = selectedValue == 99 ? true : false, Text = "99", Value = "99" }
            });
            return sizeDrop;
        }

        /// <summary>
        /// Check is Images
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        public static bool IsImage(IFormFile file)
        {
            if (file.ContentType.Contains("image"))
            {
                return true;
            }

            string[] formats = new string[] { ".jpg", ".png", ".gif", ".jpeg" };

            foreach (var item in formats)
            {
                if (file.FileName.Contains(item))
                {
                    return true;
                }
            }

            return false;
        }

        /// <summary>
        /// Get Unique FileName
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static string GetUniqueFileName(string fileName)
        {
            fileName = Path.GetFileName(fileName);
            return Path.GetFileNameWithoutExtension(fileName)
                      + "_"
                      + Guid.NewGuid().ToString().Substring(0, 4)
                      + Path.GetExtension(fileName);
        }

        public static async Task<int> ReadStream(Stream stream, int bufferSize)
        {
            var buffer = new byte[bufferSize];

            int bytesRead;
            int totalBytes = 0;

            do
            {
                bytesRead = await stream.ReadAsync(buffer, 0, bufferSize);
                totalBytes += bytesRead;
            } while (bytesRead > 0);
            return totalBytes;
        }
    }
}
