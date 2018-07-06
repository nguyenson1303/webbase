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
        /// Data not Exist
        /// </summary>
        public const string MessageNotExist = "Dữ liệu không tồn tại";

        /// <summary>
        /// Data Exist
        /// </summary>
        public const string MessageDuplicate = "Dữ liệu trùng lặp";

        /// <summary>
        /// Data not Valid
        /// </summary>
        public const string MessageNotValid = "Dữ liệu không hợp lệ";

        /// <summary>
        /// Data not Exist
        /// </summary>
        public const string MessageConfirmPassword = "Vui lòng xác nhận lại mật khẩu";

        /// <summary>
        /// Data not empty
        /// </summary>
        public const string MessageDataEmpty = "Dữ liệu không được để trống";

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

        /// <summary>
        /// Duplicate
        /// </summary>
        public const int Duplicate = 5;

        /// <summary>
        /// Data Empty
        /// </summary>
        public const int Empty = 6;

        /// <summary>
        /// No Valid
        /// </summary>
        public const int NotValid = 7;

        #endregion

    }
}