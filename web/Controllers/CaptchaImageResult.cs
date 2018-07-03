namespace Web.Controllers
{
    using System;
    using System.Drawing;
    using System.Drawing.Imaging;
    using System.Web;
    using System.Web.Mvc;

    /// <summary>
    /// Captcha Image Result
    /// </summary>
    public class CaptchaImageResult : ActionResult
    {
        /// <summary>
        /// Enables processing of the result of an action method by a custom type that inherits from the <see cref="T:System.Web.Mvc.ActionResult" /> class.
        /// </summary>
        /// <param name="context">The context in which the result is executed. The context information includes the controller, HTTP content, request context, and route data.</param>
        public override void ExecuteResult(ControllerContext context)
        {
            Bitmap bmp = new Bitmap(120, 40);
            Graphics g = Graphics.FromImage(bmp);
            g.Clear(Color.White);
            string randomString = this.GetCaptchaString(4);
            context.HttpContext.Session["captchastring"] = randomString;
            g.DrawString(randomString, new Font("Courier", 16), new SolidBrush(Color.Navy), 2, 2);
            HttpResponseBase response = context.HttpContext.Response;
            response.ContentType = "image/jpeg";
            bmp.Save(response.OutputStream, ImageFormat.Jpeg);
            bmp.Dispose();
        }

        /// <summary>
        /// Gets the captcha string.
        /// </summary>
        /// <param name="length">The length.</param>
        /// <returns>Get Captcha String</returns>
        public string GetCaptchaString(int length)
        {
            int intZero = '0';
            int intNine = '9';
            int intA = 'a';
            int intZ = 'z';
            int intCount = 0;
            int intRandomNumber = 0;
            string strCaptchaString = string.Empty;

            Random random = new Random(System.DateTime.Now.Millisecond);

            while (intCount < length)
            {
                intRandomNumber = random.Next(intZero, intZ);
                if ((intRandomNumber >= intZero && intRandomNumber <= intNine) || (intRandomNumber >= intA && intRandomNumber <= intZ))
                {
                    strCaptchaString = strCaptchaString + (char)intRandomNumber;
                    intCount = intCount + 1;
                }
            }

            return strCaptchaString;
        }
    }
}