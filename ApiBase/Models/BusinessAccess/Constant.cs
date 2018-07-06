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
        public const string MessageUpdateCompleted = "Cập nhật thành công";

        /// <summary>
        /// UpdateUnCompleted
        /// </summary>
        public const string MessageUpdateUncompleted = "Cập nhật thất bại";

        /// <summary>
        /// CreateCompleted
        /// </summary>
        public const string MessageCreateCompleted = "Tạo mới thành công";

        /// <summary>
        /// CreateUncompleted
        /// </summary>
        public const string MessageCreateUncompleted = "Tạo mới thất bại";

        /// <summary>
        /// DeleteCompleted
        /// </summary>
        public const string MessageDeleteCompleted = "Xóa dữ liệu thành công";

        /// <summary>
        /// DeleteUncompleted
        /// </summary>
        public const string MessageDeleteUncompleted = "Xóa dữ liệu thất bại";

        /// <summary>
        /// UpdateUnCompleted
        /// </summary>
        public const string MessagePermissionDenied = "Bạn không có quyền thực hiện hành động này";

        /// <summary>
        /// UpdateUnCompleted
        /// </summary>
        public const string MessageNotExist = "Dữ liệu không tồn tại";

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

        /// <summary>
        /// No exist
        /// </summary>
        public const int NotExist = 4;

        #endregion

    }
}