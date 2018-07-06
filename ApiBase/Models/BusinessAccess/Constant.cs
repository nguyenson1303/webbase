namespace ApiBase.Models.BusinessAccess
{
    using System;
    using System.Net.Mail;

    /// <summary>
    /// Global common
    /// </summary>
    public class Constant
    {
        #region Message 

        /// <summary>
        /// UpdateCompleted
        /// </summary>
        public const string UpdateCompleted = "Cập nhật thành công!";

        /// <summary>
        /// UpdateUnCompleted
        /// </summary>
        public const string UpdateUncompleted = "Cập nhật thất bại!";

        /// <summary>
        /// CreateCompleted
        /// </summary>
        public const string CreateCompleted = "Tạo mới thành công!";

        /// <summary>
        /// CreateUncompleted
        /// </summary>
        public const string CreateUncompleted = "Tạo mới thất bại!";

        /// <summary>
        /// DeleteCompleted
        /// </summary>
        public const string DeleteCompleted = "Xóa dữ liệu thành công!";

        /// <summary>
        /// DeleteUncompleted
        /// </summary>
        public const string DeleteUncompleted = "Xóa dữ liệu thất bại!";

        /// <summary>
        /// UpdateUnCompleted
        /// </summary>
        public const string PermissionDenied = "Bạn không có quyền thực hiện hành động này!";

        #endregion

        #region Status Code

        /// <summary>
        /// Success
        /// </summary>
        public const int Success = 1;

        /// <summary>
        /// Fail
        /// </summary>
        public const int Fail = 2;

        /// <summary>
        /// Permission Denied
        /// </summary>
        public const int PermissionDeniedCode = 3;

        #endregion


    }
}