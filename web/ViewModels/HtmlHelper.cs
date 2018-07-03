namespace Web.ViewModels
{
    using System.Web.Mvc;

    /// <summary>
    /// Html Helpers
    /// </summary>
    public static class HtmlHelpers
    {
        /// <summary>
        /// Determines whether the specified action name is active.
        /// </summary>
        /// <param name="htmlHelper">The HTML helper.</param>
        /// <param name="actionName">Name of the action.</param>
        /// <param name="controllerName">Name of the controller.</param>
        /// <param name="classActive">The class active.</param>
        /// <param name="currentAction">The current action.</param>
        /// <param name="currentController">The current controller.</param>
        /// <returns>Html String</returns>
        public static MvcHtmlString IsActive(this HtmlHelper htmlHelper, string actionName, string controllerName, string classActive, string currentAction, string currentController)
        {
            var returnActive = actionName == currentAction && controllerName == currentController;

            return new MvcHtmlString(returnActive ? classActive : string.Empty);
        }
    }
}