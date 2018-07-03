/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    //// config.uiColor = '#AADC6E';
    config.language = 'vi';
    config.allowedContent = true;
    config.extraAllowedContent = '*(*);*{*}';
    config.ignoreEmptyParagraph = false;
    config.filebrowserBrowseUrl = '/Areas/admin/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Areas/admin/ckfinder/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Areas/admin/ckfinder/ckfinder.html?Type=Flash';
    config.filebrowserUploadUrl = '/Areas/admin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    config.filebrowserImageUploadUrl = '/Areas/admin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images';
    config.filebrowserFlashUploadUrl = '/Areas/admin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';
};
