/// <summary>
/// Web
/// </summary>
namespace Web
{
    using System.Web.Mvc;
    using System.Web.Routing;

    /// <summary>
    /// the Route Config
    /// </summary>
    public class RouteConfig
    {
        /// <summary>
        /// Registers the routes.
        /// </summary>
        /// <param name="routes">The routes.</param>
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "_order_success",
                url: "{lang}/tao-don-hang-thanh-cong/{order}",
                defaults: new { lang = "vi", controller = "cart", action = "order_success", order = UrlParameter.Optional });

            routes.MapRoute(
                name: "_payment",
                url: "{lang}/xac-nhan-don-hang/{order}",
                defaults: new { lang = "vi", controller = "cart", action = "payment", order = UrlParameter.Optional });

            routes.MapRoute(
                name: "_order",
                url: "{lang}/thong-tin-dat-hang",
                defaults: new { lang = "vi", controller = "cart", action = "order" });

            routes.MapRoute(
                name: "_cart",
                url: "{lang}/gio-hang",
                defaults: new { lang = "vi", controller = "cart", action = "cart" });

            routes.MapRoute(
                name: "_order_view",
                url: "{lang}/don-hang/{fcode}",
                defaults: new { lang = "vi", controller = "account", action = "order_view", fcode = UrlParameter.Optional });

            routes.MapRoute(
                name: "_changepassword",
                url: "{lang}/doi-mat-khau",
                defaults: new { lang = "vi", controller = "account", action = "change_password" });

            routes.MapRoute(
                name: "_orderhistory",
                url: "{lang}/lich-su-giao-dich",
                defaults: new { lang = "vi", controller = "account", action = "order_history" });

            routes.MapRoute(
                name: "_myaccount",
                url: "{lang}/thong-tin-ca-nhan",
                defaults: new { lang = "vi", controller = "account", action = "my_account" });

            routes.MapRoute(
                name: "_login",
                url: "{lang}/dang-nhap",
                defaults: new { lang = "vi", controller = "account", action = "login" });

            routes.MapRoute(
                name: "_register",
                url: "{lang}/dang-ky",
                defaults: new { lang = "vi", controller = "account", action = "register" });

            routes.MapRoute(
                name: "_logout",
                url: "{lang}/thoat",
                defaults: new { lang = "vi", controller = "account", action = "logout" });

            routes.MapRoute(
                name: "_service",
                url: "{lang}/dich-vu/{Link}-{id}",
                defaults: new { lang = "vi", controller = "news", action = "posts", id = UrlParameter.Optional, Link = UrlParameter.Optional, type = Web.Models.CommonGlobal.CateService });

            routes.MapRoute(
                name: "_service_only",
                url: "{lang}/dich-vu",
                defaults: new { lang = "vi", controller = "news", action = "posts", type = Web.Models.CommonGlobal.CateService });

            routes.MapRoute(
                name: "_post_detail",
                url: "{lang}/bai-viet/{Link}-{id}",
                defaults: new { lang = "vi", controller = "news", action = "post", id = UrlParameter.Optional, Link = UrlParameter.Optional });

            routes.MapRoute(
                name: "_post",
                url: "{lang}/tin-tuc/{Link}-{id}",
                defaults: new { lang = "vi", controller = "news", action = "posts", id = UrlParameter.Optional, Link = UrlParameter.Optional, type = Web.Models.CommonGlobal.CateNews });

            routes.MapRoute(
                name: "_post_only",
                url: "{lang}/tin-tuc",
                defaults: new { lang = "vi", controller = "news", action = "posts", type = Web.Models.CommonGlobal.CateNews });

            routes.MapRoute(
                name: "_lookbook",
                url: "{lang}/mat-bang/{Link}-{id}",
                defaults: new { lang = "vi", controller = "gallery", action = "lookbook", id = UrlParameter.Optional, Link = UrlParameter.Optional, type = Web.Models.CommonGlobal.CateLookBook });

            routes.MapRoute(
                name: "_lookbook_only",
                url: "{lang}/mat-bang",
                defaults: new { lang = "vi", controller = "gallery", action = "lookbook", type = Web.Models.CommonGlobal.CateLookBook });

            routes.MapRoute(
                name: "_lookbook_detail",
                url: "{lang}/mat-bang/{id}",
                defaults: new { lang = "vi", controller = "gallery", action = "LookbookDetail", id = UrlParameter.Optional, Link = UrlParameter.Optional });

            routes.MapRoute(
                name: "_content",
                url: "{lang}/noi-dung/{Link}-{id}",
                defaults: new { lang = "vi", controller = "home", action = "content", id = UrlParameter.Optional, Link = UrlParameter.Optional });

            routes.MapRoute(
                name: "_about",
                url: "{lang}/gioi-thieu",
                defaults: new { lang = "vi", controller = "home", action = "about", id = UrlParameter.Optional });

            routes.MapRoute(
                name: "_showroom",
                url: "{lang}/spa",
                defaults: new { lang = "vi", controller = "home", action = "contact", id = UrlParameter.Optional });

            routes.MapRoute(
                name: "_product_search",
                url: "{lang}/tim-kiem/{key}",
                defaults: new { lang = "vi", controller = "product", action = "search", key = UrlParameter.Optional });

            routes.MapRoute(
                name: "_product_compare",
                url: "{lang}/so-sanh",
                defaults: new { lang = "vi", controller = "product", action = "compare" });

            routes.MapRoute(
                name: "_product_whishlist",
                url: "{lang}/yeu-thich",
                defaults: new { lang = "vi", controller = "product", action = "whishlist" });

            routes.MapRoute(
                name: "_collection_Link",
                url: "{lang}/bo-suu-tap/{Link}-{id}",
                defaults: new { lang = "vi", controller = "product", action = "collection", id = UrlParameter.Optional, Link = UrlParameter.Optional });

            routes.MapRoute(
                name: "_products_detail_Link",
                url: "{lang}/chi-tiet/{Link}-{id}",
                defaults: new { lang = "vi", controller = "product", action = "product", id = UrlParameter.Optional, Link = UrlParameter.Optional });

            routes.MapRoute(
                name: "_product_only",
                url: "{lang}/san-pham",
                defaults: new { lang = "vi", controller = "product", action = "products" });

            routes.MapRoute(
                name: "_products_Link",
                url: "{lang}/san-pham/{Link}-{id}",
                defaults: new { lang = "vi", controller = "product", action = "products", id = UrlParameter.Optional, Link = UrlParameter.Optional });

            routes.MapRoute(
                name: "Default",
                url: "{lang}/{controller}/{action}/{id}",
                defaults: new { lang = "vi", controller = "home", action = "index", id = UrlParameter.Optional });

            routes.MapRoute(
                name: "Default_Link",
                url: "{lang}/{controller}/{action}/{id}/{Link}",
                defaults: new { lang = "vi", controller = "home", action = "content", id = UrlParameter.Optional, Link = UrlParameter.Optional });

            routes.MapRoute(
                name: "Default_Seach",
                url: "{lang}/seach/{key}",
                defaults: new { lang = "vi", controller = "product", action = "search", key = UrlParameter.Optional });
        }
    }
}