using System;
using System.IO;
using System.Text.RegularExpressions;

namespace Web.Utils
{
    public class HtmlUtils
    {
        internal static int GetPageCount(string path)
        {
            var content = File.ReadAllText(path);
            return Regex.Matches(content, "<A.*>.*</a>").Count;
        }

        internal static object GetPageContent(string path, int? page)
        {
            var content = File.ReadAllText(path);
            var match = Regex.Match(content, string.Format("<A name={0}></a>.*<A name={1}>", page, page + 1), RegexOptions.Singleline);
            if (match.Success)
            {
                return match.Value;
            }
            else
            {
                match = Regex.Match(content, string.Format("<A name={0}></a>.*</BODY>", page));
                if (match.Success)
                {
                    return match.Value;
                }
            }

            return string.Empty;
        }
    }
}