USE [themanor]
GO
/****** Object:  Table [dbo].[_General]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_General](
	[GeneralID] [int] IDENTITY(1,1) NOT NULL,
	[GeneralName] [nvarchar](100) NOT NULL,
	[GeneralContent] [nvarchar](max) NULL,
	[Datemodified] [smalldatetime] NULL,
	[Show] [bit] NULL,
	[Lang] [nvarchar](10) NULL,
 CONSTRAINT [PK__General] PRIMARY KEY CLUSTERED 
(
	[GeneralID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_General] ON
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (1, N'pagename', N'Tonymoly việt nam', CAST(0xA6360414 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (3, N'contact', N'', CAST(0xA4A00381 AS SmallDateTime), 1, N'vi  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (5, N'description', N'Tonymoly việt nam', CAST(0xA6360414 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (6, N'support', NULL, CAST(0xA6360414 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (7, N'aboutshort', N'<div class="we-img hidden-sm"><img alt="" src="/Content/themes/linhlinh/img/welcome/4.png" /></div>

<div class="we-content">
<div class="area-heading border-black left-align">
<h2>Thẩm mỹ Linh linh xin trân trọng gửi lời chúc sức khoẻ và thành đạt tới tất cả Quý khách hàng! </h2>

<p>Ngay từ khi ra đời, Thẩm mỹ Linh linh đã khẳng định được đẳng cấp của mình và đạt được tiêu chuẩn Quốc tế của một  Viện thẩm mỹ y khoa. Đó là, chúng tôi có một đội ngũ chuyên gia gồm các bác sĩ thẩm mỹ trong và ngoài nước, đội ngũ kỹ thuật viên tốt nghiệp trường y đã được đào tạo chuyên ngành thẩm mỹ, trang thiết bị được nhập khẫu từ Mỹ, Israel, Hàn Quốc, Nhật bản…và tất cả các công nghệ này đều đã được FDA (Food and Drug Administration - Cục Quản Lý Thực Phẩm & Dược Phẩm Hoa Kỳ), CE (Conformité Européene – Tiêu chuẩn Châu Âu) chứng nhận và cho phép lưu hành...</p>
<a class="button-border" href="/vi/gioi-thieu">Chi tiết </a></div>
</div>
', CAST(0xA4F8040F AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (8, N'aboutcontent', N'<div class="slide1">
<p style="text-align: center;">TONYMMOLY is a global cosmetic brand that offers the ideal skin look</p>

<p style="text-align: center;">Urban Lifestyle Beauty Brand</p>

<p style="text-align: center;">TONY means charming, stylish in English.<br />
MOLY means container in Japanese which carries all stylish things.</p>

<p style="text-align: center;">TonyMoly strives through research and ethical skin care principles to<br />
offer the fountain of youth through careful selection of its products.</p>

<p style="text-align: center;"><img alt="" src="/images/images/2PM-_%ec%99%80%ec%9d%b4%eb%93%9c1%eb%8c%801_s.jpg" style="width: 400px; height: 400px;" />&nbsp;<img alt="" src="/images/images/brandambassador_hyuna.jpg" style="width: 211px; height: 400px;" /></p>
</div>
', CAST(0xA4F8040F AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (9, N'contactdetail', N'<h3>&nbsp;</h3>
', CAST(0xA4130000 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (10, N'banner', N'', CAST(0xA0870434 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (11, N'productcontent', N'', CAST(0x9E3903FE AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (12, N'yahoo', N'', CAST(0xA0870434 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (28, N'abouthome', N'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.</p>
<p>Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam. </p>', CAST(0xA14D04BD AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (41, N'keywords', N'Tonymoly việt nam', CAST(0xA6360414 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (110, N'productcontent', N'', CAST(0x9E3903FE AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (118, N'yahoo', N'', CAST(0x9EBD0229 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (127, N'abouthome', N'<p>Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.</p>', CAST(0xA14D04BD AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (143, N'contact', N'', CAST(0xA4790264 AS SmallDateTime), 1, N'en  ')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (144, N'advstop', N'<p style="text-align: center;"><img alt="" src="/images/images/banner_top_4(1).png" style="width: 1348px; height: 249px;" /></p>
', CAST(0xA52B03EB AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (145, N'advsbottom', N'<p><img alt="" src="/images/images/banner_bottom_fw.png" style="width: 774px; height: 286px;" /></p>
', CAST(0xA52B03EE AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (146, N'advsbottom', N'<div class="block2 color-scheme-2">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-refresh-outline"></i></span>
                        </div>
                        <div class="block-title">
                            <h4>Money exchange</h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-social-euro"></i></span>
                        </div>
                        <div class="block-title">
                            <h4>Money Back</h4>

                        </div>

                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-briefcase-outline"></i></span>
                        </div>

                        <div class="block-title">
                            <h4>Free shipping</h4>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature-icon center">
                        <div class="icon hi-icon-color hi-icon-effect">
                            <span class="hi-icon"><i class="ion-ios-world-outline"></i></span>
                        </div>

                        <div class="block-title">
                            <h4>Support 7/24</h4>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>', CAST(0xA52B03EE AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (149, N'advstop', N'<div class="service-block  block2">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="header-for-black">
                        <h2>Featured Services</h2>
                        <p>We have more and more  service for you and select sign up to the mailing list to receive updates on new arrivals, special offers and other discount information.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-navigate-outline"></i>
                        <a href="#">More Features</a>
                        <p>
                            Excepteur sint occaecat cupidatat non proident.
                        </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-paper-outline"></i>
                        <a href="#">Clean Design</a>
                        <p>Ut magna aliqua enim ad minim veniam, quis nostrud</p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-people-outline"></i>
                        <a href="#">Best Usability</a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-photos-outline"></i>
                        <a href="#">Layer Style</a>
                        <p>Duis aute irure dolor in reprehe nderit velit esse.</p>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-play-outline"></i>
                        <a href="#">HTML Video</a>
                        <p>
                            Excepteur sint occaecat cupidatat non proident.
                        </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-reload"></i>
                        <a href="#">Always Upgradable  </a>
                        <p>Ut magna aliqua enim ad minim veniam, quis nostrud</p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-speedometer-outline"></i>
                        <a href="#">Fast Work</a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="block-feature">
                        <i class="ion-ios-rose-outline"></i>
                        <a href="#">Creative Ideas</a>
                        <p>Duis aute irure dolor in reprehe nderit velit esse.</p>
                    </div>

                </div>
            </div>

        </div>
        <br>
    </div>', CAST(0xA52B03EF AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (150, N'advsleft', N'<p><a class="bg-image" href="#"><img src="/images/images/banner_left_1.jpg" style="width: 757px; height: 402px;" /></a></p>
', CAST(0xA52B03F0 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (151, N'advsleft', N'', CAST(0xA52B03F0 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (152, N'advsright', N'<p><a class="bg-image" href="/vi/news/posts/80/Meo-lam-dep"><img src="/images/images/banner_top_3.jpg" style="width: 522px; height: 199px;" /></a></p>
', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (153, N'advsright', N'', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (154, N'advsmiddle', N'<p><a class="bg-image" href="#"><img src="/images/images/banner_middle.jpg" style="width: 521px; height: 191px;" /></a></p>
', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (155, N'advsmiddle', N'<div class="big-banner">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-md-offset-6 col-sm-offset-6">
                <a href="#">
                    <img alt="" class="img-responsive" src="/Content/themes/shop/img/bg/bg_banner.png">
                </a>
            </div>
        </div>
    </div>
</div>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (156, N'content_shipping', N'<div class="widget-block">
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title"><a class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseOne">Ph&iacute; giao h&agrave;ng được t&iacute;nh v&agrave; thu như thế n&agrave;o? </a></h4>
</div>

<div class="panel-collapse collapse in" id="collapseOne">
<div class="panel-body">
<p>- Với đơn h&agrave;ng dưới 1 triệu, qu&yacute; kh&aacute;ch sẽ tự thanh to&aacute;n tiền chuyển h&agrave;ng. Với đơn h&agrave;ng tr&ecirc;n 1 triệu ph&iacute;a c&ocirc;ng ty sẽ hỗ trợ to&agrave;n bộ chi ph&iacute; vận chuyển h&agrave;ng</p>
</div>
</div>
</div>
</div>
</div>
', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (157, N'content_shipping', N'<table style="width:80%;margin-left:20px;">
	                                    <tbody>
		                                    <tr>
			                                    <td style="vertical-align:top">The delivery standards</td>
		                                    </tr>
		                                    <tr>
			                                    <td style="vertical-align:top">The delivery time is expected after 2 working days from the time of purchase.</td>
		                                    </tr>
	                                    </tbody>
                                    </table>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (158, N'email_order_confirm', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>

        <table class="a0" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 135.0pt">
                <td width="245" valign="top" style="width: 183.75pt; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" style="line-height: normal">
                        <img width="79" height="95"
                            id="image01.png" src="{domain}/images/logo.png">
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 12.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{store_name}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 14pt; line-height: 115%; font-family: Arial">XÁC NHẬN ĐƠN HÀNG</span></b>
                    </p>
                </td>
                <td width="379" valign="top" style="width: 284.25pt; border: solid white 1.0pt; border-left: none; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>
                    <table class="a" border="1" cellspacing="0" cellpadding="0" width="376"
                        style="border-collapse: collapse; border: none">
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Ngày tạo đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_date}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Tình trạng đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; background: #FFFF99; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Thanh toán</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{payment_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Mã đơn hàng</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_id} </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Người đặt hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_name}</span>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
                    <p class="MsoNormal" style="line-height: normal">
                        <span style="font-size: 10.0pt; font-family: Arial"></span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a1" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 114.0pt">
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN ĐƠN HÀNG</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_address}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_content}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Điện thoại:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {order_phone}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Email:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">           {order_email}</span>
                    </p>
                </td>                
            </tr>
        </table>

        <p class="MsoNormal" style="line-height: 150%">&nbsp;</p>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a2" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="42" valign="top" style="width: 31.5pt; border: solid silver 1.0pt; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Số lượng</span></b>
                    </p>
                </td>
                <td width="412" valign="top" style="width: 309.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" style="line-height: normal">
                        <b><span style="font-size: 10.0pt; font-family: Arial; color: white">Tên sản phẩm</span></b>
                    </p>
                </td>
                <td width="84" valign="top" style="width: 63.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Đơn giá</span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Thành tiền</span></b>
                    </p>
                </td>
            </tr>
            {order_list}
        </table>

        <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>

        <table class="a3" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="538" valign="top" style="width: 403.5pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial">Tổng tiền </span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <span
                            style="font-size: 10.0pt; font-family: Arial">{order_total}</span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (159, N'email_order_confirm', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>

        <table class="a0" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 135.0pt">
                <td width="245" valign="top" style="width: 183.75pt; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" style="line-height: normal">
                        <img width="79" height="95"
                            id="image01.png" src="{domain}/images/logo.png">
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 12.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{store_name}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 14pt; line-height: 115%; font-family: Arial">XÁC NHẬN ĐƠN HÀNG</span></b>
                    </p>
                </td>
                <td width="379" valign="top" style="width: 284.25pt; border: solid white 1.0pt; border-left: none; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>
                    <table class="a" border="1" cellspacing="0" cellpadding="0" width="376"
                        style="border-collapse: collapse; border: none">
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Ngày tạo đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_date}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Tình trạng đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; background: #FFFF99; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Thanh toán</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{payment_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Mã đơn hàng</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_id} </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Người đặt hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_name}</span>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
                    <p class="MsoNormal" style="line-height: normal">
                        <span style="font-size: 10.0pt; font-family: Arial"></span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a1" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 114.0pt">
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN ĐƠN HÀNG</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_address}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_content}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Điện thoại:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {order_phone}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Email:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">           {order_email}</span>
                    </p>
                </td>                
            </tr>
        </table>

        <p class="MsoNormal" style="line-height: 150%">&nbsp;</p>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a2" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="42" valign="top" style="width: 31.5pt; border: solid silver 1.0pt; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Số lượng</span></b>
                    </p>
                </td>
                <td width="412" valign="top" style="width: 309.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" style="line-height: normal">
                        <b><span style="font-size: 10.0pt; font-family: Arial; color: white">Tên sản phẩm</span></b>
                    </p>
                </td>
                <td width="84" valign="top" style="width: 63.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Đơn giá</span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Thành tiền</span></b>
                    </p>
                </td>
            </tr>
            {order_list}
        </table>

        <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>

        <table class="a3" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="538" valign="top" style="width: 403.5pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial">Tổng tiền </span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <span
                            style="font-size: 10.0pt; font-family: Arial">{order_total}</span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (160, N'email_order_payment_change_status', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>

        <table class="a0" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 135.0pt">
                <td width="245" valign="top" style="width: 183.75pt; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" style="line-height: normal">
                        <img width="79" height="95"
                            id="image01.png" src="{domain}/images/logo.png">
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 12.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{store_name}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 14pt; line-height: 115%; font-family: Arial">XÁC NHẬN THANH TOÁN</span></b>
                    </p>
                </td>
                <td width="379" valign="top" style="width: 284.25pt; border: solid white 1.0pt; border-left: none; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>
                    <table class="a" border="1" cellspacing="0" cellpadding="0" width="376"
                        style="border-collapse: collapse; border: none">
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Ngày tạo đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_date}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Tình trạng đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; background: #FFFF99; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Thanh toán</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{payment_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Mã đơn hàng</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_id} </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Người đặt hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_name}</span>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
                    <p class="MsoNormal" style="line-height: normal">
                        <span style="font-size: 10.0pt; font-family: Arial"></span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a1" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 114.0pt">
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN ĐƠN HÀNG</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_address}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_content}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Điện thoại:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {order_phone}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Email:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">           {order_email}</span>
                    </p>
                </td>
                
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN THANH TOÁN</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Thanh toán từ :{payment_gate}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Kết quả :{payment_status}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {payment_content}</span>
                    </p>                    
                </td>                
            </tr>
        </table>

        <p class="MsoNormal" style="line-height: 150%">&nbsp;</p>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a2" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="42" valign="top" style="width: 31.5pt; border: solid silver 1.0pt; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Số lượng</span></b>
                    </p>
                </td>
                <td width="412" valign="top" style="width: 309.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" style="line-height: normal">
                        <b><span style="font-size: 10.0pt; font-family: Arial; color: white">Tên sản phẩm</span></b>
                    </p>
                </td>
                <td width="84" valign="top" style="width: 63.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Đơn giá</span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Thành tiền</span></b>
                    </p>
                </td>
            </tr>
            {order_list}
        </table>

        <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>

        <table class="a3" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="538" valign="top" style="width: 403.5pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial">Tổng tiền </span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <span
                            style="font-size: 10.0pt; font-family: Arial">{order_total}</span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (161, N'email_order_payment_change_status', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>

        <table class="a0" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 135.0pt">
                <td width="245" valign="top" style="width: 183.75pt; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" style="line-height: normal">
                        <img width="79" height="95"
                            id="image01.png" src="{domain}/images/logo.png">
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 12.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{store_name}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 14pt; line-height: 115%; font-family: Arial">XÁC NHẬN THANH TOÁN</span></b>
                    </p>
                </td>
                <td width="379" valign="top" style="width: 284.25pt; border: solid white 1.0pt; border-left: none; padding: 0in 0in 0in 0in; height: 135.0pt">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>
                    <table class="a" border="1" cellspacing="0" cellpadding="0" width="376"
                        style="border-collapse: collapse; border: none">
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Ngày tạo đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_date}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Tình trạng đơn hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; background: #FFFF99; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Thanh toán</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{payment_status}</span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Mã đơn hàng</span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_id} </span>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="236" valign="top" style="width: 177.0pt; border: solid #CCCCCC 1.0pt; border-top: none; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <b><span
                                        style="font-size: 10.0pt; font-family: Arial">Người đặt hàng </span></b>
                                </p>
                            </td>
                            <td width="140" valign="top" style="width: 105.0pt; border-top: none; border-left: none; border-bottom: solid #CCCCCC 1.0pt; border-right: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                                <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                                    <span
                                        style="font-size: 10.0pt; font-family: Arial">{order_name}</span>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
                    <p class="MsoNormal" style="line-height: normal">
                        <span style="font-size: 10.0pt; font-family: Arial"></span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a1" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr style="height: 114.0pt">
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN ĐƠN HÀNG</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_address}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">{order_content}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Điện thoại:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {order_phone}</span>
                    </p>
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Email:</span></b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">           {order_email}</span>
                    </p>
                </td>
                
                <td width="312" valign="top" style="width: 3.25in; border: solid white 1.0pt; padding: 0in 0in 0in 0in; height: 114.0pt">
                    <p class="MsoNormal">
                        <b><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #999999">THÔNG TIN THANH TOÁN</span></b>
                    </p>
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Thanh toán từ :{payment_gate}</span>
                    </p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">Kết quả :{payment_status}</span>
                    </p>                    
                    <p class="MsoNormal">&nbsp;</p>
                    <p class="MsoNormal">
                        <span style="font-size: 10.0pt; line-height: 115%; font-family: Arial">    {payment_content}</span>
                    </p>                    
                </td>                
            </tr>
        </table>

        <p class="MsoNormal" style="line-height: 150%">&nbsp;</p>

        <p class="MsoNormal">&nbsp;</p>

        <table class="a2" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="42" valign="top" style="width: 31.5pt; border: solid silver 1.0pt; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Số lượng</span></b>
                    </p>
                </td>
                <td width="412" valign="top" style="width: 309.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" style="line-height: normal">
                        <b><span style="font-size: 10.0pt; font-family: Arial; color: white">Tên sản phẩm</span></b>
                    </p>
                </td>
                <td width="84" valign="top" style="width: 63.0pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="center" style="text-align: center; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Đơn giá</span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid silver 1.0pt; border-left: none; background: #006600; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial; color: white">Thành tiền</span></b>
                    </p>
                </td>
            </tr>
            {order_list}
        </table>

        <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">&nbsp;</p>

        <table class="a3" border="1" cellspacing="0" cellpadding="0" width="624"
            style="border-collapse: collapse; border: none">
            <tr>
                <td width="538" valign="top" style="width: 403.5pt; border: solid #CCCCCC 1.0pt; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <b><span
                            style="font-size: 10.0pt; font-family: Arial">Tổng tiền </span></b>
                    </p>
                </td>
                <td width="86" valign="top" style="width: 64.5pt; border: solid #CCCCCC 1.0pt; border-left: none; padding: .05in .05in .05in .05in">
                    <p class="MsoNormal" align="right" style="text-align: right; line-height: normal">
                        <span
                            style="font-size: 10.0pt; font-family: Arial">{order_total}</span>
                    </p>
                </td>
            </tr>
        </table>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (162, N'email_confirm_forgot_password', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
        
        <p class="MsoNormal">Xin chào bạn {email_client},</p>

		<p class="MsoNormal">Bạn vừa gửi yêu cầu lấy lại mật khẩu tại {domain}. Bạn cần nhập mã sau vào ô xác thực.
		
		<p class="MsoNormal">Mã xác thực:</p>

		<p class="MsoNormal"><strong>{code}</strong></p>
		
		<p class="MsoNormal"> Hãy click vào {link} này để tiếp tục quá trình lấy lại mật khẩu.</p>
		
		<p class="MsoNormal">Nếu bạn không yêu cầu lấy lại mật khẩu hoặc có nhầm lẫn vui lòng bỏ qua email này.</p>

		<p class="MsoNormal">Xin cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>

		<p class="MsoNormal">Lưu ý: Đây là email trả lời tự động, bạn vui lòng không gửi phản hồi về email này.</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (163, N'email_confirm_forgot_password', N'<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: Tahoma;
        }

        @font-face {
            font-family: Georgia;
        }

        @font-face {
            font-family: Arial;
        }
        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

        h1 {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h1.CxSpFirst {
                margin-top: 24.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h1.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 6.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 24.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h2 {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 18.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h2.CxSpFirst {
                margin-top: .25in;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h2.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 18.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h3 {
            margin-top: 14.0pt;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h3.CxSpFirst {
                margin-top: 14.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h3.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 4.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 14.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h4 {
            margin-top: 12.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 12.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h4.CxSpFirst {
                margin-top: 12.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h4.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 12.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h5 {
            margin-top: 11.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 11.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h5.CxSpFirst {
                margin-top: 11.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h5.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 11.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        h6 {
            margin-top: 10.0pt;
            margin-right: 0in;
            margin-bottom: 2.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 10.0pt;
            font-family: Arial,sans-serif;
            color: black;
        }

            h6.CxSpFirst {
                margin-top: 10.0pt;
                margin-right: 0in;
                margin-bottom: 0in;
                margin-left: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpMiddle {
                margin: 0in;
                margin-bottom: .0001pt;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

            h6.CxSpLast {
                margin-top: 0in;
                margin-right: 0in;
                margin-bottom: 2.0pt;
                margin-left: 0in;
                line-height: 115%;
                page-break-after: avoid;
                font-size: 10.0pt;
                font-family: Arial,sans-serif;
                color: black;
            }

        p.MsoTitle, li.MsoTitle, div.MsoTitle {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpFirst, li.MsoTitleCxSpFirst, div.MsoTitleCxSpFirst {
            margin-top: 24.0pt;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpMiddle, li.MsoTitleCxSpMiddle, div.MsoTitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoTitleCxSpLast, li.MsoTitleCxSpLast, div.MsoTitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 6.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 36.0pt;
            font-family: Arial,sans-serif;
            color: black;
            font-weight: bold;
        }

        p.MsoSubtitle, li.MsoSubtitle, div.MsoSubtitle {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpFirst, li.MsoSubtitleCxSpFirst, div.MsoSubtitleCxSpFirst {
            margin-top: .25in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpMiddle, li.MsoSubtitleCxSpMiddle, div.MsoSubtitleCxSpMiddle {
            margin: 0in;
            margin-bottom: .0001pt;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoSubtitleCxSpLast, li.MsoSubtitleCxSpLast, div.MsoSubtitleCxSpLast {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 4.0pt;
            margin-left: 0in;
            line-height: 115%;
            page-break-after: avoid;
            font-size: 24.0pt;
            font-family: Georgia;
            color: #666666;
            font-style: italic;
        }

        p.MsoAcetate, li.MsoAcetate, div.MsoAcetate {
            mso-style-link: "Balloon Text Char";
            margin: 0in;
            margin-bottom: .0001pt;
            font-size: 8.0pt;
            font-family: Tahoma,sans-serif;
            color: black;
        }

        span.BalloonTextChar {
            mso-style-name: "Balloon Text Char";
            mso-style-link: "Balloon Text";
            font-family: Tahoma,sans-serif;
        }

        .MsoChpDefault {
            font-family: Arial,sans-serif;
            color: black;
        }

        .MsoPapDefault {
            line-height: 115%;
        }

        @page WordSection1 {
            size: 8.5in 11.0in;
            /*margin:1.0in 1.0in 1.0in 1.0in;*/
        }

        div.WordSection1 {
            page: WordSection1;
            width: 624px;
            margin: 0px auto;
        }
        -->
    </style>

</head>

<body bgcolor="white" lang="EN-US">

    <div class="WordSection1">

        <p class="MsoNormal" style="line-height: normal">&nbsp;</p>
        
        <p class="MsoNormal">Xin chào bạn {email_client},</p>

		<p class="MsoNormal">Bạn vừa gửi yêu cầu lấy lại mật khẩu tại {domain}. Bạn cần nhập mã sau vào ô xác thực hoặc click vào {link} này để tiếp tục quá trình lấy lại mật khẩu.</p>

		<p class="MsoNormal">Mã xác thực:</p>

		<p class="MsoNormal"><strong>{code}</strong></p>
		
		<p class="MsoNormal">Nếu bạn không yêu cầu lấy lại mật khẩu hoặc có nhầm lẫn vui lòng bỏ qua email này.</p>

		<p class="MsoNormal">Xin cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>

		<p class="MsoNormal">Lưu ý: Đây là email trả lời tự động, bạn vui lòng không gửi phản hồi về email này.</p>

        <p class="MsoNormal">
            <span
                style="font-family: Arial; color: #666666"> {store_name} xin chân thành cảm ơn Quý khách đã tin tưởng và đăng ký sử dụng dịch vụ của chúng tôi. 
            </span>
        </p>

        <p class="MsoNormal">&nbsp;</p>

        <p class="MsoNormal">
            <a href="{domain}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{domain}</span></a><span
                style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">  
/    </span><a href="{email}"><span style="font-size: 10.0pt; line-height: 115%; font-family: Arial; color: #CCCCCC">{email}</span></a>
        </p>

    </div>

</body>

</html>', CAST(0xA52B03F1 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (164, N'contactdetail', N'<h3><i class="fa fa-thumb-tack"></i>Our Address</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.                                    
                                </p>
                                <hr>
                                <h3><i class="fa fa-phone"></i>Contact Phone</h3>
                                <p>
                                    (123) 456 789 101 <br>    (789) 456 789 202                               
                                </p>
                                <hr>
                                <h3><i class="fa fa-envelope-o"></i>E-mail</h3>
                                <p>
                                    support@yousite.com <br>    send@message.com                               
                                </p>', CAST(0xA4130000 AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (166, N'keywords', N'Tonymoly việt nam', CAST(0xA6360414 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (168, N'pagename', N'Belle Hair Salon', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (170, N'description', N'Belle hair salon', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (171, N'pagefooter1', N'
                    <h5 class="ev-widget-title">CÔNG TY TNNHH E.VE VINA</h5>
                    <p>
                        Tòa nhà Sping Heirs Block B13+ -B15/D21 ngõ 92 Trần Thái Tông Cầu Giấy - Hà Nội
                    </p>
', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (172, N'pagefooter1', N'<div class="header-footer">
                        <h3>About us</h3>
                    </div>
                    <div class="inner-block">
                        <p>
                            We are <a href="#">MosaicDesign</a> group and we make modern, creative templetes. Our team created Responsive Premiuem E-commerce template 
                        </p>
                    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (173, N'pagefooter2', N'<h5 class="ev-widget-title">MY ACCOUNT</h5>
                        <ul class="ev-account">
                            <li><a href="#">Site map</a></li>
                            <li><a href="#"> Privacy Policy</a></li>
                            <li><a href="#">Your Account</a></li>
                            <li><a href="#">Advanced Search</a></li>
                        </ul>', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (174, N'pagefooter2', N'<div class="inner-block">
                        <div class="header-footer">
                            <h3>My Account</h3>
                        </div>
                        <ul class="footer-categories list-unstyled">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Wish List</a></li>
                            <li><a href="#">Order History</a></li>
                            <li><a href="#">Brands</a></li>
                            <li><a href="#">Specials</a></li>
                            <li><a href="#">Newsletter</a></li>
                            <li><a href="#">Secure payment</a></li>
                        </ul>
                    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (175, N'pagefooter3', N'<h5 class="ev-widget-title">Customer Service</h5>
                        <ul class="ev-account">
                            <li><a href="#">Shipping Policy</a></li>
                            <li><a href="#"> Compensation First</a></li>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Return Policy</a></li>
                        </ul>', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (176, N'pagefooter3', N'<div class="inner-block clearfix">
                        <div class="header-footer">
                            <h3>Instagram</h3>
                        </div>
                        <ul class="list-unstyled flickr">
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog1.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog2.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog5.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog3.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog4.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog6.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog7.jpg" class="img-responsive" alt=""></a></li>
                            <li><a href="#">
                                <img src="/Content/themes/shop/img/preview/blog8.jpg" class="img-responsive" alt=""></a></li>
                        </ul>
                    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (177, N'pagefooter4', N'<h5 class="ev-widget-title">Our Upcoming events</h5>
                        <ul class="ev-adderss">
                            <li>
                                <i class="fa fa-map-marker"></i><span>40 Baria Sreet 133/2  NewYork City, United States.</span>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i><span>0(1234) 567 890</span>
                            </li>
                            <li>
                                <i class="fa fa-fax"></i><span>0(1234) 567 890</span>
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i><span>Infor@chairman.com</span>
                            </li>
                        </ul>', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (178, N'pagefooter4', N'<div class="inner-block">
                        <div class="header-footer">
                            <h3>Address</h3>
                        </div>
                        <ul class="footer-categories list-unstyled">
                            <li><i class="fa fa-map-marker fa-lg"></i>&nbsp; 2901 Marmora Road, Glassgow, Seattle, WA 98122-1090</li>
                            <li><i class="fa fa-phone"></i>&nbsp; 9 - 876 - 543 - 210 </li>
                            <li><i class="fa fa-print"></i>&nbsp; 1 - 234 - 567 - 890</li>
                            <li><a href="mailto:info@yourdomain.com"><i class="fa fa-envelope"></i>&nbsp; info@yourdomain.com</a></li>
                            <li><a href="mailto:support@yourdomain.com"><i class="fa fa-envelope"></i>&nbsp; support@yourdomain.com</a></li>
                            <li><a href="#"><i class="fa fa-thumb-tack"></i>&nbsp;&nbsp; Location in Google Maps</a></li>
                        </ul>
                    </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (179, N'pagefooter5', N'Design by soncoi.net', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (180, N'pagefooter5', N'<a href="https://www.facebook.com/Belle-Hair-Salon-450987675084279" target="_blank" class="symbol-facebook"><span class="tooltip symbol" title="Facebook">&#xe027;</span></a>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (181, N'address', N'Tòa nhà Sping Heirs Block B13+ -B15/D21 ngõ 92 Trần Thái Tông Cầu Giấy - Hà Nội', CAST(0xA6360414 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (182, N'address', N'3D buildings, Duy Tan Street, Cau Giay District, Hanoi', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (183, N'pagefooter', N'© 2016 Belle - All Rights Reserved', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (184, N'pagefooter', N'<div class="col-md-6">
                    <div class="socials">
                        <a href="#"><i class="fa fa-skype"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
                <div class="col-md-6">
                    <ul class="footer-payments pull-right">
                        <li>
                            <img src="/Content/themes/shop/img/payment-maestro.jpg" alt="payment" /></li>
                        <li>
                            <img src="/Content/themes/shop/img/payment-discover.jpg" alt="payment" /></li>
                        <li>
                            <img src="/Content/themes/shop/img/payment-visa.jpg" alt="payment" /></li>
                        <li>
                            <img src="/Content/themes/shop/img/payment-american-express.jpg" alt="payment" /></li>
                        <li>
                            <img src="/Content/themes/shop/img/payment-paypal.jpg" alt="payment" /></li>
                    </ul>
                </div>', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (185, N'slogan', NULL, CAST(0xA6360414 AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (186, N'slogan', N'Làm đẹp theo cách của bạn!', CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (187, N'advsbottomleft', N'<p><a href="#"><img alt="" src="/images/images/shop2.png" style="width: 420px; height: 289px;" /></a></p>
', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (188, N'advsbottomleft', NULL, CAST(0xA57F039A AS SmallDateTime), 1, N'en')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (189, N'payment_guide', N'<p>- Qu&yacute; kh&aacute;ch c&oacute; thể tiến h&agrave;nh thanh to&aacute;n online qua c&aacute;c cổng thanh to&aacute;n Ng&acirc;n lượng hoặc Bảo kim.</p>

<p>1. Thanh to&aacute;n qua Bảo Kim ,&nbsp;Xin vui l&ograve;ng t&igrave;m hiểu th&ecirc;m tại <a href="https://www.baokim.vn/trang-chu" target="_blank">đ&acirc;y</a></p>

<p>2. Thanh to&aacute;n qua Ng&acirc;n Lượng , Xin vui l&ograve;ng t&igrave;m hiểu th&ecirc;m tại <a href="https://www.nganluong.vn/nganluong/home.html" target="_blank">đ&acirc;y</a>.</p>

<p>- Hoặc&nbsp;Qu&yacute; kh&aacute;ch tiến h&agrave;nh chuyển tiền cho ch&uacute;ng t&ocirc;i theo TK sau:</p>

<p>1. T&agrave;i Khoản Vietcombank - H&agrave; Nội</p>

<p><strong>Chủ t&agrave;i khoản:&nbsp;Đo&agrave;n Thị Mỵ</strong></p>

<p><strong><strong>Ng&acirc;n h&agrave;ng Vietcombank-&nbsp; Ph&ograve;ng giao dịch số 15, CN H&agrave; Nội.</strong></strong></p>

<p><strong>Số t&agrave;i khoản VNĐ: 0011003939117</strong></p>

<p>2. T&agrave;i Khoản Vietcombank - Hồ Ch&iacute; Minh</p>

<p><strong>TRẦN THỊ TH&Ugrave;Y LINH&nbsp;<br />
STK : 0331000457114<br />
CHI NH&Aacute;NH B&Ugrave;I THỊ XU&Acirc;N, Q1. TP.HCM</strong></p>

<p>3. T&agrave;i Khoản BIDV - H&agrave; Nội</p>

<p><strong>Chủ t&agrave;i khoản:&nbsp;Đo&agrave;n Thị Mỵ</strong></p>

<p><strong><strong>Ng&acirc;n h&agrave;ng BIDV-&nbsp; CN T&acirc;y H&agrave; Nội.</strong></strong></p>

<p><strong>Số t&agrave;i khoản VNĐ: 26010000558629</strong></p>

<p>- Số tiền qu&yacute; kh&aacute;ch chuyển cho ch&uacute;ng t&ocirc;i gồm:&nbsp;Gi&aacute; trị đơn h&agrave;ng cần mua&nbsp;(chưa bao gồm ph&iacute; vận chuyển)</p>

<p>- Sau khi chuyển tiền cho ch&uacute;ng t&ocirc;i đề nghị qu&yacute; kh&aacute;ch h&agrave;ng th&ocirc;ng b&aacute;o cho ch&uacute;ng t&ocirc;i qua số m&aacute;y :&nbsp;<strong>0986.100.578</strong>&nbsp;để ch&uacute;ng t&ocirc;i c&oacute; thể đ&oacute;ng g&oacute;i v&agrave; chuyển h&agrave;ng cho qu&yacute; kh&aacute;ch nhanh nhất.<br />
- Sau khi nhận được tiền, ch&uacute;ng t&ocirc;i sẽ tiến h&agrave;nh xuất h&agrave;ng &amp; gửi h&agrave;ng ngay cho qu&yacute; kh&aacute;ch theo đường chuyển ph&aacute;t nhanh.&nbsp;<br />
- Thời gian nhận h&agrave;ng: Từ 1 đến 3 ng&agrave;y.</p>

<p>Mọi phản hồi về h&agrave;ng h&oacute;a sẽ được giải đ&aacute;p sau 3 ng&agrave;y kể từ ng&agrave;y bạn nhận được h&agrave;ng.Bạn h&atilde;y kiểm tra kỹ th&ocirc;ng tin h&agrave;ng trước khi đặt để tr&aacute;nh nhầm lẫn.</p>
', CAST(0xA57F039A AS SmallDateTime), 1, N'vi')
INSERT [dbo].[_General] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified], [Show], [Lang]) VALUES (190, N'payment_guide', NULL, CAST(0xA57F039A AS SmallDateTime), 1, N'en')
SET IDENTITY_INSERT [dbo].[_General] OFF
/****** Object:  Table [dbo].[_EmailTemplate]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_EmailTemplate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[template] [ntext] NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK__EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_EmailTemplate] ON
INSERT [dbo].[_EmailTemplate] ([id], [name], [template], [createdate]) VALUES (1, N'Testing', N'Testing', CAST(0x0000A61D00000000 AS DateTime))
INSERT [dbo].[_EmailTemplate] ([id], [name], [template], [createdate]) VALUES (3, N'Email marketingaaaaaaaaaaa', N'<p>Testingaaaaaaaaaa</p>
', CAST(0x0000A61D00000000 AS DateTime))
INSERT [dbo].[_EmailTemplate] ([id], [name], [template], [createdate]) VALUES (4, N'SonNV', N'Testing', CAST(0x0000A61D00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[_EmailTemplate] OFF
/****** Object:  Table [dbo].[_Email]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Email](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK__Email] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_Email] ON
INSERT [dbo].[_Email] ([id], [name], [email]) VALUES (1, N'', N'duynv.utehy@gmail.com')
INSERT [dbo].[_Email] ([id], [name], [email]) VALUES (16, N'', N'a@gmail.com')
INSERT [dbo].[_Email] ([id], [name], [email]) VALUES (17, N'', N'test111@gmail.com')
INSERT [dbo].[_Email] ([id], [name], [email]) VALUES (18, N'', N'c@gmail.com')
INSERT [dbo].[_Email] ([id], [name], [email]) VALUES (19, N'', N'duy@gmail.com')
INSERT [dbo].[_Email] ([id], [name], [email]) VALUES (20, N'', N'def@gmail.com')
INSERT [dbo].[_Email] ([id], [name], [email]) VALUES (21, N'', N'zzzzzz@gmail.com')
SET IDENTITY_INSERT [dbo].[_Email] OFF
/****** Object:  Table [dbo].[_Contact]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[email] [nvarchar](50) NULL,
	[contents] [nvarchar](4000) NULL,
	[phone] [varchar](30) NULL,
	[address] [nvarchar](150) NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK__Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[_Catalog_GetParent]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_Catalog_GetParent]
	@CatalogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @CatalogID int
	declare @CatalogParent int
	declare @IsTop int
	--set @CatalogID = 10
	set @CatalogParent = @CatalogID
	set @IsTop=1

	while(@IsTop <> -1)
	begin
		set @CatalogParent = @CatalogID
		set @IsTop = (select ParentID from dbo._CatalogProduct where CatalogID=@CatalogID)
		if (@IsTop =0) 
			begin set @IsTop =-1 end
		else  
			begin set @CatalogID = @IsTop end
	end
	select @CatalogParent as CatalogParent
END
GO
/****** Object:  Table [dbo].[_Product]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](512) NOT NULL,
	[ProductCode] [nvarchar](50) NULL,
	[CatalogID] [varchar](500) NULL,
	[Summary] [ntext] NULL,
	[Content] [ntext] NULL,
	[ImagePath] [nvarchar](512) NULL,
	[ImageBigPath] [nvarchar](512) NULL,
	[DateModify] [datetime] NULL,
	[Store] [int] NOT NULL,
	[Promotion] [nvarchar](512) NULL,
	[Warranty] [nvarchar](250) NULL,
	[Manufacture] [nvarchar](512) NULL,
	[PriceOld] [money] NOT NULL,
	[PriceNew] [money] NULL,
	[Views] [int] NOT NULL,
	[OrderDisplay] [int] NOT NULL,
	[Lang] [nvarchar](10) NULL,
	[IsShow] [bit] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsPromotion] [bit] NOT NULL,
	[Link] [nvarchar](500) NULL,
	[Approve] [bit] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Rating] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_Product] ON
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (33, N'Dầu gội trị gàu L''Oreal Hair Spa Detoxifying 600ml', N'KT_CC_007', N'67', N'Chiết xuất từ hoa Water Lily và tinh dầu Tea Tree Oil tự nhiên
Làm sạch gàu, ngăn ngừa mùi và mồ hôi trên da đầu
Đem lại sự mềm mượt và sáng bóng cho mái tóc
Thương hiệu Pháp, sản xuất tại Trung Quốc', N'<h3>Dầu gội trị g&agrave;u L&#39;Oreal Hair Spa Detoxifying 600ml</h3>

<p>Dầu gội trị g&agrave;u L&#39;Oreal Hair Spa Detoxifying với th&agrave;nh phần chiết xuất từ&nbsp;hoa Water Lily v&agrave; tinh dầu Tea Tree Oil tự nhi&ecirc;n&nbsp;gi&uacute;p&nbsp;sạch g&agrave;u, ngăn ngừa m&ugrave;i v&agrave; mồ h&ocirc;i tr&ecirc;n da đầu, gi&uacute;p t&oacute;c v&agrave; da đầu khỏe mạnh, sảng kho&aacute;i. Sản phẩm đ&atilde; đem cả một liệu tr&igrave;nh chăm s&oacute;c t&oacute;c chuy&ecirc;n nghiệp từ spa về nh&agrave; bạn, mang&nbsp;lại sự mềm mượt&nbsp;v&agrave; s&aacute;ng b&oacute;ng cho m&aacute;i t&oacute;c.</p>

<p>Hướng dẫn sử dụng</p>

<ul>
	<li>Lấy một lượng vừa đủ thoa l&ecirc;n t&oacute;c ướt, massage nhẹ nh&agrave;ng 3 ph&uacute;t rồi xả với nước</li>
	<li>C&oacute; thể d&ugrave;ng dầu xả ngay sau đ&oacute; hoặc dầu hấp mỗi tuần 2 lần</li>
</ul>

<p>Th&ocirc;ng tin thương hiệu</p>

<p>Tập đo&agrave;n mỹ phẩm L&rsquo;Oreal Paris bắt nguồn từ thương hiệu Aur&eacute;ole bởi một kỹ sư h&oacute;a người Ph&aacute;p, Eugene Schueller, với sản phẩm đầu ti&ecirc;n l&agrave; thuốc nhuộm t&oacute;c nh&acirc;n tạo. Sau hơn 100 năm th&agrave;nh lập, L&rsquo;Or&eacute;al l&agrave; tập đo&agrave;n chuy&ecirc;n về mỹ phẩm v&agrave; chăm s&oacute;c sắc đẹp lớn nhất thế giới với c&aacute;c d&ograve;ng sản phẩm về chăm s&oacute;c t&oacute;c, chăm s&oacute;c da, mỹ phẩm. C&oacute; mặt tại 120 quốc gia, L&rsquo;Oreal Paris ph&aacute;t triển dựa tr&ecirc;n nguy&ecirc;n l&yacute;: S&aacute;ng tạo v&agrave; đem đến sản phẩm h&agrave;ng đầu với mức gi&aacute; tốt nhất cho người ti&ecirc;u d&ugrave;ng. Nguy&ecirc;n l&yacute; n&agrave;y khởi nguồn từ c&aacute;c nghi&ecirc;n cứu trong ph&ograve;ng th&iacute; nghiệm nơi sản sinh ra những b&iacute; quyết l&agrave;m đẹp chuy&ecirc;n nghiệp v&agrave; gần gũi với tất cả mọi người.</p>
', N'/images/photoproduct/2016/5/sc_small_2081_10.jpg', N'/images/photoproduct/2016/5/sc_full_2081_10.jpg', CAST(0x0000A60600B856A8 AS DateTime), 1, N'40ml', N'', N'Hàn Quốc', 0.0000, 208000.0000, 0, 3, N'vi', 1, 1, 0, N'Dau-goi-tri-gau-L''Oreal-Hair-Spa-Detoxifying-600ml', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 5)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (35, N'Wonder Honey Moisture Cream', N'KT_CC_001', N'90', N'<p>Kem dưỡng da chiết xuất mật ong tự nhi&ecirc;n</p>

<p><strong>C&ocirc;ng dụng</strong>: Kem dưỡng chiết xuất từ mật ong tự nhi&ecirc;n cung cấp độ ẩm tối ưu cho l&agrave;n da s&aacute;ng hồng, l&aacute;ng mịn&nbsp;</p>

<p><strong>HDSD</strong>: Thoa kem theo chiều kết cấu da, vỗ nhẹ để sản phẩm thẩm thấu hết v&agrave;o da . Ban ng&agrave;y sử dụng như kem dưỡng, ban đ&ecirc;m sử dụng như 1 loại mặt nạ</p>

<p><strong>TL:</strong>&nbsp;320 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>

<p><strong>Lưu &yacute;</strong>&nbsp;: Chỉ d&ugrave;ng ngo&agrave;i da. Tr&aacute;nh tiếp x&uacute;c với mắt. Để xa tầm t&acirc;y trẻ em. Dừng sử dụng khi c&oacute; dấu hiệu dị ứng.</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>

<p>Xuất xứ: H&agrave;n Quốc</p>
', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2016/6/sc_small_2083_wonder-honey-moisture-cream2.jpg', N'/images/photoproduct/2016/6/sc_full_2083_wonder-honey-moisture-cream2.jpg', CAST(0x0000A6340112610F AS DateTime), 1, N'320ml', N'', N'Hàn Quốc', 0.0000, 365000.0000, 0, 16, N'vi', 1, 1, 1, N'Wonder-Honey-Moisture-Cream', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (37, N'Master Lab Ceramide Mask', N'KT_BT_007', N'95', N'<p>Mặt nạ bổ sung độ ẩm, ngăn ngừa hiện tượng l&atilde;o h&oacute;a da</p>

<p>Mặt nạ miếng Ceramide gi&uacute;p kết d&iacute;nh c&aacute;c tế b&agrave;o sừng của da, tạo n&ecirc;n bức tường r&agrave;o vững chắc bảo vệ độ ẩm b&ecirc;n trong của da.</p>

<p><strong>HDSD</strong>: Rửa sạch mặt, sau đ&oacute; lau kh&ocirc; mặt v&agrave; l&agrave;m theo thứ tự sau:</p>

<p>- Thoa ampoule l&ecirc;n khắp mặt</p>

<p>- D&ugrave;ng miếng Mask đắp l&ecirc;n</p>

<p>- Sau khoảng10-20 ph&uacute;t, nhẹ nh&agrave;ng th&aacute;o miếng mặt nạ rồi vỗ nhẹ cho dưỡng chất thẩm thấu s&acirc;u v&agrave;o trong da.</p>

<p><strong>DL</strong>: 19g</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p><strong>NSX</strong>: H&agrave;n Quốc</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2077_master-lab-ceramide-mask.jpg', N'/images/photoproduct/2016/6/sc_full_2077_master-lab-ceramide-mask.jpg', CAST(0x0000A63500B82E48 AS DateTime), 1, N'19g', N'', N'Hàn Quốc', 0.0000, 76000.0000, 0, 1, N'vi', 1, 1, 0, N'Master-Lab-Ceramide-Mask', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (38, N'Floria Whitening Set 2', N'KT_BT_008', N'88', N'<p>&nbsp;</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2100_floria-whitening-set-2.jpg', N'/images/photoproduct/2016/6/sc_full_2100_floria-whitening-set-2.jpg', CAST(0x0000A63401130069 AS DateTime), 1, N'', N'', N'Hàn Quốc', 0.0000, 1680000.0000, 0, 23, N'vi', 1, 1, 0, N'Floria-Whitening-Set-2', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (42, N'Timeless Ferment Snail Cream', N'KT_CC_003', N'85', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem đ&ecirc;m tăng cường khả năng t&aacute;i tạo, chứa 70% tinh chất nhớt ốc s&ecirc;n gi&uacute;p tăng cường khả năng t&aacute;i tạo da.</p>

<p>Kết cấu sản phẩm giữa dạng ample (khả năng dưỡng ẩm cao, hấp thu tốt) and ultra-moisturizing cream (tạo h&agrave;ng r&agrave;o bảo vệ cho da) Sản phẩm đ&atilde; được kiểm nghiệm an to&agrave;n cho da.</p>

<p>C&ocirc;ng thức 10-free (Synthetic Perfume, Paraben, Mineral Oil, Benzophenon-5, BHT, Triclosan, Triethanolamine, Surfactant, Tar color, Talc) an to&agrave;n cho da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Gồm hợp chất của 3 th&agrave;nh phẩn dưới đ&acirc;y:</p>

<p>Nhớt từ loại ốc s&ecirc;n nu&ocirc;i bằng tr&agrave; xanh v&agrave;ng từ 5 ~ 6 th&aacute;ng tuổi gi&uacute;p Hydrat / trẻ h&oacute;a da, loại bỏ tế b&agrave;o chết</p>

<p>Tr&agrave; xanh v&agrave;ng l&ecirc;n men: chống oxi h&oacute;a, ngăn chặn c&aacute;c vấn đề của da</p>

<p>Bột v&agrave;ng thanh lọc, điều chỉnh tone da: t&aacute;c dụng trẻ h&oacute;a</p>

<p>Hợp chất n&agrave;y được l&ecirc;n men 2 lần trong v&ograve;ng 365 ng&agrave;y n&ecirc;n đặc biệt an to&agrave;n cho l&agrave;n da, đồng thời gi&uacute;p dưỡng chất được thẩm thấu tối ưu v&agrave;o b&ecirc;n trong da.</p>

<p><strong>Điểm mạnh sản phẩm:</strong></p>

<p>Sự kết hợp giữa phương ph&aacute;p chắt lọc tinh chất ốc s&ecirc;n v&agrave; l&ecirc;n men với tr&agrave; xanh gi&uacute;p phục hồi l&agrave;n da bị tổn thương</p>

<p>Cải thiện c&aacute;c đốm sậm m&agrave;u v&agrave; sẹo mụn</p>

<p>C&oacute; chứa th&agrave;nh phần chondroitin t&aacute;c dụng như một loại kem dưỡng ẩm</p>

<p>Hydrat v&agrave; trẻ h&oacute;a l&agrave;n da</p>

<p>Allantoin gi&uacute;p chăm s&oacute;c da dịu nhẹ, chống k&iacute;ch ứng v&agrave; loại bỏ tế b&agrave;o sừng h&oacute;a</p>

<p>Glycolate loại bỏ tế b&agrave;o chết v&agrave; l&agrave;m s&aacute;ng da</p>

<p>Collagen elastin tăng độ đ&agrave;n hồi</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Da bị sẹo mụn</p>

<p>Da kh&ocirc; v&agrave; th&ocirc; r&aacute;p</p>

<p>Da k&eacute;m săn chắc</p>

<p>Da xỉn m&agrave;u</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Thoa tr&ecirc;n mặt theo chiều cấu tr&uacute;c của da, v&agrave; nhẹ nh&agrave;ng &aacute;p b&agrave;n tay ấm để th&uacute;c đẩy sự hấp thụ v&agrave;o da.</p>

<p><strong>TL</strong>: 50ml</p>
', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2016/7/sc_small_2071_6.jpg', N'/images/photoproduct/2016/7/sc_full_2071_6.jpg', CAST(0x0000A63900AE55A4 AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 1890000.0000, 0, 19, N'vi', 1, 1, 0, N'Timeless-Ferment-Snail-Cream', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (43, N'Timeless Ferment Snail Eye Cream', N'KT_CC_006', N'86', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem dưỡng mắt d&agrave;nh cho da v&ugrave;ng mắt kh&ocirc;, nhiều nếp nhăn, v&ugrave;ng da mắt bị quầng th&acirc;m, bọng mỡ mắt, tăng cường khả năng t&aacute;i tạo da. Chứa 80% tinh chất nhớt ốc s&ecirc;n l&ecirc;n men, gi&uacute;p l&agrave;m mềm mượt v&agrave; an to&agrave;n cho v&ugrave;ng da quanh mắt, tăng độ săn chắc với khả năng hydrat h&oacute;a tức th&igrave;, l&agrave;m giảm quầng th&acirc;m bọng mắt. Sản phẩm được kiểm nghiệm về độ an to&agrave;n cho da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Nhớt từ loại ốc s&ecirc;n nu&ocirc;i bằng tr&agrave; xanh v&agrave;ng từ 5 ~ 6 th&aacute;ng tuổi gi&uacute;p Hydrat / trẻ h&oacute;a da, loại bỏ tế b&agrave;o chết.</p>

<p>Tr&agrave; xanh l&ecirc;n men: chống oxi h&oacute;a, ngăn chặn c&aacute;c vấn đề của da.</p>

<p>Bột v&agrave;ng thanh lọc: điều chỉnh tone da, t&aacute;c dụng trẻ h&oacute;a.</p>

<p>Hợp chất n&agrave;y (3 chất tr&ecirc;n) được l&ecirc;n men 2 lần trong v&ograve;ng 365 ng&agrave;y n&ecirc;n đặc biệt an to&agrave;n cho l&agrave;n da, đồng thời gi&uacute;p dưỡng chất được thẩm thấu tối ưu v&agrave;o b&ecirc;n trong da, hiệu quả:</p>

<p>Cải thiện c&aacute;c đốm sậm m&agrave;u v&agrave; sẹo mụn.</p>

<p>Chứa th&agrave;nh phần chondroitin t&aacute;c dụng như một loại kem dưỡng ẩm.</p>

<p>Hydrat v&agrave; trẻ h&oacute;a l&agrave;n da.</p>

<p>Allantoin gi&uacute;p chăm s&oacute;c da dịu nhẹ, chống k&iacute;ch ứng v&agrave; loại bỏ tế b&agrave;o sừng h&oacute;a.</p>

<p>Glycolate loại bỏ tế b&agrave;o chết v&agrave; l&agrave;m s&aacute;ng da</p>

<p>Collagenelastin tăng độ đ&agrave;n hồi.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Da mắt kh&ocirc;, nhiều nếp nhăn</p>

<p>Mắt bị quầng th&acirc;m</p>

<p>Bọng mỡ mắt</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Lấy 1 lượng vừa đủ, d&ugrave;ng ng&oacute;n &aacute;p &uacute;t thoa đều quanh v&ugrave;ng mắt rồi nhẹ nh&agrave;ng massage cho dưỡng chất thấm đều v&agrave;o s&acirc;u b&ecirc;n trong.&nbsp;</p>

<p><strong>TL</strong>: 50 ml</p>
', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2016/6/sc_small_2091_timeless-ferment-snail-eye-cream.jpg', N'/images/photoproduct/2016/6/sc_full_2091_timeless-ferment-snail-eye-cream.jpg', CAST(0x0000A6340114B593 AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 1995000.0000, 0, 18, N'vi', 1, 1, 0, N'Timeless-Ferment-Snail-Eye-Cream', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (47, N'The Chok Chok Green Tea Watery Essence', N'KT_BT_006', N'84', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Chứa nước tr&agrave; xanh 100% nguy&ecirc;n chất thu được sau một qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y gi&uacute;p l&agrave;n da trở n&ecirc;n đầy đủ độ ẩm v&agrave; dưỡng chất. Sản phẩm c&oacute; khả năng dưỡng ẩm phong ph&uacute;, giảm k&iacute;ch ứng v&agrave; tối đa h&oacute;a dinh dưỡng th&ocirc;ng qua qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n. Sản phẩm hấp thụ v&agrave;o da dựa tr&ecirc;n việc cung cấp độ ẩm, l&agrave;m mới cho da, hấp thụ nhanh v&agrave;o da m&agrave; kh&ocirc;ng để lại bất kỳ dư lượng d&iacute;nh r&iacute;t. Đ&atilde; được b&aacute;c sĩ da liễu thử nghiệm về độ an to&agrave;n.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>- Chiết xuất 100% nước l&aacute; tr&agrave; non được l&ecirc;n men tự nhi&ecirc;n.</p>

<p>- Qui tr&igrave;nh:</p>

<p>Step 1: Thu hoạch l&aacute; tr&agrave; từ v&ugrave;ng n&ocirc;ng th&ocirc;n, phơi kh&ocirc; lần 1, hấp l&ecirc;n v&agrave; gi&atilde; nhỏ, tạo th&agrave;nh vi&ecirc;n nhỏ, x&acirc;u v&agrave;o que, phơi lần 2. Sau đ&oacute;, tạo th&agrave;nh nước tr&agrave; đựng trong một hũ lớn.</p>

<p>Step 2: Nước tr&agrave; để 360giờ chuẩn bị cho qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n</p>

<p>Step 3: L&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y</p>

<p><strong>Điểm mạnh sản phẩm:</strong></p>

<p>- Sản phẩm chiết xuất l&ecirc;n men từ tr&agrave; xanh cung cấp độ ẩm dồi d&agrave;o cho l&agrave;n da. Chứa 100% nước tr&agrave; xanh thu được sau khi l&ecirc;n men tự nhi&ecirc;n l&aacute; tr&agrave; xanh tươi đ&atilde; được chăm s&oacute;c tỉ mỉ quanh năm v&agrave; đ&atilde; được thu hoạch từ những v&ugrave;ng hoang sơ của v&ugrave;ng Jangheung.</p>

<p>- Qu&aacute; tr&igrave;nh l&ecirc;n men tối đa dưỡng chất v&agrave; nhanh ch&oacute;ng cung cấp độ ẩm cho da.</p>

<p>- Sản phẩm dạng gel đem lại cảm gi&aacute;c tươi m&aacute;t v&agrave; độ ẩm cho da.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>-Kh&aacute;ch h&agrave;ng muốn nhanh ch&oacute;ng cung cấp độ ẩm cho l&agrave;n da kh&ocirc;</p>

<p>-Kh&aacute;ch h&agrave;ng muốn kh&aacute;ch h&agrave;ng l&agrave;m ẩm l&agrave;m mới l&agrave;n da</p>

<p>-Những người muốn một d&ograve;ng ẩm chăm s&oacute;c da với gi&aacute; hợp l&yacute;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau khi d&ugrave;ng nước c&acirc;n bằng, lấy một lượng vừa đủ thoa đều khắp mặt sau đ&oacute; d&ugrave;ng tay vỗ nhẹ để tăng độ thẩm thấu.</p>

<p><strong>TL</strong>: 160 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2104_the-chok-chok-green-tea-watery-essence.jpg', N'/images/photoproduct/2016/6/sc_full_2104_the-chok-chok-green-tea-watery-essence.jpg', CAST(0x0000A6340110DAE1 AS DateTime), 1, N'160ml', N'', N'Hàn Quốc', 0.0000, 669000.0000, 0, 12, N'vi', 1, 1, 1, N'The-Chok-Chok-Green-Tea-Watery-Essence', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (52, N'Dầu gội chống rối tóc làm suôn mượt tóc Alfaparf Precious Oil 1000ml', N'KT_BT_003', N'67', N'Thành phần an toàn
Không chứa hóa chất độc hại
Hiệu quả nhanh chóng', N'<h2>Dầu gội chống rối t&oacute;c l&agrave;m su&ocirc;n mượt t&oacute;c Alfaparf Precious Oil 1000ml</h2>

<p><a href="/vi/product/products/67/Dau-goi" target="_blank">Dầu gội chống rối t&oacute;c</a>/ su&ocirc;n mượt t&oacute;c<br />
C&ocirc;ng dụng: C&ocirc;ng thức dầu gội tinh dầu kh&ocirc;ng chứa Sulphate cải tiến kết hợp chất l&agrave;m sạch nhẹ nh&agrave;ng với hiệu quả gi&uacute;p t&oacute;c theo nếp v&agrave; chống rối t&oacute;c mạnh mẽ, tạo cho t&oacute;c mềm mượt v&agrave; cực k&igrave; dễ chải.<br />
Th&agrave;nh phần:<br />
Hệ thống sản phẩm ho&agrave;n hảo chiết xuất từ Tinh dầu Prickly Pear v&agrave; Tinh dầu Pequi đảm bảo c&aacute;c hoạt động chống rối t&oacute;c v&agrave; chống ẩm cho t&oacute;c thẳng v&agrave; t&oacute;c xoăn. Quy tr&igrave;nh chiết xuất &eacute;p nguội từ c&aacute;c quả Pequi v&agrave; Prickly Pear tạo ra tinh chất giữ lại nguy&ecirc;n vẹn axit b&eacute;o, vitamin A v&agrave; protein đ&atilde; l&agrave;m n&ecirc;n đặc t&iacute;nh thi&ecirc;n nhi&ecirc;n cho Precious Oil.<br />
Kh&ocirc;ng c&oacute; th&agrave;nh phần solfates, parabens, paraffins, mineral oil, allergens<br />
Tinh dầu Prickly Pear &nbsp;được chứng nhận bởi ECOCERT<br />
C&aacute;ch sử dụng: Thoa dầu gội chống rối t&oacute;c tr&ecirc;n t&oacute;c ẩm, massage đều tạo bọt v&agrave; xả sạch. Xoa dầu gội th&ecirc;m một lần nữa nếu cần thiết, rồi xả sạch với nước.<br />
Ng&agrave;y SX: Xem tr&ecirc;n bao b&igrave;</p>

<p>HSD: 05 năm kể từ ng&agrave;y SX</p>
', N'/images/photoproduct/2016/5/sc_small_2067_2.jpg', N'/images/photoproduct/2016/5/sc_full_2067_2.jpg', CAST(0x0000A606016F111F AS DateTime), 1, N'40ml', N'', N'Hàn Quốc', 0.0000, 709000.0000, 0, 3, N'vi', 1, 1, 0, N'Dau-goi-chong-roi-toc-lam-suon-muot-toc-Alfaparf-Precious-Oil-1000ml', 1, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (56, N'The Hayan Cherry Blossom Whitening Cream', N'KT_CC_002', N'85', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem dưỡng l&agrave;m trắng da chiết xuất từ hoa anh đ&agrave;o đảo Jeju, l&agrave; th&agrave;nh phần gi&agrave;u vitamin v&agrave; cung cấp hiệu quả l&agrave;m trắng tuyệt vời, gi&uacute;p cung cấp dưỡng chất tối ưu cho l&agrave;n da, đồng thời tạo lớp m&agrave;ng bảo vệ chống sự tho&aacute;t hơi nước từ b&ecirc;n trong da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Th&agrave;nh phần 100% tinh khiết từ vua của lo&agrave;i hoa Anh đ&agrave;o được lấy từ Mt. Hallasan ở v&ugrave;ng ven hoang sơ của đảo Jeju l&agrave;m cho l&agrave;n da xỉn tr&ocirc;ng s&aacute;ng hơn v&agrave; đầy sức sống. Nước hoa anh đ&agrave;o tinh khiết l&agrave; th&agrave;nh phần gi&agrave;u vitamin v&agrave; cung cấp một hiệu quả l&agrave;m trắng tuyệt vời. Nước hoa Anh đ&agrave;o c&oacute; m&agrave;u hồng nhạt hấp thụ nhanh ch&oacute;ng v&agrave;o da, đem lại vẻ sảng kho&aacute;i cho l&agrave;n da v&agrave; kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&iacute;nh r&iacute;t.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng muốn hồi sinh l&agrave;n da tối xỉn</p>

<p>Kh&aacute;ch h&agrave;ng da c&oacute; đốm n&acirc;u v&agrave; nhược điểm tr&ecirc;n bề mặt da</p>

<p>Kh&aacute;ch h&agrave;ng muốn một sản phẩm chăm s&oacute;c da kh&ocirc;ng d&iacute;nh r&iacute;t thế hệ mới</p>

<p>Kh&aacute;ch h&agrave;ng muốn sản phẩm chăm s&oacute;c l&agrave;m trắng với gi&aacute; cả hợp l&yacute;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau khi sử dụng sữa dưỡng, d&ugrave;ng một lượng kem vừa đủ &aacute;p l&ecirc;n gương mặt v&agrave; thoa theo chiều cấu tr&uacute;c da</p>

<p><strong>TL</strong>: 60 ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2066_4.jpg', N'/images/photoproduct/2016/7/sc_full_2066_4.jpg', CAST(0x0000A63900ACED21 AS DateTime), 1, N'60ml', N'', N'Hàn Quốc', 0.0000, 880000.0000, 0, 6, N'vi', 1, 1, 1, N'The-Hayan-Cherry-Blossom-Whitening-Cream', 0, CAST(0x0000A3E900000000 AS DateTime), CAST(0x0000A3EE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (57, N'Dầu gội chống rối lam suôn mượt tóc Alfaparf Precious Oil 250ml  ', N'KT_BT_005', N'67', N'Thành phần an toàn
Không chứa hóa chất độc hại
Hiệu quả nhanh chóng', N'<h2>Dầu gội chống rối lam su&ocirc;n mượt t&oacute;c Alfaparf Precious Oil 250ml</h2>

<p><a href="http://www.lazada.vn/cham-soc-suc-khoe-va-lam-dep" target="&quot;_blank&quot;">Dầu gội chống rối t&oacute;c</a>/ su&ocirc;n mượt t&oacute;c<br />
C&ocirc;ng dụng: C&ocirc;ng thức dầu gội tinh dầu kh&ocirc;ng chứa Sulphate cải tiến kết hợp chất l&agrave;m sạch nhẹ nh&agrave;ng với hiệu quả gi&uacute;p t&oacute;c theo nếp v&agrave; chống rối t&oacute;c mạnh mẽ, tạo cho t&oacute;c mềm mượt v&agrave; cực k&igrave; dễ chải.<br />
Th&agrave;nh phần:<br />
Hệ thống sản phẩm ho&agrave;n hảo chiết xuất từ Tinh dầu Prickly Pear v&agrave; Tinh dầu Pequi đảm bảo c&aacute;c hoạt động chống rối t&oacute;c v&agrave; chống ẩm cho t&oacute;c thẳng v&agrave; t&oacute;c xoăn. Quy tr&igrave;nh chiết xuất &eacute;p nguội từ c&aacute;c quả Pequi v&agrave; Prickly Pear tạo ra tinh chất giữ lại nguy&ecirc;n vẹn axit b&eacute;o, vitamin A v&agrave; protein đ&atilde; l&agrave;m n&ecirc;n đặc t&iacute;nh thi&ecirc;n nhi&ecirc;n cho Precious Oil.<br />
Kh&ocirc;ng c&oacute; th&agrave;nh phần solfates, parabens, paraffins, mineral oil, allergens<br />
Tinh dầu Prickly Pear &nbsp;được chứng nhận bởi ECOCERT<br />
C&aacute;ch sử dụng: Thoa dầu gội chống rối t&oacute;c tr&ecirc;n t&oacute;c ẩm, massage đều tạo bọt v&agrave; xả sạch. Xoa dầu gội th&ecirc;m một lần nữa nếu cần thiết, rồi xả sạch với nước.<br />
Ng&agrave;y SX: Xem tr&ecirc;n bao b&igrave;<br />
HSD: 05 năm kể từ ng&agrave;y SX</p>
', N'/images/photoproduct/2016/5/sc_small_2060_1.jpg', N'/images/photoproduct/2016/5/sc_full_2060_1.jpg', CAST(0x0000A61D00E234DF AS DateTime), 1, N'40ml', N'', N'Hàn Quốc', 0.0000, 279000.0000, 0, 2, N'vi', 1, 1, 1, N'Dau-goi-chong-roi-lam-suon-muot-toc-Alfaparf-Precious-Oil-250ml', 1, CAST(0x0000A3FE00000000 AS DateTime), CAST(0x0000A40500000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (58, N'The Fresh Phytoncide Pore Essence', N'KT_BT_004', N'84', N'<p><strong>C&ocirc;ng dụng:&nbsp;</strong></p>

<p>Tinh chất gi&uacute;p kết cấu da mịn m&agrave;ng v&agrave; tươi mới với th&agrave;nh phần chất tinh khiết 100% từ nước Hinoki của v&ugrave;ng n&uacute;i Hwangnyeongsan. Gi&uacute;p loại bỏ tạp chất v&agrave; b&atilde; nhờn từ lỗ ch&acirc;n l&ocirc;ng, nhanh ch&oacute;ng cải thiện t&igrave;nh trạng lỗ ch&acirc;n l&ocirc;ng mịn v&agrave; đ&agrave;n hồi với chức năng l&agrave;m se kh&iacute;t tuyệt vời. Đ&atilde; được b&aacute;c sĩ da liễu thử nghiệm về độ an to&agrave;n.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Nước Hinoki từ v&ugrave;ng n&uacute;i Hwangnyeongsan của H&agrave;n Quốc. hiệu quả:</p>

<p>- L&agrave;m sạch lỗ ch&acirc;n l&ocirc;ng</p>

<p>- Chăm s&oacute;c b&atilde; nhờn</p>

<p>- Cải thiện sự đ&agrave;n hồi cho da</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng muốn chăm s&oacute;c lỗ ch&acirc;n l&ocirc;ng s&acirc;u</p>

<p>Kh&aacute;ch h&agrave;ng c&oacute; lỗ ch&acirc;n long đ&atilde; mở rộng</p>

<p>Kh&aacute;ch h&agrave;ng c&oacute; b&atilde; nhờn qu&aacute; mức</p>

<p>Kh&aacute;ch h&agrave;ng muốn c&oacute; một sản phẩm chăm s&oacute;c lỗ ch&acirc;n l&ocirc;ng với gi&aacute; hợp l&yacute;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau khi sử dụng The Fresh Phytoncide Toner, lấy 1 lượng vừa đủ thoa đều khắp mặt, sau đ&oacute; d&ugrave;ng tay vỗ nhẹ để tăng độ thẩm thấu.&nbsp;</p>

<p><strong>TL</strong>: 55 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2077_the-fresh-phytoncide-pore-essence.jpg', N'/images/photoproduct/2016/6/sc_full_2077_the-fresh-phytoncide-pore-essence.jpg', CAST(0x0000A6340110820B AS DateTime), 1, N'55ml', N'', N'Hàn Quốc', 0.0000, 689000.0000, 0, 4, N'vi', 1, 1, 1, N'The-Fresh-Phytoncide-Pore-Essence', NULL, CAST(0x0000A3FC00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (59, N'Timeless Ferment Snail Toner', N'KT_BT_002', N'82', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Sản phẩm kết hợp giữa phương ph&aacute;p chắt lọc tinh chất ốc s&ecirc;n v&agrave; l&ecirc;n men với tr&agrave; xanh gi&uacute;p phục hồi l&agrave;n da bị tổn thương.</p>

<p><strong>Hiệu quả:</strong></p>

<p>Cải thiện c&aacute;c đốm sậm m&agrave;u v&agrave; sẹo mụn</p>

<p>Chứa th&agrave;nh phần Chondroitin t&aacute;c dụng như một loại kem dưỡng ẩm Hydrat v&agrave; trẻ h&oacute;a l&agrave;n da</p>

<p>Allantoin gi&uacute;p chăm s&oacute;c da dịu nhẹ, chống k&iacute;ch ứng v&agrave; loại bỏ tế b&agrave;o sừng h&oacute;a</p>

<p>Glycolate loại bỏ tế b&agrave;o chết v&agrave; l&agrave;m sang da</p>

<p>Collagen elastin tăng độ đ&agrave;n hồi</p>

<p>Nước c&acirc;n bằng từ nhớt ốc s&ecirc;n l&ecirc;n men, bột v&agrave;ng v&agrave; tr&agrave; xanh</p>

<p>- phục hồi l&agrave;n da bị tổn thương. Nước hoa hồng chứa 45% h&agrave;m lượng tinh chất chiết xuất từ nhớt ốc s&ecirc;n l&ecirc;n men v&agrave; bột v&agrave;ng</p>

<p>- th&agrave;nh phần gi&uacute;p da hấp thu dưỡng chất nhanh ch&oacute;ng, thải độc cho da. Đồng thời th&agrave;nh phần bột v&agrave;ng được hấp thu v&agrave;o da một c&aacute;ch nhanh ch&oacute;ng, gi&uacute;p thải độc cho da.</p>

<p>Hiệu quả c&acirc;n bằng độ ẩm ngay lập tức (l&agrave; bước đầu tiền chăm s&oacute;c da gi&uacute;p da khỏe mạnh, s&aacute;ng b&oacute;ng).</p>

<p>Với c&ocirc;ng thức 10 free, sản phẩm đ&atilde; được kiểm nghiệm về độ an to&agrave;n cho da.</p>

<p><strong>Th&agrave;nh phần</strong>: Chiết xuất 45% từ nhớt ốc s&ecirc;n l&ecirc;n men, bột v&agrave;ng, tr&agrave; xanh.</p>

<p><strong>Đối tượng sử dụng</strong>: Da bị sẹo mụn Da kh&ocirc; v&agrave; th&ocirc; r&aacute;p Da k&eacute;m săn chắc Da xỉn m&agrave;u</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>C&aacute;ch 1: Cho 1 lượng vừa đủ v&agrave;o b&ocirc;ng tẩy trang, thoa đều khắp mặt rồi vỗ nhẹ để tăng độ thẩm thấu.</p>

<p>C&aacute;ch 2: Đổ 1 lượng nước c&acirc;n bằng ra l&ograve;ng b&agrave;n tay, xoa đều v&agrave; &aacute;p nhẹ l&ecirc;n bề mặt da, gi&uacute;p sản phẩm thẩm thấu tối ưu v&agrave; dịu nhẹ, ph&ugrave; hợp với l&agrave;n da mẫn cảm.</p>

<p><strong>TL</strong>:150 ml</p>
', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2016/6/sc_small_2076_ferment-snail-toner.jpg', N'/images/photoproduct/2016/6/sc_full_2076_ferment-snail-toner.jpg', CAST(0x0000A634010EC5BF AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 1630000.0000, 0, 22, N'vi', 1, 1, 0, N'Timeless-Ferment-Snail-Toner', NULL, CAST(0x0000A3FC00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (60, N'The Hayan Cherry Blossom Whitening Skin', N'KT_BT_001', N'82', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Nước c&acirc;n bằng từ hoa anh đ&agrave;o tinh khiết đảo Jeju - th&agrave;nh phần gi&agrave;u vitamin gi&uacute;p đem lại vẻ đẹp tươi s&aacute;ng cho l&agrave;n da tối xỉn v&agrave; l&agrave;m s&aacute;ng c&aacute;c đốm n&aacute;m v&agrave; t&agrave;n nhang, hiệu quả l&agrave;m s&aacute;ng v&agrave; hồi sinh l&agrave;n da xỉn</p>

<p>Đặc biệt kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&iacute;nh r&iacute;t.</p>

<p>Đ&atilde; được b&aacute;c sĩ da liễu thử nghiệm về độ an to&agrave;n cho da</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Th&agrave;nh phần 100% tinh khiết từ vua của lo&agrave;i hoa Anh đ&agrave;o được lấy từ Mt. Hallasan ở v&ugrave;ng ven hoang sơ của đảo Jeju l&agrave;m cho l&agrave;n da xỉn tr&ocirc;ng s&aacute;ng hơn v&agrave; đầy sức sống. Nước hoa anh đ&agrave;o tinh khiết l&agrave; th&agrave;nh phần gi&agrave;u vitamin v&agrave; cung cấp một hiệu quả l&agrave;m trắng tuyệt vời. Nước hoa Anh đ&agrave;o c&oacute; m&agrave;u hồng nhạt hấp thụ nhanh ch&oacute;ng v&agrave;o da, đem lại vẻ sảng kho&aacute;i cho l&agrave;n da v&agrave; kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&iacute;nh r&iacute;t.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng muốn hồi sinh l&agrave;n da tối xỉn</p>

<p>Kh&aacute;ch h&agrave;ng da c&oacute; đốm n&acirc;u v&agrave; nhược điểm tr&ecirc;n bề mặt da</p>

<p>Kh&aacute;ch h&agrave;ng muốn một sản phẩm chăm s&oacute;c da kh&ocirc;ng d&iacute;nh r&iacute;t thế hệ mới</p>

<p>Kh&aacute;ch h&agrave;ng muốn sản phẩm chăm s&oacute;c l&agrave;m trắng với gi&aacute; cả hợp l&yacute;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>C&aacute;ch 1: D&ugrave;ng b&ocirc;ng tẩy trang thấm 1 lượng vừa đủ thoa đều khắp mặt theo chiều cấu tạo da, sau đ&oacute; d&ugrave;ng tay vỗ nhẹ để tăng độ thấm thấu.</p>

<p>C&aacute;ch 2: Đổ 1 lượng nước c&acirc;n bằng ra l&ograve;ng b&agrave;n tay, xoa đều v&agrave; &aacute;p nhẹ l&ecirc;n bề mặt da, gi&uacute;p sản phẩm thẩm thấu tối ưu v&agrave; dịu nhẹ, ph&ugrave; hợp với l&agrave;n da mẫn cảm.</p>

<p><strong>TL:</strong>&nbsp;180 ml</p>
', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2016/6/sc_small_2094_the-hayan-cherry-blossom-whitening-skin.jpg', N'/images/photoproduct/2016/6/sc_full_2094_the-hayan-cherry-blossom-whitening-skin.jpg', CAST(0x0000A634010E897E AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 900000.0000, 0, 9, N'vi', 1, 1, 1, N'The-Hayan-Cherry-Blossom-Whitening-Skin', NULL, CAST(0x0000A3FC00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (61, N'The Fresh Phytoncide Pore Skin', N'KT_CC_005', N'82', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Nước c&acirc;n bằng l&agrave;m sạch lỗ ch&acirc;n l&ocirc;ng, kiểm so&aacute;t b&atilde; nhờn, cải thiện độ đ&agrave;n hồi.</p>

<p>Chiết xuất 100% nước tinh khiết từ rừng gi&agrave; Hinoki - gi&agrave;u Phytoncide l&agrave; th&agrave;nh phần c&oacute; hiệu quả trong việc loại bỏ c&aacute;c tạp chất v&agrave; thắt chặt lỗ ch&acirc;n l&ocirc;ng.</p>

<p>Chăm s&oacute;c lỗ ch&acirc;n l&ocirc;ng một c&aacute;ch hiệu quả, l&agrave;m mới cấu tr&uacute;c da m&agrave; kh&ocirc;ng c&oacute; bất kỳ cảm gi&aacute;c d&iacute;nh r&iacute;t.</p>

<p>Sản phẩm đ&atilde; được thử nghiệm về độ an to&agrave;n cho l&agrave;n da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>100% th&agrave;nh phần nước tinh khiết của rừng Hinoki tr&ecirc;n n&uacute;i Hwangnyeongsan ở Jangseong, tỉnh Jeonnam.</p>

<p>Nước n&agrave;y c&oacute; chứa Phytoncide l&agrave; th&agrave;nh phần c&oacute; hiệu quả l&agrave;m tươi mới, l&agrave;m sạch l&agrave;n da chăm s&oacute;c lỗ ch&acirc;n l&ocirc;ng, chăm s&oacute;c b&atilde; nhờn, cải thiện sự đ&agrave;n hồi.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng đ&atilde; mở rộng lỗ ch&acirc;n l&ocirc;ng</p>

<p>Kh&aacute;ch h&agrave;ng c&oacute; b&atilde; nhờn qu&aacute; mức</p>

<p>Kh&aacute;ch h&agrave;ng muốn một sản phẩm chăm s&oacute;c lỗ ch&acirc;n l&ocirc;ng s&acirc;u với gi&aacute; hợp l&yacute;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>D&ugrave;ng b&ocirc;ng tẩy trang thấm 1 lượng vừa đủ thoa đều khắp mặt, đặc biệt l&agrave; v&ugrave;ng chữ T tập trung nhiều dầu, sau đ&oacute; d&ugrave;ng tay vỗ nhẹ để tăng độ thẩm thấu. Sử dụng 2 lần/ 1 ng&agrave;y</p>

<p><strong>TL</strong>: 180 ml</p>
', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2016/6/sc_small_2085_the-fresh-phytoncide-pore-skin.jpg', N'/images/photoproduct/2016/6/sc_full_2085_the-fresh-phytoncide-pore-skin.jpg', CAST(0x0000A634010E64BA AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 547000.0000, 0, 5, N'vi', 1, 1, 1, N'The-Fresh-Phytoncide-Pore-Skin', NULL, CAST(0x0000A3FC00000000 AS DateTime), CAST(0x0000A3FE00000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (62, N'Timeless Ferment Snail Essence', N'KT_CC_004', N'84', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Tinh chất tăng cường khả năng t&aacute;i tạo da. Chứa 80% h&agrave;m lượng tinh chất nhớt ốc s&ecirc;n, kết hợp giữa chức năng của ample v&agrave; essence (trộn đều ), trong đ&oacute; Ample c&oacute; khả năng dưỡng ẩm cao, hấp thu tốt v&agrave; Essence gi&uacute;p tạo h&agrave;ng r&agrave;o bảo vệ cho da. Sản phẩm đ&atilde; được kiểm nghiệm về độ an to&agrave;n cho da Chứa c&ocirc;ng thức 10-free&ndash; Synthetic Perfume, Paraben, Mineral Oil, Benzophenon-5, BHT, Triclosan, Triethanolamine, Surfactant, Tar color, Talc</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>- Nhớt từ loại ốc s&ecirc;n nu&ocirc;i bằng tr&agrave; xanh v&agrave;ng từ 5 ~ 6 th&aacute;ng tuổi gi&uacute;p Hydrat / trẻ h&oacute;a da, loại bỏ tế b&agrave;o chết</p>

<p>- Tr&agrave; xanh v&agrave;ng l&ecirc;n men: chống oxi h&oacute;a, ngăn chặn c&aacute;c vấn đề của da</p>

<p>- Bột v&agrave;ng thanh lọc, điều chỉnh tone da: t&aacute;c dụng trẻ h&oacute;a Hợp chất n&agrave;y (nhớt ốc s&ecirc;n, tr&agrave; xanh, bột v&agrave;ng) được l&ecirc;n men 2 lần trong v&ograve;ng 365 ng&agrave;y n&ecirc;n đặc biệt an to&agrave;n cho l&agrave;n da, đồng thời gi&uacute;p dưỡng chất được thẩm thấu tối ưu v&agrave;o b&ecirc;n trong da.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>- Da bị sẹo mụn</p>

<p>- Da kh&ocirc; v&agrave; th&ocirc; r&aacute;p</p>

<p>- Da k&eacute;m săn chắc</p>

<p>- Da xỉn m&agrave;u</p>

<p><strong><strong>Hướng dẫn sử dụng:</strong></strong></p>

<p>&nbsp;Cho 1 lượng vừa đủ v&agrave;o b&ocirc;ng tẩy trang, thoa đều khắp mặt rồi vỗ nhẹ để tăng độ thẩm thấu.</p>

<p><strong>TL</strong>: 50 ml</p>
', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2016/6/sc_small_2097_timeless-ferment-snail-essence.jpg', N'/images/photoproduct/2016/6/sc_full_2097_timeless-ferment-snail-essence.jpg', CAST(0x0000A6340110F46A AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 1995000.0000, 0, 20, N'vi', 1, 1, 0, N'Timeless-Ferment-Snail-Essence', NULL, CAST(0x0000A3FB00000000 AS DateTime), CAST(0x0000A3F600000000 AS DateTime), 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (63, N'Dầu gội ngăn ngừa rụng tóc Alfaparf Scalp Care 250ml ', N'KT_NLK_001', N'67', N'Thành phần an toàn
Không chứa hóa chất độc hại
Hiệu quả nhanh chóng', N'<h2>Dầu gội ngăn ngừa rụng t&oacute;c Alfaparf Scalp Care 250ml</h2>

<p>ALFAPARF SDL SCALP ENERGIZING SHAMPOO 1000ML<br />
Dầu gội Scalp năng lượng chống rụng t&oacute;c 1000ml<br />
C&ocirc;ng dụng: Sản phẩm gi&uacute;p c&acirc;n bằng, t&aacute;i tạo m&ocirc;i trường nang t&oacute;c v&agrave; da đầu, gi&uacute;p t&oacute;c tăng trưởng mạnh mẽ hơn, khỏe đẹp, s&aacute;ng b&oacute;ng tự nhi&ecirc;n. Đồng thời ngăn chặn v&agrave; giảm thiểu t&igrave;nh trạng rụng t&oacute;c, bảo vệ nang t&oacute;c từ t&aacute;c động của gốc tự do.<br />
Th&agrave;nh phần:&nbsp;<br />
Hợp chất Shine Fix Complex giữ ổn định độ b&oacute;ng s&aacute;ng<br />
Hợp chất Color Fix Complex giữ ổn định v&agrave; bảo vệ m&agrave;u nhuộm<br />
Renovagenyl &nbsp;gi&uacute;p t&aacute;i tạo v&agrave; k&iacute;ch th&iacute;ch da đầu.<br />
3 hợp chất Energizing bao gồm tế b&agrave;o từ nho -Pluripotent grape cells, quả &oacute;c ch&oacute; xanh - Green Walnut extract, Rocket Extract t&aacute;c động &nbsp;t&iacute;ch cực đến sự ph&aacute;t triển của c&aacute;c tế b&agrave;o t&oacute;c vừa nh&uacute; cũng như bảo vệ nang t&oacute;c từ c&aacute;c gốc tự do v&agrave; sự oxi h&oacute;a, gi&uacute;p ngăn ngừa v&agrave; giảm thiểu rụng t&oacute;c.<br />
Kh&ocirc;ng c&oacute; th&agrave;nh phần solfates, parabens, paraffins, mineral oil, allergens<br />
Hương thơm v&agrave; c&aacute;c th&agrave;nh phần chiết xuất từ thực vật , kh&ocirc;ng c&oacute; chất g&acirc;y dị ứng<br />
C&aacute;ch sử dụng: Thoa dầu gội l&ecirc;n t&oacute;c ẩm hoặc ướt. Giữ nguy&ecirc;n trong 2 đến 3 ph&uacute;t sau đ&oacute; gội sạch. C&oacute; thể lặp lại quy tr&igrave;nh nếu cần thiết. Hiệu quả tốt nhất khi sử dụng h&agrave;ng ng&agrave;y.<br />
Ng&agrave;y SX: Được m&atilde; h&oacute;a bằng 10 k&yacute; tự chữ v&agrave; số KK Y W XX Z H PP, trong đ&oacute;: KK - ng&agrave;y sx; Y - th&aacute;ng sx (từ A đến L tương đương từ th&aacute;ng 1 đến th&aacute;ng 12); W - số cuối của năm sx.( V&iacute; dụ: 19 F 2 03 I A 00 - Ng&agrave;y SX: 19/6/2012)<br />
Hạn SD: 5 năm kể từ ng&agrave;y sản xuất</p>
', N'/images/photoproduct/2016/5/sc_small_2091_9.jpg', N'/images/photoproduct/2016/5/sc_full_2091_9.jpg', CAST(0x0000A6060173F671 AS DateTime), 1, N'40ml', N'', N'Hàn Quốc', 0.0000, 279000.0000, 0, 10, N'vi', 1, 1, 0, N'Dau-goi-ngan-ngua-rung-toc-Alfaparf-Scalp-Care-250ml', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (64, N'Naturalth Goat Milk Whitening Essence', N'KT_NLK_002', N'84', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Tinh chất c&oacute; chứa 100 dưỡng chất thiết yếu với chức năng l&agrave;m s&aacute;ng da như B3,C, E</p>

<p>Sản phẩm được v&iacute; như d&ograve;ng sản phẩm c&oacute; khả năng &ldquo; bổ sung vitamin trực tiếp cho da&rdquo; v&igrave; c&ocirc;ng dụng của n&oacute; tương tự như khi ti&ecirc;m trực tiếp vitamin v&agrave;o trong da gi&uacute;p da s&aacute;ng b&oacute;ng v&agrave; mịn m&agrave;ng .</p>

<p>Chứa 50% h&agrave;m lượng sữa d&ecirc; nguy&ecirc;n chất, tinh chất l&agrave;m trắng da gi&uacute;p da bạn trở n&ecirc;n tươi s&aacute;ng hơn, săn chắc hơn, chăm s&oacute;c da từ s&acirc;u b&ecirc;n trong da, đem lại hiệu quả nhanh ch&oacute;ng cho l&agrave;n da . Tinh chất l&agrave;m s&aacute;ng da dễ d&agrave;ng hấp thụ nhanh ch&oacute;ng v&agrave;o da v&agrave; đem lại cho l&agrave;n da cảm gi&aacute;c dễ chịu, kh&ocirc;ng bết d&iacute;nh.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Chứa 30% chiết xuất từ sữa d&ecirc;. Sữa d&ecirc; n&uacute;i tinh khiết từ thi&ecirc;n nhi&ecirc;n, với th&agrave;nh phần dinh dưỡng tương tự như sữa mẹ đem lại l&agrave;n da khỏe mạnh từ b&ecirc;n trong. Sức mạnh của protein h&ograve;a tan từ sữa, c&oacute; khả năng loại bỏ tế b&agrave;o chết dư thừa, c&oacute; khả năng dưỡng da dịu nhẹ v&agrave; giảm thiểu mẩn đỏ.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>- Da kh&ocirc; v&agrave; xỉn m&agrave;u</p>

<p>- Da c&oacute; c&aacute;c đốm sậm m&agrave;u v&agrave; t&agrave;n nhang</p>

<p>- Bất kỳ kh&aacute;ch h&agrave;ng n&agrave;o muốn t&igrave;m d&ograve;ng sản phẩm dưỡng s&aacute;ng da với khả năng hấp thụ cao</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Lấy 1 lượng vừa đủ thoa đều khắp mặt rồi nhẹ nh&agrave;ng massage cho dưỡng chất thấm đều v&agrave;o s&acirc;u b&ecirc;n trong.</p>

<p><strong>TL</strong>: 50 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2075_naturalth-goat-milk-whitening-essence-3.jpg', N'/images/photoproduct/2016/6/sc_full_2075_naturalth-goat-milk-whitening-essence-3.jpg', CAST(0x0000A63401111B75 AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 1080000.0000, 0, 26, N'vi', 1, 1, 0, N'Naturalth-Goat-Milk-Whitening-Essence', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (65, N'Naturalth Goat Milk Whitening Toner', N'KT_NLK_003', N'82', N'<p><strong>C&ocirc;ng dụng</strong>:</p>

<p>Nước hoa hồng đặc trị l&agrave;m trắng, chứa 30% th&agrave;nh phần sữa d&ecirc; tinh khiết từ v&ugrave;ng n&ocirc;ng th&ocirc;n sạch của New Zealand hiệu quả l&agrave;m sạch, se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng, lấy đi lớp da chết, duy tr&igrave; l&agrave;n da mềm mượt, s&aacute;ng b&oacute;ng. Sản phẩm v&ocirc; c&ugrave;ng tinh khiết, mềm mại v&agrave; đ&atilde; được thử nghiệm về độ an to&agrave;n.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Chứa 30% chiết xuất từ sữa d&ecirc;. Sữa d&ecirc; n&uacute;i tinh khiết từ thi&ecirc;n nhi&ecirc;n, với th&agrave;nh phần dinh dưỡng tương tự như sữa mẹ đem lại l&agrave;n da khỏe mạnh từ b&ecirc;n trong. Sức mạnh của protein h&ograve;a tan từ sữa, c&oacute; khả năng loại bỏ tế b&agrave;o chết dư thừa, c&oacute; khả năng dưỡng da dịu nhẹ v&agrave; giảm thiểu mẩn đỏ.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>- Da kh&ocirc; v&agrave; xỉn m&agrave;u</p>

<p>- Da c&oacute; c&aacute;c đốm sậm m&agrave;u v&agrave; t&agrave;n nhang</p>

<p>- Bất kỳ kh&aacute;ch h&agrave;ng n&agrave;o muốn t&igrave;m d&ograve;ng sản phẩm dưỡng s&aacute;ng da với khả năng hấp thụ cao</p>

<p><strong>Hướng dẫn sử dụng</strong>:</p>

<p>- C&aacute;ch 1: D&ugrave;ng b&ocirc;ng trang điểm thấm nước hoa hồng rồi vỗ nhẹ l&ecirc;n mặt cho tới khi b&ocirc;ng kh&ocirc; hết.</p>

<p>- C&aacute;ch 2: Hoặc bơm một lượng khoảng 2ml ra l&ograve;ng b&agrave;n tay, xoa đều v&agrave; &aacute;p l&ecirc;n bề mặt da, sau đ&oacute; xoa l&agrave;m n&oacute;ng hai l&ograve;ng b&agrave;n tay rồi &aacute;p ấn l&ecirc;n bề mặt da để gi&uacute;p sản phẩm thẩm thấu s&acirc;u hơn, giảm sự ma s&aacute;t cho l&agrave;n da.</p>

<p><strong>TL</strong>: 150 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2082_naturalth-goat-milk-whitening-toner-1.jpg', N'/images/photoproduct/2016/6/sc_full_2082_naturalth-goat-milk-whitening-toner-1.jpg', CAST(0x0000A634010EF174 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 985000.0000, 0, 28, N'vi', 1, 1, 0, N'Naturalth-Goat-Milk-Whitening-Toner', NULL, NULL, NULL, 2)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (66, N'Master Lab Snail Mucin Mask', N'KT_NLK_004', N'95', N'<p>Mặt nạ chăm s&oacute;c l&agrave;n da kh&ocirc; bị tổn thương</p>

<p>Mặt nạ miếng chiết xuất nhớt ốc s&ecirc;n chăm s&oacute;c l&agrave;n da kh&ocirc; v&agrave; bị tổn thương, duy tr&igrave; l&agrave;n da khỏe, mềm mịn, mượt m&agrave;.</p>

<p><strong>HDSD</strong>: Rửa sạch mặt, sau đ&oacute; lau kh&ocirc; mặt v&agrave; l&agrave;m theo thứ tự sau:</p>

<p>- Thoa ampoule l&ecirc;n khắp mặt</p>

<p>- D&ugrave;ng miếng Mask đắp l&ecirc;n</p>

<p>- Sau khoảng10-20 ph&uacute;t, nhẹ nh&agrave;ng th&aacute;o miếng mặt nạ rồi vỗ nhẹ cho dưỡng chất thẩm thấu s&acirc;u v&agrave;o trong da.</p>

<p><strong>DL</strong>: 19g</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p><strong>NSX</strong>: H&agrave;n Quốc</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2078_master-lab-snail-mucin-mask.jpg', N'/images/photoproduct/2016/6/sc_full_2078_master-lab-snail-mucin-mask.jpg', CAST(0x0000A63500B83FDB AS DateTime), 1, N'19g', N'', N'Hàn Quốc', 0.0000, 76000.0000, 0, 2, N'vi', 1, 0, 0, N'Master-Lab-Snail-Mucin-Mask', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (67, N'Naturalth Goat Milk Whitening Emulsion', N'KT_NLK_005', N'83', N'<p align="left"><strong>C&ocirc;ng dụng:</strong></p>

<p align="left">Sữa dưỡng da chứa 30% th&agrave;nh phần sữa d&ecirc; từ New Zealand bổ sung độ ẩm v&agrave; năng lượng từ b&ecirc;n trong, hiệu quả chăm s&oacute;c, duy tr&igrave; l&agrave;n da s&aacute;ng, b&oacute;ng.</p>

<p align="left">Sữa dưỡng dạng gel cung cấp độ ẩm cao với khả năng hấp thụ tuyệt vời nhẹ nh&agrave;ng chăm s&oacute;c da, đem lại hiểu quả gi&uacute;p da s&aacute;ng rạng rỡ bằng c&aacute;ch hấp thụ dưỡng chất nhanh ch&oacute;ng v&agrave;o da.</p>

<p align="left"><strong>Th&agrave;nh phần:</strong></p>

<p align="left">Chứa 30% chiết xuất từ sữa d&ecirc;. Sữa d&ecirc; n&uacute;i tinh khiết từ thi&ecirc;n nhi&ecirc;n, với th&agrave;nh phần dinh dưỡng tương tự như sữa mẹ đem lại l&agrave;n da khỏe mạnh từ b&ecirc;n trong. Sức mạnh của protein h&ograve;a tan từ sữa, c&oacute; khả năng loại bỏ tế b&agrave;o chết dư thừa, c&oacute; khả năng dưỡng da dịu nhẹ v&agrave; giảm thiểu mẩn đỏ</p>

<p align="left"><strong>Hướng dẫn sử dụng:</strong></p>

<p align="left">Ngay sau khi sử dụng tinh chất, lấy một lượng vừa đủ thoa đều theo kết cấu da vỗ nhẹ để tăng độ thẩm thấu. D&ugrave;ng 2 lần/ ng&agrave;y, s&aacute;ng v&agrave; tối.</p>

<p align="left"><strong>Đối tượng sử dụng:</strong></p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bất kỳ ai muốn cải thiện sắc diện da</p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bất kỳ ai muốn l&agrave;m giảm c&aacute;c sắc tố đỏ</p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bất kỳ ai muốn t&igrave;m sản phẩm c&oacute; kết th&uacute;c mềm mịn</p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bất kỳ ai muốn t&igrave;m sản phẩm l&agrave;m s&aacute;ng da</p>

<p align="left"><strong>TL:&nbsp;</strong>150ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2078_naturalth-goat-milk-whitening-emulsion-2.jpg', N'/images/photoproduct/2016/6/sc_full_2078_naturalth-goat-milk-whitening-emulsion-2.jpg', CAST(0x0000A634010FF7F4 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 985000.0000, 0, 27, N'vi', 1, 1, 0, N'Naturalth-Goat-Milk-Whitening-Emulsion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (71, N'Aquaporin Watery Essence', N'NT_CC_001', N'84', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Tinh chất dạng gel cung cấp đầy đủ độ ẩm cho c&aacute;c k&ecirc;nh nước của da. Cung cấp độ ẩm ho&agrave;n thiện v&agrave; l&acirc;u d&agrave;i cho da. Đem lại kết th&uacute;c sạch m&aacute;t.</p>

<p>&nbsp;C&ocirc;ng thức 4 Free : Parabens, talc, triclosan, sulfate-based surfactant an to&agrave;n cho da</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Aquaporin l&agrave; một k&ecirc;nh tế b&agrave;o, trong đ&oacute; nước c&oacute;thể đi qua được gi&uacute;p th&uacute;c đẩy l&agrave;n da khỏe mạnh bằng c&aacute;ch cung cấp độ ẩm cho da th&ocirc;ng quac&aacute;c k&ecirc;nh vận chuyển nước. Qua đ&oacute; sử dụng năng lượng từ c&aacute;c k&ecirc;nh nước:</p>

<p>- K&ecirc;nh nước từ hồ (Willow Water) gi&uacute;p l&agrave;m sạch v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh tuần ho&agrave;n.</p>

<p>- K&ecirc;nh nước từ s&ocirc;ng (Tảo xoắn Chlorella) cung cấp độ ẩm v&agrave; vitamin C.</p>

<p>- K&ecirc;nh nước từ biển (Tảo biển Spirulina) cung cấp oxy v&agrave; dưỡng chất.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>- Kh&aacute;ch h&agrave;ng c&oacute; nhu cầu t&igrave;m kiếm sản phẩm l&agrave;m s&aacute;ng v&agrave; l&agrave;m da tươi m&aacute;t</p>

<p>- Kh&aacute;ch h&agrave;ng da hỗn hợp t&igrave;m kiếm sản phẩm nướchoa hồng dịu nhẹ, thanh khiết</p>

<p>- Kh&aacute;ch h&agrave;ng da kh&ocirc; (cung cấp độ ẩm vừa đủ)</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau d&ugrave;ng nước c&acirc;n bằng, thoa 1 lượng vừa đủ v&agrave; vỗ nhẹ cho dưỡng chất thẩm thấu v&agrave;o da.</p>

<p><strong>TL</strong>: 55 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2067_aquaporin-watery-essence2.jpg', N'/images/photoproduct/2016/6/sc_full_2067_aquaporin-watery-essence2.jpg', CAST(0x0000A63401115000 AS DateTime), 1, N'55ml', N'', N'Hàn Quốc', 0.0000, 636000.0000, 0, 38, N'vi', 1, 1, 0, N'Aquaporin-Watery-Essence', NULL, NULL, NULL, 3)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (72, N'Aquaporin Water Volume Eye Gel', N'NT_BT_001', N'86', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Gel dưỡng mắt bổ sung độ ẩm cho v&ugrave;ng da mắt bị kh&ocirc;. Sản phẩm giảm đi hiện tượng mất nước, tăng cường khả năng duy tr&igrave; độ ẩm cho v&ugrave;ng da quanh mắt mẫn cảm. Sản phẩm kh&ocirc;ng g&acirc;y bết d&iacute;nh.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Aquaporin l&agrave; một k&ecirc;nh tế b&agrave;o, trong đ&oacute; nước c&oacute; thể đi qua được gi&uacute;p th&uacute;c đẩy l&agrave;n da khỏe mạnh bằng c&aacute;ch cung cấp độ ẩm cho da th&ocirc;ng qua c&aacute;c k&ecirc;nh vận chuyển nước. Qua đ&oacute; sử dụng năng lượng từ c&aacute;c k&ecirc;nh nước:</p>

<p>- K&ecirc;nh nước từ hồ (Willow Water) gi&uacute;p l&agrave;m sạch v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh tuần ho&agrave;n.</p>

<p>- K&ecirc;nh nước từ s&ocirc;ng (Tảoxoắn Chlorella) cung cấp độ ẩm v&agrave; vitamin C.</p>

<p>- K&ecirc;nh nước từ biển (TảobiểnSpirulina) cung cấp oxy v&agrave; dưỡng chất.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm chăm s&oacute;c da tươi m&aacute;t, kh&ocirc;ng bết d&iacute;nh Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm kem dưỡng ẩm dịu nhẹ , cung cấp độ ẩm vừa đủ cho l&agrave;n da kh&ocirc;.</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau khi dưỡng da, d&ugrave;ng một lượng bằng hạt ti&ecirc;u đen, chấm đều l&ecirc;n v&ugrave;ng da mắt, nhẹ nh&agrave;ng massage quanh v&ugrave;ng da mắt.</p>

<p><strong>TL</strong>: 30 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2124_aquaporin-water-volume-eye-gel2.jpg', N'/images/photoproduct/2016/6/sc_full_2124_aquaporin-water-volume-eye-gel2.jpg', CAST(0x0000A6340114CDC6 AS DateTime), 1, N'30ml', N'', N'Hàn Quốc', 0.0000, 688000.0000, 0, 37, N'vi', 1, 1, 0, N'Aquaporin-Water-Volume-Eye-Gel', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (74, N'Aquaporin Moisture Mist 50ml', N'NT_VP_001', N'87', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Xịt kho&aacute;ng bổ sung độ ẩm, cấu tạo dưới dạng phun sương gi&uacute;p dưỡng chất thấm s&acirc;u b&ecirc;n trong, cải thiện cho l&agrave;n da thiếu nước, gi&uacute;p da mướt mềm, tươi tắn.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Aquaporin l&agrave; một k&ecirc;nh tế b&agrave;o, trong đ&oacute; nước c&oacute; thể đi qua được gi&uacute;p th&uacute;c đẩy l&agrave;n da khỏe mạnh bằng c&aacute;ch cung cấp độ ẩm cho da th&ocirc;ng qua c&aacute;c k&ecirc;nh vận chuyển nước. Qua đ&oacute; sử dụng năng lượng từ c&aacute;c k&ecirc;nh nước:</p>

<p>- K&ecirc;nh nước từ hồ (Willow Water) gi&uacute;p l&agrave;m sạch v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh tuần ho&agrave;n.</p>

<p>- K&ecirc;nh nước từ s&ocirc;ng (Tảo xoắn Chlorella) cung cấp độ ẩm v&agrave; vitamin C.</p>

<p>- K&ecirc;nh nước từ biển (Tảo biển Spirulina) cung cấp oxy v&agrave; dưỡng chất.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng muốn sản phẩm kh&ocirc;ng bết d&iacute;nh, kh&ocirc;ng trọng lượng</p>

<p>Kh&aacute;ch h&agrave;ng muốn t&igrave;m kiếm 1 sản phẩm dưỡng ẩm dịu</p>

<p>Kh&aacute;ch h&agrave;ng da dầu kh&ocirc; ( thiếu ẩm )</p>

<p>Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm dưỡng sau khi make up</p>

<p>Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm phun sương si&ecirc;u mịn</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Đặt sản phẩm ở khoảng c&aacute;ch 20-30 cm, sau khi xịt được 30 gi&acirc;y, vỗ nhẹ để sản phẩm thẩm thấu.Sử dụng trước hoặc sau khi trang điểm, trước hoặc sau khi chơi thể thao, xịt khi cảm thấy da bị kh&ocirc;.</p>

<p><strong>TL</strong>: 150 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2072_aquaporin-moisture-mist.jpg', N'/images/photoproduct/2016/6/sc_full_2072_aquaporin-moisture-mist.jpg', CAST(0x0000A6340113CDA0 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 300000.0000, 0, 40, N'vi', 1, 1, 0, N'Aquaporin-Moisture-Mist-50ml', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (75, N'The Fresh Phytoncide Pore Gel Cream', N'NT_CTDV_001', N'85', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem dưỡng kiểm so&aacute;t b&atilde; nhờn, cải thiện độ đ&agrave;n hồi. Kem dưỡng da chiết xuất 100% nước từ rừng Hinoki - gi&agrave;u Phytoncide gi&uacute;p loại bỏ tạp chất v&agrave; b&atilde; nhờn từ lỗ ch&acirc;n l&ocirc;ng. Kết cấu dạng gel chăm s&oacute;c lỗ ch&acirc;n l&ocirc;ng một c&aacute;ch hiệu quả, l&agrave;m mới cấu tr&uacute;c da m&agrave; kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&iacute;nh r&iacute;t.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>&nbsp;100% th&agrave;nh phần nước tinh khiết của rừng Hinoki tr&ecirc;n n&uacute;i Hwangnyeongsan ở Jangseong, tỉnh Jeonnam. Nước n&agrave;y c&oacute; chứa Phytoncide l&agrave; th&agrave;nh phần c&oacute; hiệu quả l&agrave;m tươi mới, l&agrave;m sạch l&agrave;n da chăm s&oacute;c lỗ ch&acirc;n l&ocirc;ng, chăm s&oacute;c b&atilde; nhờn, cải thiện sự đ&agrave;n hồi.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng đ&atilde; mở rộng lỗ ch&acirc;n l&ocirc;ng Kh&aacute;ch h&agrave;ng c&oacute; b&atilde; nhờn qu&aacute; mức Kh&aacute;ch h&agrave;ng muốn một sản phẩm chăm s&oacute;c lỗ ch&acirc;n l&ocirc;ng s&acirc;u với gi&aacute; hợp l&yacute;.</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>D&ugrave;ng sau tinh chất, lấy 1 lượng vừa đủ thoa đều khắp mặt rồi vỗ nhẹ cho sản phẩm thẩm thấu s&acirc;u v&agrave;o b&ecirc;n trong da. Sử dụng 2 lần/ 1 ng&agrave;y</p>

<p><strong>TL</strong>:&nbsp;60 ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2067_3.jpg', N'/images/photoproduct/2016/7/sc_full_2067_3.jpg', CAST(0x0000A63900AD1325 AS DateTime), 1, N'60ml', N'', N'Hàn Quốc', 0.0000, 628000.0000, 0, 3, N'vi', 1, 1, 1, N'The-Fresh-Phytoncide-Pore-Gel-Cream', NULL, NULL, NULL, 4)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (76, N'Naturalth Goat Milk Premium Eye Cream', N'NT_CC_002', N'86', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem dưỡng mắt cao cấp cải thiện nếp nhăn + l&agrave;m trắng chứa 50% th&agrave;nh phần sữa d&ecirc; từ New Zealand gi&uacute;p tăng cường nguồn năng lượng căn bản đem lại l&agrave;n da quanh v&ugrave;ng mắt lu&ocirc;n khỏe mạnh, bảo vệ cho v&ugrave;ng da quanh mắt tr&aacute;nh những t&aacute;c động c&oacute; hại từ b&ecirc;n ngo&agrave;i, đồng thời sản phẩm tăng cường khả năng hấp thu độ ẩm, gi&uacute;p tr&aacute;nh hiện tượng kh&ocirc; quanh v&ugrave;ng mắt, duy tr&igrave; l&agrave;n da quanh mắt trắng s&aacute;ng, kh&ocirc;ng bị quầng th&acirc;m.</p>

<p>Sản phẩm đ&atilde; được thử nghiệm về độ an to&agrave;n khi d&ugrave;ng tr&ecirc;n da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Chứa 50% chiết xuất từ sữa d&ecirc; từ Newzeland, với th&agrave;nh phần dinh dưỡng tương tự như sữa mẹ đem lại l&agrave;n da khỏe mạnh từ b&ecirc;n trong. Sức mạnh của protein h&ograve;a tan từ sữa, c&oacute; khả năng loại bỏ tế b&agrave;o chết dư thừa, c&oacute; khả năng dưỡng da dịu nhẹ v&agrave; giảm thiểu mẩn đỏ. Bảo vệ tổn thương cho da, tăng cường bức tường th&agrave;nh bảo vệ da.</p>

<p>&nbsp;</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>- Da kh&ocirc;</p>

<p>- L&agrave;n da mong muốn được dưỡng ẩm v&agrave; k&eacute;o d&agrave;i độ ẩm cho da</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau khi dưỡng da, d&ugrave;ng một lượng bằng hạt ti&ecirc;u đen, chấm đều l&ecirc;n v&ugrave;ng da mắt, nhẹ nh&agrave;ng massage quanh v&ugrave;ng da mắt.</p>

<p><strong>TL</strong>: 30 ml</p>
', N'<h3>&nbsp;</h3>
', N'/images/photoproduct/2016/6/sc_small_2088_naturalth-goat-milk-premium-eye-cream.jpg', N'/images/photoproduct/2016/6/sc_full_2088_naturalth-goat-milk-premium-eye-cream.jpg', CAST(0x0000A63401149444 AS DateTime), 1, N'30ml', N'', N'Hàn Quốc', 0.0000, 1350000.0000, 0, 17, N'vi', 1, 1, 0, N'Naturalth-Goat-Milk-Premium-Eye-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (77, N' Dầu gội cân bằng đặc trị tóc dầu Alfaparf Scalp Care 250ml  ', N'NT_CC_003', N'67', N'Thành phần an toàn
Không chứa hóa chất độc hại
Hiệu quả nhanh chóng', N'<h2>Dầu gội c&acirc;n bằng đặc trị t&oacute;c dầu Alfaparf Scalp Care 250ml</h2>

<p>ALFAPARF SDL SCALP BALANCING SHAMPOO 250ML<br />
Dầu gội Scalp c&acirc;n bằng đặc trị t&oacute;c dầu<br />
C&ocirc;ng dụng: Sản phẩm gi&uacute;p loại bỏ ho&agrave;n to&agrave;n lượng dầu thừa v&agrave; b&igrave;nh thường h&oacute;a khả năng b&agrave;i tiết dầu v&agrave; giảm thiểu sự lặng đọng dầu tr&ecirc;n từng sợi t&oacute;c. Hiệu quả d&agrave;i l&acirc;u, thoải m&aacute;i với m&aacute;i t&oacute;c nhẹ t&ecirc;nh, b&oacute;ng s&aacute;ng độc đ&aacute;o.<br />
Th&agrave;nh phần:&nbsp;<br />
Hợp chất Shine Fix Complex giữ ổn định độ b&oacute;ng s&aacute;ng<br />
Hợp chất Color Fix Complex giữ ổn định v&agrave; bảo vệ m&agrave;u nhuộm<br />
Renovagenyl gi&uacute;p t&aacute;i tạo v&agrave; k&iacute;ch th&iacute;ch da đầu, điều chỉnh v&agrave; kiểm so&aacute;t lượng dầu thừa<br />
Chiết xuất c&acirc;y Buchu (một loại thực vật ở miền Nam Ch&acirc;u phi) gi&uacute;p t&aacute;i c&acirc;n bằng sự tiết dầu tr&ecirc;n da đầu v&agrave; giảm lượng dầu thừa<br />
Kh&ocirc;ng c&oacute; th&agrave;nh phần solfates, parabens, paraffins, mineral oil, allergens<br />
Hương thơm v&agrave; c&aacute;c th&agrave;nh phần chiết xuất từ thực vật , kh&ocirc;ng c&oacute; chất g&acirc;y dị ứng<br />
C&aacute;ch sử dụng: Thoa dầu gội l&ecirc;n t&oacute;c ẩm hoặc ướt. Giữ nguy&ecirc;n trong 2 đến 3 ph&uacute;t sau đ&oacute; gội sạch. C&oacute; thể lặp lại quy tr&igrave;nh nếu cần thiết. C&oacute; thể sử dụng h&agrave;ng ng&agrave;y.<br />
Ng&agrave;y SX: Được m&atilde; h&oacute;a bằng 10 k&yacute; tự chữ v&agrave; số KK Y W XX Z H PP, trong đ&oacute;: KK - ng&agrave;y sx; Y - th&aacute;ng sx (từ A đến L tương đương từ th&aacute;ng 1 đến th&aacute;ng 12); W - số cuối của năm sx.( V&iacute; dụ: 19 F 2 03 I A 00 - Ng&agrave;y SX: 19/6/2012)<br />
Hạn SD: 5 năm kể từ ng&agrave;y sản xuất</p>
', N'/images/photoproduct/2016/5/sc_small_2093_10.jpg', N'/images/photoproduct/2016/5/sc_full_2093_10.jpg', CAST(0x0000A60601749561 AS DateTime), 1, N'40ml', N'', N'Hàn Quốc', 0.0000, 279000.0000, 0, 11, N'vi', 1, 1, 0, N'Dau-goi-can-bang-dac-tri-toc-dau-Alfaparf-Scalp-Care-250ml', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (83, N'Timeless Ferment Snail Emulsion', N'nKNUaW', N'83', N'<p style="margin-left: 40px;"><strong>C&ocirc;ng dụng:</strong></p>

<p style="margin-left: 40px;">Sữa dưỡng với sự kết hợp giữa phương ph&aacute;p chắt lọc tinh chất ốc s&ecirc;n v&agrave; l&ecirc;n men với&nbsp;tr&agrave; xanh gi&uacute;p phục hồi l&agrave;n da bị tổn thương. Hiệu quả</p>

<ul>
	<li style="margin-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp;Cải thiện c&aacute;c đốm sậm m&agrave;u v&agrave; sẹo mụn</li>
	<li style="margin-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp;C&oacute; chứa th&agrave;nh phần chondroitin t&aacute;c dụng như một loại kem dưỡng ẩm</li>
	<li style="margin-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp;Hydrat v&agrave; trẻ h&oacute;a l&agrave;n da</li>
	<li style="margin-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp;Allantoin gi&uacute;p chăm s&oacute;c da dịu nhẹ, chống k&iacute;ch ứng v&agrave; loại bỏ tế b&agrave;o sừng h&oacute;a</li>
	<li style="margin-left: 40px;">&nbsp; &nbsp; &nbsp; &nbsp;Glycolate loại bỏ tế b&agrave;o chết v&agrave; l&agrave;m s&aacute;ng da , Collagen elastin tăng độ đ&agrave;n hồi &nbsp;&nbsp;&nbsp;</li>
</ul>

<p style="margin-left: 40px;">Đồng thời chứa 45% h&agrave;m lượng tinh chất bột v&agrave;ng được hấp thụ v&agrave;o da một c&aacute;ch nhanh ch&oacute;ng , gi&uacute;p giải độc cho da gi&uacute;p da khỏe mạnh, s&aacute;ng bong.</p>

<p style="margin-left: 40px;">Sản phẩm đ&atilde; được kiểm nghiệm về độ an to&agrave;n cho da với c&ocirc;ng thức 10-free&nbsp; (Synthetic Perfume, Paraben, Mineral Oil, Benzophenon-5,&nbsp; BHT, Triclosan, Triethanolamine, Surfactant, Tar color, Talc)</p>

<p style="margin-left: 40px;"><strong>Th&agrave;nh phần:</strong></p>

<ul>
	<li style="margin-left: 40px;">&nbsp; &nbsp; &nbsp; Nhớt từ loại ốc s&ecirc;n nu&ocirc;i bằng tr&agrave; xanh v&agrave;ng từ 5 ~ 6 th&aacute;ng tuổi gi&uacute;p Hydrat / trẻ h&oacute;a da, loại bỏ tế b&agrave;o chết</li>
	<li style="margin-left: 40px;">&nbsp; &nbsp; &nbsp; Tr&agrave; xanh v&agrave;ng l&ecirc;n men: chống oxi h&oacute;a, ngăn chặn c&aacute;c vấn đề của da</li>
	<li style="margin-left: 40px;">&nbsp; &nbsp; &nbsp; Bột v&agrave;ng thanh lọc, điều chỉnh tone da: t&aacute;c dụng trẻ h&oacute;a</li>
</ul>

<p style="margin-left: 40px;">Hợp chất n&agrave;y được l&ecirc;n men 2 lần trong v&ograve;ng 365 ng&agrave;y n&ecirc;n đặc biệt an to&agrave;n cho l&agrave;n da, đồng thời gi&uacute;p dưỡng chất được thẩm thấu tối ưu v&agrave;o b&ecirc;n trong da.</p>

<p style="margin-left: 40px;"><strong>Đối tượng sử dụng</strong>:</p>

<ol>
	<li style="margin-left: 80px;">&nbsp;Da bị sẹo mụn</li>
	<li style="margin-left: 80px;">&nbsp;Da kh&ocirc; v&agrave; th&ocirc; r&aacute;p</li>
	<li style="margin-left: 80px;">&nbsp;Da k&eacute;m săn chắc</li>
	<li style="margin-left: 80px;">&nbsp;Da xỉn m&agrave;u</li>
</ol>

<p style="margin-left: 40px;"><strong>Hướng dẫn sử dụng:</strong></p>

<p style="margin-left: 40px;">D&ugrave;ng 1 lượng vừa đủ thoa đều khắp mặt., sau đ&oacute; nhẹ nh&agrave;ng massage để dưỡng chất thẩm thấu v&agrave;o da. D&ugrave;ng sau Timeless Ferment Snail Essence.</p>

<p style="margin-left: 40px;"><strong>TL</strong>: 150 ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2102_timeless-ferment-snail-emulsion.jpg', N'/images/photoproduct/2016/6/sc_full_2102_timeless-ferment-snail-emulsion.jpg', CAST(0x0000A634010FE200 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 1630000.0000, 0, 21, N'vi', 1, 1, 0, N'Timeless-Ferment-Snail-Emulsion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (84, N'Aquaporin Moisture Cream', N'67gOKI', N'85', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem dưỡng ẩm dạng gel kh&ocirc;ng g&acirc;y cảm gi&aacute;c b&iacute;t tắc s&acirc;u trong da, đem lại kết th&uacute;c ẩm v&agrave; mềm mại cho da.</p>

<p>Th&agrave;nh phần Chlorella gi&uacute;p da khỏe mạnh v&agrave; tr&agrave;n đầy năng lượng. Hiệu quả giữ ẩm trong 24h, sản phẩm đ&atilde; được thử nghiệm c&oacute; khả năng hấp thu v&agrave;o da nhanh ch&oacute;ng.</p>

<p>Kem dưỡng ẩm d&agrave;nh cho da kh&ocirc; v&agrave; th&ocirc; r&aacute;p.</p>

<p>Kem dưỡng ẩm kh&ocirc;ng chỉ cung cấp độ ẩm đầy đủ cho da kh&ocirc; m&agrave; c&ograve;n tạo h&agrave;ng r&agrave;o bảo vệ da ngăn sự bay hơi nước.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Aquaporin l&agrave; một k&ecirc;nh tế b&agrave;o, trong đ&oacute; nước c&oacute; thể đi qua được gi&uacute;p th&uacute;c đẩy l&agrave;n da khỏe mạnh bằng c&aacute;ch cung cấp độ ẩm cho da th&ocirc;ng qua c&aacute;c k&ecirc;nh vận chuyển nước. Qua đ&oacute; sử dụng năng lượng từ c&aacute;c k&ecirc;nh nước:</p>

<p>- K&ecirc;nh nước từ hồ (Willow Water) gi&uacute;p l&agrave;m sạch v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh tuần ho&agrave;n.</p>

<p>- K&ecirc;nh nước từ s&ocirc;ng (Tảoxoắn Chlorella) cung cấp độ ẩm v&agrave; vitamin C.</p>

<p>- K&ecirc;nh nước từ biển (TảobiểnSpirulina) cung cấp oxy v&agrave; dưỡng chất.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm chăm s&oacute;c da tươi m&aacute;t, kh&ocirc;ng bết d&iacute;nh</p>

<p>Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm kem dưỡng ẩm dịu nhẹ, cung cấp độ ẩm vừa đủ cho l&agrave;n da kh&ocirc;.</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Lấy 1 lượng sản phẩm vừa đủ nhẹ nh&agrave;ng thoa đều l&ecirc;n da theo chiều kết cấu da , ấn &aacute;p nhẹ nh&agrave;ng bằng cả l&ograve;ng b&agrave;n tay đem lại cảm gi&aacute;c thư gi&atilde;n v&agrave; hiệu quả thẩm thấu cao khi sử dụng</p>

<p><strong>TL</strong>: 60ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2084_aquaporin-moisture-cream1.jpg', N'/images/photoproduct/2016/6/sc_full_2084_aquaporin-moisture-cream1.jpg', CAST(0x0000A6340115EB44 AS DateTime), 1, N'60ml', N'', N'Hàn Quốc', 0.0000, 636000.0000, 0, 29, N'vi', 1, 1, 0, N'Aquaporin-Moisture-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (85, N'Intense Care Snail Set', N'Pr37px', N'88', N'<p>&nbsp;</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2095_snail-set.jpg', N'/images/photoproduct/2016/6/sc_full_2095_snail-set.jpg', CAST(0x0000A63401131E59 AS DateTime), 1, N'', N'', N'Hàn Quốc', 0.0000, 3260000.0000, 0, 30, N'vi', 1, 0, 0, N'Intense-Care-Snail-Set', NULL, NULL, NULL, 3)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (87, N'Aquaporin Opening Toner', N'bpU2ym', N'82', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Nước hoa hồng thuộc d&ograve;ng&nbsp;dưỡng&nbsp;ẩm&nbsp;chuy&ecirc;n&nbsp;s&acirc;u&nbsp;d&agrave;nh cho da kh&ocirc;&nbsp;v&agrave;&nbsp;da&nbsp;dầu&nbsp;thiếu&nbsp;nước.</p>

<p>Sản phẩm dạng gel mở ra đường nước gi&uacute;p độ ẩm c&oacute; thể hấp thu với một lượng th&iacute;ch hợp v&agrave;o s&acirc;u b&ecirc;n trong da, gi&uacute;p t&aacute;i tạo bức tường ẩm tự nhi&ecirc;n của da v&agrave; loại bỏ lớp tế b&agrave;o chết, duy tr&igrave; bề mặt da mềm mịn. Th&agrave;nh phần nước liễu (willow water) gi&uacute;p hồi phục l&agrave;n da mỏi mệt v&agrave; tạo được độ c&acirc;n bằng ẩm tự nhi&ecirc;n trong da.</p>

<p><strong>Th&agrave;nh phần</strong><strong>:</strong></p>

<p>&nbsp; Aquaporin&nbsp;l&agrave;&nbsp;một&nbsp;k&ecirc;nh&nbsp;tế&nbsp;b&agrave;o,&nbsp;trong&nbsp;đ&oacute;&nbsp;nước&nbsp;c&oacute;&nbsp;thể&nbsp;điqua&nbsp;được gi&uacute;p th&uacute;c đẩy l&agrave;n da khỏe mạnh bằng c&aacute;chcung&nbsp;cấp&nbsp;độ&nbsp;ẩm&nbsp;cho&nbsp;da&nbsp;th&ocirc;ng&nbsp;qua&nbsp;c&aacute;c&nbsp;k&ecirc;nh&nbsp;vậnchuyển&nbsp;nước. Qua đ&oacute; sử dụng năng lượng từ c&aacute;c k&ecirc;nh nước:</p>

<p>- K&ecirc;nh nước từ hồ (Willow Water) gi&uacute;p l&agrave;m sạch v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh tuần ho&agrave;n.</p>

<p>- K&ecirc;nh nước từ s&ocirc;ng (Tảo&nbsp;xoắn&nbsp;Chlorella) cung cấp độ ẩm v&agrave; vitamin C.</p>

<p>- K&ecirc;nh nước từ biển (Tảo&nbsp;biển&nbsp;Spirulina) cung cấp oxy v&agrave; dưỡng chất.</p>

<p><strong>Đối tượng sử dụng</strong>:</p>

<p>&nbsp;<font face="Arial">-&nbsp;</font>Kh&aacute;ch&nbsp;h&agrave;ng&nbsp;c&oacute;&nbsp;nhu&nbsp;cầu&nbsp;t&igrave;m&nbsp;kiếm&nbsp;sản&nbsp;phẩm&nbsp;l&agrave;m&nbsp;s&aacute;ng&nbsp;v&agrave;l&agrave;m&nbsp;da&nbsp;tươi&nbsp;m&aacute;t</p>

<p>&nbsp;-&nbsp;Kh&aacute;ch&nbsp;h&agrave;ng&nbsp;da&nbsp;hỗn&nbsp;hợp&nbsp;t&igrave;m&nbsp;kiếm&nbsp;sản&nbsp;phẩm&nbsp;nước&nbsp;hoahồng&nbsp;dịu&nbsp;nhẹ,&nbsp;thanh&nbsp;khiết</p>

<p>&nbsp;-&nbsp;Kh&aacute;ch&nbsp;h&agrave;ng&nbsp;da&nbsp;kh&ocirc;&nbsp; (cung&nbsp;cấp&nbsp;độ&nbsp;ẩm&nbsp;vừa&nbsp;đủ)&nbsp;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>- C&aacute;ch 1: Cho 1 lượng vừa đủ v&agrave;o b&ocirc;ng tẩy trang, thoa đều khắp mặt rồi vỗ nhẹ để tăng độ thẩm thấu.</p>

<p>- C&aacute;ch 2: &nbsp;Bơm một lượng khoảng 2ml ra l&ograve;ng b&agrave;n tay, xoa đều v&agrave; &aacute;p l&ecirc;n bề mặt da, sau đ&oacute; xoa l&agrave;m n&oacute;ng hai l&ograve;ng b&agrave;n tay rồi &aacute;p ấn l&ecirc;n bề mặt da để gi&uacute;p sản phẩm thẩm thấu s&acirc;u hơn, giảm sự ma s&aacute;t cho l&agrave;n da.</p>

<p><strong>TL</strong>:&nbsp;150 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2070_aquaporin-opening-toner3.jpg', N'/images/photoproduct/2016/6/sc_full_2070_aquaporin-opening-toner3.jpg', CAST(0x0000A634010F1720 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 585000.0000, 0, 39, N'vi', 1, 1, 0, N'Aquaporin-Opening-Toner', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (88, N'The Chok Chok Green Tea Watery Skin', N'gSAZyA', N'82', N'<p><strong>C&ocirc;ng dụng</strong></p>

<p>Nước c&acirc;n bằng l&agrave;m sạch da chiết xuất 100% nước từ l&aacute; tr&agrave; non&nbsp;c&oacute; nguồn gốc từ Jangheung tỉnh Jeonnam,&nbsp;được l&ecirc;n men tự nhi&ecirc;n, thẩm thấu s&acirc;u, chống oxy h&oacute;a cho da, gi&uacute;p cho da thư gi&atilde;n v&agrave; tươi mới.&nbsp;Giảm k&iacute;ch ứng v&agrave; tối đa h&oacute;a dinh dưỡng th&ocirc;ng qua một qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y n&ecirc;n an to&agrave;n cho mọi loại da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>&nbsp;- Chiết xuất 100% nước l&aacute; tr&agrave; non được l&ecirc;n men tự nhi&ecirc;n.</p>

<p>&nbsp;<strong>-</strong>&nbsp;Qui tr&igrave;nh:</p>

<p>Step 1: Thu hoạch l&aacute; tr&agrave; từ v&ugrave;ng n&ocirc;ng th&ocirc;n, phơi kh&ocirc; lần 1, hấp l&ecirc;n v&agrave; gi&atilde; nhỏ, tạo th&agrave;nh vi&ecirc;n nhỏ, &nbsp;x&acirc;u v&agrave;o que, phơi lần 2.&nbsp;Sau đ&oacute;, tạo th&agrave;nh nước tr&agrave; đựng trong một hũ lớn.</p>

<p>Step 2: Nước&nbsp;tr&agrave;&nbsp;để&nbsp;360&nbsp;giờ&nbsp;chuẩn&nbsp;bị&nbsp;cho&nbsp;qu&aacute;&nbsp;tr&igrave;nh&nbsp;l&ecirc;nmen&nbsp;tự&nbsp;nhi&ecirc;n</p>

<p>Step 3:&nbsp;L&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y</p>

<p><strong>Điểm mạnh sản phẩm:&nbsp;</strong></p>

<p>- Sản&nbsp;phẩm&nbsp;chiết&nbsp;xuất&nbsp;l&ecirc;n&nbsp;men&nbsp;từ&nbsp;tr&agrave; xanh&nbsp;cung&nbsp;cấp&nbsp;độ ẩm dồi d&agrave;o&nbsp;cho&nbsp;l&agrave;n&nbsp;da.</p>

<p>Chứa 100% nước tr&agrave; xanh thu được sau khi l&ecirc;n men tự nhi&ecirc;n l&aacute; tr&agrave; xanh tươi đ&atilde; được chăm s&oacute;c tỉ mỉ quanh năm v&agrave; đ&atilde; được thu hoạch từ những v&ugrave;ng hoang sơ của v&ugrave;ng Jangheung.</p>

<p>- Qu&aacute; tr&igrave;nh l&ecirc;n men tối đa dưỡng chất v&agrave; nhanh ch&oacute;ng cung cấp độ ẩm cho da.</p>

<p>- Sản phẩm dạng gel đem lại cảm gi&aacute;c tươi m&aacute;t v&agrave; độ ẩm cho da.&nbsp;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau khi l&agrave;m sạch da, lấy một lượng vừa đủ thoa đều khắp mặt sau đ&oacute; d&ugrave;ng tay vỗ nhẹ để tăng độ thẩm thấu.</p>

<p><strong>TL</strong>: 180ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2120_the-chok-chok-green-tea-watery-skin.jpg', N'/images/photoproduct/2016/6/sc_full_2120_the-chok-chok-green-tea-watery-skin.jpg', CAST(0x0000A634010EA80F AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 547000.0000, 0, 14, N'vi', 1, 1, 0, N'The-Chok-Chok-Green-Tea-Watery-Skin', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (89, N'Aquaporin Skincare Set', N'UzjoaY', N'88', N'<p>Bộ sản phẩm d&agrave;nh cho da dầu bị kh&ocirc; v&agrave; mất nước</p>

<p><strong>Aquaporin Opening Toner</strong></p>

<p>Nước hoa hồng dạng gel mở ra đường nước gi&uacute;p độ ẩm c&oacute; thể hấp thu với một lượng th&iacute;ch hợp v&agrave;o s&acirc;u b&ecirc;n trong da. Sản phẩm gi&uacute;p t&aacute;i tạo bức tường ẩm tự nhi&ecirc;n của da v&agrave; loại bỏ lớp tế b&agrave;o chết, duy tr&igrave; bề mặt da mềm mịn. Th&agrave;nh phần nước liễu (willow water) gi&uacute;p hồi phục l&agrave;n da mỏi mệt v&agrave; tạo được độ c&acirc;n bằng ẩm tự nhi&ecirc;n trong da.</p>

<p><strong>TL</strong>: 150 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>

<p><strong>HDSD:</strong>&nbsp;Cho 1 lượng vừa đủ v&agrave;o b&ocirc;ng tẩy trang, thoa đều khắp mặt rồi vỗ nhẹ để tăng độ thẩm thấu.</p>

<p>&nbsp;</p>

<p><strong>Aquaporin Waterful Emulsion</strong></p>

<p>Sữa dưỡng da mở ra đường nước gi&uacute;p độ ẩm c&oacute; thể hấp thu với một lượng th&iacute;ch hợp v&agrave;o s&acirc;u b&ecirc;n trong da. Sản phẩm chứa Spirulina Platensis Extract gi&uacute;p duy tr&igrave; độ ẩm l&acirc;u d&agrave;i v&agrave; duy tr&igrave; l&agrave;n da kh&ocirc; v&agrave; th&ocirc; r&aacute;p.</p>

<p><strong>TL</strong>: 150 ml</p>

<p><strong>HSD</strong><em>:</em>&nbsp;3 năm sau ng&agrave;y sx</p>

<p><strong>HDSD:</strong>&nbsp;Lấy 1 lượng vừa đủ, thoa đều khắp mặt rồi vỗ nhẹ cho dưỡng chất thẩm thấu v&agrave;o da.</p>

<p>&nbsp;</p>

<p><strong>Aquaporin Moisture Cream</strong></p>

<p>Kem tạo ẩm dạng gel bổ sung độ ẩm cho l&agrave;n da hồn hợp dầu thiếu ẩm tạo cảm gi&aacute;c tươi m&aacute;t v&agrave; thư gi&atilde;n cho l&agrave;n da. Sản phẩm chuyển th&agrave;nh dạng nước trong suốt v&agrave; tinh khiết cung cấp độẩm lớn v&agrave; l&acirc;u bền cho da.</p>

<p><strong>HDSD</strong>: lấy 1 lượng vừa đủ thoa đều khắp mặt, nhẹ nh&agrave;ng massage cho dưỡng chất thẩm thấu v&agrave;o da.</p>

<p><strong>TL<em>:</em></strong>&nbsp;50 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p><strong>Thứ tự sử dụng</strong>: Aquaporin Opening Toner - Aquaporin Waterful Emulsion- Aquaporin Moisture Cream</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2100_aquaporin-skincare-set.jpg', N'/images/photoproduct/2016/6/sc_full_2100_aquaporin-skincare-set.jpg', CAST(0x0000A634011335C0 AS DateTime), 1, N'350ml', N'', N'Hàn Quốc', 0.0000, 1700000.0000, 0, 31, N'vi', 1, 1, 0, N'Aquaporin-Skincare-Set', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (90, N'Magic Food Mango Mild Sun Block', N'25NgLE', N'89', N'<p>Kem chống nắng chiết xuất từ tr&aacute;i xo&agrave;i c&ugrave;ng một số tr&aacute;i c&acirc;y kh&aacute;c như chuối, chanh, cam...gi&uacute;p da kh&ocirc;ng bị kh&ocirc;, s&aacute;ng mịn suốt cả ng&agrave;y. Th&iacute;ch hợp cho mọi loại da.</p>

<p><strong>HDSD</strong>: Sau bước chăm s&oacute;c da cơ bản, d&ugrave;ng một lượng th&iacute;ch hợp thoa l&ecirc;n v&ugrave;ng da tiếp x&uacute;c thường xuy&ecirc;n với &aacute;nh nắng mặt trời; tẩy trang lại v&agrave;o cuối ng&agrave;y</p>

<p><strong>TL</strong>: 45 g</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sản xuất</p>

<p>Bảo quản nơi kh&ocirc; tho&aacute;ng</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2064_2.jpg', N'/images/photoproduct/2016/7/sc_full_2064_2.jpg', CAST(0x0000A63900AC4394 AS DateTime), 1, N'45g', N'', N'Hàn Quốc', 0.0000, 435000.0000, 0, 14, N'vi', 1, 1, 0, N'Magic-Food-Mango-Mild-Sun-Block', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (91, N'Aquaporin Waterful Emulsion', N'WX6xe4', N'83', N'<p align="left"><strong>C&ocirc;ng dụng:</strong></p>

<p>Sữa dưỡng thuộc d&ograve;ng&nbsp;dưỡng&nbsp;ẩm&nbsp;chuy&ecirc;n s&acirc;u&nbsp;d&agrave;nh cho da kh&ocirc;&nbsp;v&agrave;&nbsp;da&nbsp;dầu&nbsp;thiếu&nbsp;nước.</p>

<p>Sản phẩm c&oacute; khả năng giữ ẩm chuy&ecirc;n s&acirc;u v&agrave; gi&uacute;p da hấp thụ nhanh ch&oacute;ng, tạo độ kết d&iacute;nh mềm mại cho da, giữ ẩm cho da qua c&aacute;c k&ecirc;nh nước gi&uacute;p l&agrave;n da kh&ocirc;, th&ocirc; r&aacute;p trở l&ecirc;n mềm mại hơn.</p>

<p>Đ&atilde; được kiểm nghiệm an to&agrave;n cho da với c&ocirc;ng thức 4 Free: Paraben, Talc, triclosan, sulfate surfactant flow.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>&nbsp; Aquaporin&nbsp;l&agrave;&nbsp;một&nbsp;k&ecirc;nh&nbsp;tế&nbsp;b&agrave;o,&nbsp;trong&nbsp;đ&oacute;&nbsp;nước&nbsp;c&oacute; thể&nbsp;đi&nbsp;qua&nbsp;được gi&uacute;p th&uacute;c đẩy l&agrave;n da khỏe mạnh bằng c&aacute;ch&nbsp;cung&nbsp;cấp&nbsp;độ&nbsp;ẩm&nbsp;cho&nbsp;da&nbsp;th&ocirc;ng&nbsp;qua c&aacute;c&nbsp;k&ecirc;nh&nbsp;vận&nbsp;chuyển&nbsp;nước. Qua đ&oacute; sử dụng năng lượng từ c&aacute;c k&ecirc;nh nước:</p>

<p>- K&ecirc;nh nước từ hồ (Willow Water) gi&uacute;p l&agrave;m sạch v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh tuần ho&agrave;n.</p>

<p>- K&ecirc;nh nước từ s&ocirc;ng (Tảo&nbsp;xoắn&nbsp;Chlorella) cung cấp độ ẩm v&agrave; vitamin C.</p>

<p>- K&ecirc;nh nước từ biển (Tảo&nbsp;biển&nbsp;Spirulina) cung cấp oxy v&agrave; dưỡng chất.</p>

<p><strong>Đối tượng sử dụng</strong>:</p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm chăm s&oacute;c da tươi m&aacute;t, kh&ocirc;ng bết d&iacute;nh</p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm kem dưỡng ẩm dịu nhẹ , cung cấp độ ẩm vừa đủ cho l&agrave;n da kh&ocirc;</p>

<p align="left"><strong>Hướng dẫn sử dụng:</strong></p>

<p>Ngay sau khi sử dụng tinh chất, lấy một lượng vừa đủ thoa đều theo kết cấu da vỗ nhẹ để tăng độ thẩm thấu. D&ugrave;ng 2 lần/ ng&agrave;y, s&aacute;ng v&agrave; tối..</p>

<p align="left"><strong>TL</strong>: 150 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2104_aquaporin-waterful-emulsion2.jpg', N'/images/photoproduct/2016/6/sc_full_2104_aquaporin-waterful-emulsion2.jpg', CAST(0x0000A634011021AE AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 585000.0000, 0, 32, N'vi', 1, 1, 0, N'Aquaporin-Waterful-Emulsion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (92, N'Timeless Ferment Snail Sun Cream', N'qGfFQz', N'89', N'<p>Kem chống nắng l&agrave;m trắng &amp; ngăn ngừa nếp nhăn &amp; chống tia tử ngoại, h&agrave;m chứa 45% chiết xuất nhớt ốc s&ecirc;n l&ecirc;n men bảo vệ da khỏi t&aacute;c động c&oacute; hại của tia tử ngoại, đồng thời bổ sung độ ẩm m&agrave; kh&ocirc;ng g&acirc;y cảm gi&aacute;c bết d&iacute;nh</p>

<p><strong>HDSD</strong>: Sau khi sử dụng đầy đủ c&aacute;c sản phẩm Skincare, lấy 1 lượng vừa đủ thoa đều khắp mặt rồi vỗ nhẹ. Sau đ&oacute; thoa v&agrave;o cố, tay, ch&acirc;n v&agrave; những v&ugrave;ng da tiếp x&uacute;c với tia tử ngoại (nếu ra ngo&agrave;i trong thời gian d&agrave;i, n&ecirc;n thoa nhiều hơn để tăng cường khả năng bảo vệ)</p>

<p><strong>TL</strong>: 50ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Lưu &yacute;: Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2115_timeless-ferment-snail-suncream2--.jpg', N'/images/photoproduct/2016/6/sc_full_2115_timeless-ferment-snail-suncream2--.jpg', CAST(0x0000A6340112B127 AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 719000.0000, 0, 34, N'vi', 1, 1, 1, N'Timeless-Ferment-Snail-Sun-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (93, N'Aquaporin Rich Cream', N'Jd0cAQ', N'85', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem gi&agrave;u độ ẩm bổ sung dưỡng chất cho da bằng việc bao phủ l&ecirc;n bề mặt da. Th&ocirc;ng qua việc cung cấp lượng độ ẩm lớn, gi&uacute;p cấu tr&uacute;c da lu&ocirc;n mềm mướt v&agrave; khỏe mạnh trong thời gian d&agrave;i.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Aquaporin l&agrave; một k&ecirc;nh tế b&agrave;o, trong đ&oacute; nước c&oacute; thể đi qua được gi&uacute;p th&uacute;c đẩy l&agrave;n da khỏe mạnh bằng c&aacute;ch cung cấp độ ẩm cho da th&ocirc;ng qua c&aacute;c k&ecirc;nh vận chuyển nước. Qua đ&oacute; sử dụng năng lượng từ c&aacute;c k&ecirc;nh nước:</p>

<p>- K&ecirc;nh nước từ hồ (Willow Water) gi&uacute;p l&agrave;m sạch v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh tuần ho&agrave;n.</p>

<p>- K&ecirc;nh nước từ s&ocirc;ng (Tảo xoắn Chlorella) cung cấp độ ẩm v&agrave; vitamin C.</p>

<p>- K&ecirc;nh nước từ biển (Tảo biển Spirulina) cung cấp oxy v&agrave; dưỡng chất.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>- Kh&aacute;ch h&agrave;ng c&oacute; nhu cầu t&igrave;m kiếm sản phẩm l&agrave;m s&aacute;ng v&agrave; l&agrave;m da tươi m&aacute;t</p>

<p>- Kh&aacute;ch h&agrave;ng da hỗn hợp t&igrave;m kiếm sản phẩm nước hoa hồng dịu nhẹ, thanh khiết</p>

<p>- Kh&aacute;ch h&agrave;ng da kh&ocirc; (cung cấp độ ẩm vừa đủ)</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Thoa tr&ecirc;n mặt theo chiều cấu tr&uacute;c của da, v&agrave; nhẹ nh&agrave;ng &aacute;p b&agrave;n tay ấm để th&uacute;c đẩy sự hấp thụ v&agrave;o da.</p>

<p><strong>TL</strong>:50ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2107_aquaporin-rich-cream.jpg', N'/images/photoproduct/2016/6/sc_full_2107_aquaporin-rich-cream.jpg', CAST(0x0000A6340117B19A AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 756000.0000, 0, 33, N'vi', 1, 1, 1, N'Aquaporin-Rich-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (94, N'Naturalth Goat Milk Premium Cream', N'ky1iTd', N'85', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem dưỡng da cao cấp cải thiện nếp nhăn, gi&uacute;p da trắng sang. Chứa 60% th&agrave;nh phần sữa d&ecirc; từ New Zealand gi&uacute;p chăm s&oacute;c tổng thể, tăng cường nguồn năng lượng căn bản gi&uacute;p l&agrave;n da lu&ocirc;n khỏe mạnh, bảo vệ cho da tr&aacute;nh những t&aacute;c động c&oacute; hại từ b&ecirc;n ngo&agrave;i, đồng thời sản phẩm tăng cường khả năng hấp thu độ ẩm v&agrave; đ&atilde; được thử nghiệm về độ an to&agrave;n khi d&ugrave;ng tr&ecirc;n da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Chứa 60% chiết xuất từ sữa d&ecirc; - sữa d&ecirc; n&uacute;i tinh khiết từ v&ugrave;ng đồng cỏ nguy&ecirc;n sơ v&ugrave;ng Newzealand: hỗ trợ chăm s&oacute;c da, bổ sung dưỡng chất v&agrave; độ ẩm s&acirc;u b&ecirc;n trong da, ngăn chặn hiện tượng da kh&ocirc; v&agrave; thiếu ẩm.</p>

<p>Ceramide, Hyaluronic Acid, Lecithin: Tăng cường sức đề kh&aacute;ng cho l&agrave;n da: hỗ trợ duy tr&igrave; l&agrave;n da khỏe &ndash; l&agrave;n da c&oacute; khả năng chịu được t&aacute;c động từ m&ocirc;i trường b&ecirc;n ngo&agrave;i. Cấu tr&uacute;c kem với những hạt l&agrave;m trắng mềm mại gi&uacute;p tăng cường độ ẩm, dưỡng chất v&agrave; khả năng hoạt h&oacute;a cho l&agrave;n da.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Bất kỳ kh&aacute;ch h&agrave;ng n&agrave;o t&igrave;m kiếm sản phẩm sản phẩm dưỡng da cung cấp độ ẩm tốt, c&oacute; khả năng bảo vệ da tr&aacute;nh khỏi những t&aacute;c động c&oacute; hại từ m&ocirc;i trường.</p>

<p>Bất kỳ kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm dưỡng trắng &ndash; c&acirc;n bằng sắc tố cho da.</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Lấy 1 lượng sản phẩm vừa đủ nhẹ nh&agrave;ng thoa đều l&ecirc;n da theo chiều kết cấu da , ấn &aacute;p nhẹ nh&agrave;ng bằng cả l&ograve;ng b&agrave;n tay đem lại cảm gi&aacute;c thư gi&atilde;n v&agrave; hiệu quả thẩm thấu cao khi sử dụng.</p>

<p><strong>TL</strong>: 60ml</p>
', N'<p style="margin-left: 40px;"><img alt="" src="/images/images/goatmilk_premiumcream(1).jpg" style="width: 800px; height: 6740px;" /></p>
', N'/images/photoproduct/2016/6/sc_small_2109_naturalth-goat-milk-premium-cream1.jpg', N'/images/photoproduct/2016/6/sc_full_2109_naturalth-goat-milk-premium-cream1.jpg', CAST(0x0000A63401253C14 AS DateTime), 1, N'60ml', N'', N'Hàn Quốc', 0.0000, 1125000.0000, 0, 24, N'vi', 1, 1, 1, N'Naturalth-Goat-Milk-Premium-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (95, N'Naturalth Goat Milk Aqua Whitening Cream', N'w6jbRx', N'85', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem dưỡng da gi&uacute;p da trắng s&aacute;ng tức th&igrave;. Với hiệu ứng chuyển đổi kết cấu như những giọt sữa gi&uacute;p hấp thụ nhanh ch&oacute;ng v&agrave;o da v&agrave; gi&uacute;p c&acirc;n bằng sắc tố da. Kết cấu độc đ&aacute;o tương tự như kem đ&ocirc;ng lạnh đem lại cảm gi&aacute;c v&ocirc; c&ugrave;ng thư gi&atilde;n cho da. Kết cấu dạng giọt nước gi&uacute;p cung cấp ẩm ngay lập tức đối với những l&agrave;n da mất nước bởi sự lan tỏa tức th&igrave; tr&ecirc;n da ngay sau khi b&ocirc;i sản phẩm. Đem lại l&agrave;n da trắng s&aacute;ng như sữa.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Chứa 50% chiết xuất từ sữa d&ecirc;. Sữa d&ecirc; n&uacute;i tinh khiết từ thi&ecirc;n nhi&ecirc;n, với th&agrave;nh phần dinh dưỡng tương tự như sữa mẹ đem lại l&agrave;n da khỏe mạnh từ b&ecirc;n trong. Sức mạnh của protein h&ograve;a tan từ sữa, c&oacute; khả năng loại bỏ tế b&agrave;o chết dư thừa, c&oacute; khả năng dưỡng da dịu nhẹ v&agrave; giảm thiểu mẩn đỏ.</p>

<p>Ngo&agrave;i ra c&ograve;n c&ograve;n c&oacute; th&agrave;nh phần: Ceramide/ Lecithin /Vitamin thiết yếu (B3/C/E)</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Bất kỳ kh&aacute;ch h&agrave;ng n&agrave;o t&igrave;m kiếm sản phẩm sản phẩm dưỡng da cung cấp độ ẩm tốt với cảm gi&aacute;c m&aacute;t lạnh v&agrave; khả năng hấp thụ tốt cho l&agrave;n da .</p>

<p>Bất kỳ kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm dưỡng trắng &ndash; c&acirc;n bằng sắc tố cho da</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Tại bước cuối c&ugrave;ng của việc chăm s&oacute;c da, lấy 1 lượng sản phẩm vừa đủ nhẹ nh&agrave;ng thoa đều l&ecirc;n da theo chiều kết cấu da , ấn &aacute;p nhẹ nh&agrave;ng bằng cả l&ograve;ng b&agrave;n tay đem lại cảm gi&aacute;c thư gi&atilde;n v&agrave; hiệu quả thẩm thấu cao khi sử dụng.</p>

<p><strong>TL</strong>: 60ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2072_naturalth-goat-milk-aqua-whitening-cream.jpg', N'/images/photoproduct/2016/6/sc_full_2072_naturalth-goat-milk-aqua-whitening-cream.jpg', CAST(0x0000A6340115D5A6 AS DateTime), 1, N'60ml', N'', N'Hàn Quốc', 0.0000, 1080000.0000, 0, 25, N'vi', 1, 1, 0, N'Naturalth-Goat-Milk-Aqua-Whitening-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (96, N'The Chok Chok Green Tea Watery Cream', N'wTKPrp', N'85', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Kem dưỡng chiết xuất tr&agrave; xanh 100% nguy&ecirc;n chất, thu được sau một qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y gi&uacute;p l&agrave;n da trở n&ecirc;n đầy đủ độ ẩm v&agrave; dưỡng chất. Giảm k&iacute;ch ứng v&agrave; tối đa h&oacute;a dinh dưỡng th&ocirc;ng qua một qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y.</p>

<p>Sản phẩm dạng gel hấp thụ v&agrave;o da dạng dựa tr&ecirc;n việc cung cấp độ ẩm l&agrave;m mới cho da v&igrave; n&oacute; hấp thụ nhanh m&agrave; kh&ocirc;ng để lại bất kỳ dư lượng d&iacute;nh r&iacute;t.</p>

<p>An to&agrave;n cho mọi loại da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>- Chiết xuất 100% nước l&aacute; tr&agrave; non được l&ecirc;n men tự nhi&ecirc;n (tr&agrave; xanh c&oacute; nguồn gốc từ Jangheung ở tỉnh Jeonnam)</p>

<p>- Qui tr&igrave;nh:</p>

<p>Step 1: Thu hoạch l&aacute; tr&agrave; từ v&ugrave;ng n&ocirc;ng th&ocirc;n, phơi kh&ocirc; lần 1, hấp l&ecirc;n v&agrave; gi&atilde; nhỏ, tạo th&agrave;nh vi&ecirc;n nhỏ, x&acirc;u v&agrave;o que, phơi lần 2. Sau đ&oacute;, tạo th&agrave;nh nước tr&agrave; đựng trong một hũ lớn.</p>

<p>Step 2: Nước tr&agrave; để 360giờ chuẩn bị cho qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n</p>

<p>Step 3: L&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y</p>

<p><strong>Điểm mạnh sản phẩm:</strong></p>

<p>- Sản phẩm chiết xuất l&ecirc;n men từ tr&agrave; xanh cung cấp độ ẩm dồi d&agrave;o cho l&agrave;n da. Chứa 100% nước tr&agrave; xanh thu được sau khi l&ecirc;n men tự nhi&ecirc;n l&aacute; tr&agrave; xanh tươi đ&atilde; được chăm s&oacute;c tỉ mỉ quanh năm v&agrave; đ&atilde; được thu hoạch từ những v&ugrave;ng hoang sơ của v&ugrave;ng Jangheung. - Qu&aacute; tr&igrave;nh l&ecirc;n men tối đa dưỡng chất v&agrave; nhanh ch&oacute;ng cung cấp độ ẩm cho da.</p>

<p>- Sản phẩm dạng gel đem lại cảm gi&aacute;c tươi m&aacute;t v&agrave; độ ẩm cho da.</p>

<p>&nbsp;</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng muốn nhanh ch&oacute;ng cung cấp độ ẩm cho l&agrave;n da kh&ocirc;</p>

<p>Kh&aacute;ch h&agrave;ng muốn kh&aacute;ch h&agrave;ng l&agrave;m ẩm l&agrave;m mới l&agrave;n da</p>

<p>Những người muốn một d&ograve;ng ẩm chăm s&oacute;c da với gi&aacute; hợp l&yacute;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Thoa tr&ecirc;n mặt theo chiều cấu tr&uacute;c của da, v&agrave; nhẹ nh&agrave;ng &aacute;p b&agrave;n tay ấm để th&uacute;c đẩy sự hấp thụ v&agrave;o da.</p>

<p><strong>TL</strong>: 50ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2066_5.jpg', N'/images/photoproduct/2016/7/sc_full_2066_5.jpg', CAST(0x0000A63900ACCBC3 AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 628000.0000, 0, 11, N'vi', 1, 1, 0, N'The-Chok-Chok-Green-Tea-Watery-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (97, N'The Chok Chok Green Tea Watery Mist 150ml', N'Q3nziG', N'87', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Xịt kho&aacute;ng dạng phun sương với những hạt ph&acirc;n tử cực nhỏ gi&uacute;p bổ sung độ ẩm tức th&igrave; cho l&agrave;n da kh&ocirc; v&agrave; thiếu nước. Chứa 100% chiết xuất nước tr&agrave; xanh tinh khiết, l&ecirc;n men tự nhi&ecirc;n để l&agrave;n da hấp thụ tối ưu năng lượng được cung cấp từ tr&agrave; xanh. Kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&iacute;nh r&iacute;t, an to&agrave;n cho mọi loại da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>- Chiết xuất 100% nước l&aacute; tr&agrave; non được l&ecirc;n men tự nhi&ecirc;n.</p>

<p>- Qui tr&igrave;nh:</p>

<p>Step 1: Thu hoạch l&aacute; tr&agrave; từ v&ugrave;ng n&ocirc;ng th&ocirc;n, phơi kh&ocirc; lần 1, hấp l&ecirc;n v&agrave; gi&atilde; nhỏ, tạo th&agrave;nh vi&ecirc;n nhỏ, x&acirc;u v&agrave;o que, phơi lần 2.Sau đ&oacute;, tạo th&agrave;nh nước tr&agrave; đựng trong một hũ lớn.</p>

<p>Step 2: Nước tr&agrave; để 360 giờ chuẩn bị cho qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n</p>

<p>Step 3: L&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng muốn nhanh ch&oacute;ng cung cấp độ ẩm cho l&agrave;n da thiếu nước</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Đặt sản phẩm ở khoảng c&aacute;ch 20-30 cm, xịt một lượng vừa đủ rồi vỗ nhẹ để sản phẩm thẩm thấu. Sử dụng trước hoặc sau khi trang điểm, trước hoặc sau khi chơi thể thao hoặc khi cảm thấy da bị kh&ocirc;.</p>

<p><strong>TL</strong>: 150 ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2072_the-chok-chok-green-tea-watery-mist-150ml.jpg', N'/images/photoproduct/2016/6/sc_full_2072_the-chok-chok-green-tea-watery-mist-150ml.jpg', CAST(0x0000A63401138A40 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 516000.0000, 0, 2, N'vi', 1, 1, 1, N'The-Chok-Chok-Green-Tea-Watery-Mist-150ml', NULL, NULL, NULL, 4)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (98, N'The Hayan Cherry Blossom Whitening Lotion', N'Esgy96', N'83', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Sữa dưỡng chứa th&agrave;nh phần từ&nbsp;anh đ&agrave;o tinh khiết đảo Jeju&nbsp;- gi&agrave;u vitamin v&agrave; cung cấp hiệu quả l&agrave;m trắng tuyệt vời.</p>

<p>Nước hoa Anh đ&agrave;o c&oacute; m&agrave;u hồng nhạt hấp thụ nhanh ch&oacute;ng v&agrave;o da, đem lại vẻ sảng kho&aacute;i cho l&agrave;n da v&agrave; kh&ocirc;ng d&iacute;nh r&iacute;t.&nbsp;Sữa đưỡng được hấp thụ nhanh ch&oacute;ng v&agrave;o da, l&agrave;n da nhanh ch&oacute;ng tỉnh t&aacute;o v&agrave; hồi sinh. Sản phẩm c&oacute; khả năng&nbsp;l&agrave;m s&aacute;ng v&agrave; hồi sinh l&agrave;n da xỉn&nbsp;v&agrave; đ&atilde; được b&aacute;c sĩ da liễu thử nghiệm&nbsp;về độ an to&agrave;n cho l&agrave;n da.Đặc biệt kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&iacute;nh r&iacute;t.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Th&agrave;nh&nbsp;phần 100%&nbsp;tự&nbsp;nhi&ecirc;n&nbsp;của&nbsp;hoa&nbsp;l&agrave;&nbsp;vua&nbsp;của&nbsp;lo&agrave;i&nbsp;hoa Anh&nbsp;đ&agrave;o&nbsp;từ Mt. Hallasan ở v&ugrave;ng ven hoang sơ của đảo Jeju l&agrave;m cho l&agrave;n da xỉn tr&ocirc;ng s&aacute;ng hơn v&agrave; đầy sức sống.<strong>&nbsp;</strong>Ngo&agrave;i ra, th&agrave;nh phần đ&atilde; nhận được&nbsp;chứng&nbsp;nhậnxanh EWG, bảo đảm an to&agrave;n tr&ecirc;n da.&nbsp;Với&nbsp;d&ograve;ng&nbsp;sản&nbsp;phẩml&agrave;m s&aacute;ng v&agrave; hồi sinh l&agrave;n da&nbsp;tối&nbsp;xỉn với một mức gi&aacute; hợp l&yacute;.&nbsp;</p>

<p><strong>Điểm mạnh sản phẩm:</strong></p>

<p>&nbsp;Cherry Blossom Whitening l&agrave;m s&aacute;ng v&agrave; hồi sinh l&agrave;n da xỉn&nbsp;m&agrave;u&nbsp;với&nbsp;năng&nbsp;lượng&nbsp;của hoa anh đ&agrave;o.&nbsp;</p>

<p>&nbsp;C&aacute;c th&agrave;nh phần của hoa anh đ&agrave;o&nbsp;được&nbsp;chiết&nbsp;xuất&nbsp;từ Mt. Hallasan ở Jeju - l&agrave; một m&ocirc;i trường sống tự nhi&ecirc;n của&nbsp;vua&nbsp;lo&agrave;i&nbsp;hoa&nbsp;Anh&nbsp;đ&agrave;o gi&uacute;p&nbsp;l&agrave;m s&aacute;ng v&agrave;&nbsp;hồi&nbsp;sinh&nbsp;da xỉn&nbsp;m&agrave;u&nbsp;v&agrave; bị mụn. Ngo&agrave;i ra, tất cả c&aacute;c th&agrave;nh phần đ&atilde; nhận được&nbsp;chứng&nbsp;nhận&nbsp;xanh EWG, bảo đảm an to&agrave;n tr&ecirc;n da.&nbsp;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau&nbsp;khi&nbsp;d&ugrave;ng tinh chất,&nbsp;d&ugrave;ng&nbsp;một&nbsp;lượng&nbsp;vừa&nbsp;đủ&nbsp;&aacute;p&nbsp;l&ecirc;ngương&nbsp;mặt&nbsp;v&agrave;&nbsp;thoa&nbsp;theo&nbsp;chiều&nbsp;cấu&nbsp;tr&uacute;c&nbsp;da.</p>

<p><strong>Dung lượng</strong>:&nbsp;160 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2092_the-hayan-cherry-blossom-whitening-lotion.jpg', N'/images/photoproduct/2016/6/sc_full_2092_the-hayan-cherry-blossom-whitening-lotion.jpg', CAST(0x0000A634010FA4F0 AS DateTime), 1, N'160ml', N'', N'Hàn Quốc', 0.0000, 547000.0000, 0, 8, N'vi', 1, 1, 1, N'The-Hayan-Cherry-Blossom-Whitening-Lotion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (99, N'Aquaporin Moisture Mist 150ml', N'LMSKc8', N'87', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Xịt kho&aacute;ng bổ sung độ ẩm, cấu tạo dưới dạng phun sương gi&uacute;p dưỡng chất thấm s&acirc;u b&ecirc;n trong, cải thiện cho l&agrave;n da thiếu nước, gi&uacute;p da mướt mềm, tươi tắn.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Aquaporin l&agrave; một k&ecirc;nh tế b&agrave;o, trong đ&oacute; nước c&oacute; thể đi qua được gi&uacute;p th&uacute;c đẩy l&agrave;n da khỏe mạnh bằng c&aacute;ch cung cấp độ ẩm cho da th&ocirc;ng qua c&aacute;c k&ecirc;nh vận chuyển nước. Qua đ&oacute; sử dụng năng lượng từ c&aacute;c k&ecirc;nh nước:</p>

<p>- K&ecirc;nh nước từ hồ (Willow Water) gi&uacute;p l&agrave;m sạch v&agrave; th&uacute;c đẩy qu&aacute; tr&igrave;nh tuần ho&agrave;n.</p>

<p>- K&ecirc;nh nước từ s&ocirc;ng (Tảoxoắn Chlorella) cung cấp độ ẩm v&agrave; vitamin C.</p>

<p>- K&ecirc;nh nước từ biển (TảobiểnSpirulina) cung cấp oxy v&agrave; dưỡng chất.</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng muốn sản phẩm kh&ocirc;ng bết d&iacute;nh, kh&ocirc;ng trọng lượng</p>

<p>Kh&aacute;ch h&agrave;ng muốn t&igrave;m kiếm 1 sản phẩm dưỡng ẩm dịu</p>

<p>Kh&aacute;ch h&agrave;ng da dầu kh&ocirc; ( thiếu ẩm )</p>

<p>Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm dưỡng sau khi make up</p>

<p>Kh&aacute;ch h&agrave;ng t&igrave;m kiếm sản phẩm phun sương si&ecirc;u mịn</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Đặt sản phẩm ở khoảng c&aacute;ch 20-30 cm, sau khi xịt được 30 gi&acirc;y, vỗ nhẹ để sản phẩm thẩm thấu.Sử dụng trước hoặc sau khi trang điểm, trước hoặc sau khi chơi thể thao, xịt khi cảm thấy da bị kh&ocirc;.</p>

<p><strong>TL</strong>: 150 ml</p>
', N'<h2>&nbsp;</h2>
', N'/images/photoproduct/2016/6/sc_small_2096_aquaporin-moisture-mist-150ml.jpg', N'/images/photoproduct/2016/6/sc_full_2096_aquaporin-moisture-mist-150ml.jpg', CAST(0x0000A6340113A5CD AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 568000.0000, 0, 10, N'vi', 1, 1, 1, N'Aquaporin-Moisture-Mist-150ml', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (100, N'Dầu gội siêu mượt Nashi Pure Keratine Shampoo 500ml', N'scqHG1', N'67', N'Sản xuất tại Italia
Thành phần an toàn
Không gây kích ứng da', N'<p>Th&ocirc;ng tin sản phẩm:<br />
Hợp chất Cashmere BioLiss trong dầu xả hoạt động qua sự kết tinh của Keratin để bổ sung th&ecirc;m sức sống, độ đ&agrave;n hồi v&agrave; định h&igrave;nh t&oacute;c<br />
C&ocirc;ng dụng:<br />
Với t&aacute;c động l&agrave;m sạch kỹ cho t&oacute;c v&agrave; da đầu, 80% keratin c&oacute; trong dầu gội thẩm thấu s&acirc;u v&agrave;o gốc t&oacute;c để tạo độ mềm, độ b&oacute;ng v&agrave; độ mượt m&agrave; cho t&oacute;c đồng thời gi&uacute;p bảo vệ t&oacute;c hư tổn trước tia UV, tia tử ngoại v&agrave; c&aacute;c chất &ocirc; nhiễm từ m&ocirc;i trường b&ecirc;n ngo&agrave;i.</p>
', N'/images/photoproduct/2016/5/sc_small_2101_43.jpg', N'/images/photoproduct/2016/5/sc_full_2101_43.jpg', CAST(0x0000A6070179E525 AS DateTime), 1, N'40ml', N'', N'Hàn Quốc', 0.0000, 559000.0000, 0, 4, N'vi', 1, 1, 0, N'Dau-goi-sieu-muot-Nashi-Pure-Keratine-Shampoo-500ml', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (101, N'The Chok Chok Green Tea Watery Lotion', N'4YXZCb', N'83', N'<p align="left"><strong>C&ocirc;ng dụng</strong></p>

<p align="left">Sữa dưỡng chiết xuất 100% nước từ l&aacute; tr&agrave; non được l&ecirc;n men tự nhi&ecirc;n, cung cấp độ ẩm, chống oxy h&oacute;a cho da duy tr&igrave; l&agrave;n da mềm mại, khỏe khoắn.</p>

<p align="left">Chứa nước Tr&agrave; xanh 100% nguy&ecirc;n chất thu được sau một qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y&nbsp;l&agrave;n&nbsp;da trở n&ecirc;n đầy đủ độ ẩm&nbsp;v&agrave; dưỡng chất. Hiệu quả dưỡng ẩm phong ph&uacute;&nbsp;với&nbsp;100% nước tr&agrave; xanh&nbsp;l&ecirc;n men&nbsp;c&oacute; nguồn gốc từ Jangheung ở tỉnh Jeonnam.</p>

<p align="left">Giảm k&iacute;ch ứng v&agrave; tối đa h&oacute;a dinh dưỡng th&ocirc;ng qua một qu&aacute; tr&igrave;nh l&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y</p>

<p align="left">Hấp thụ v&agrave;o da&nbsp; dạng Gel dựa tr&ecirc;n việc cung cấp độ ẩm l&agrave;m mới cho da v&igrave; n&oacute; hấp thụ nhanh m&agrave; kh&ocirc;ng để lại bất kỳ dư lượng d&iacute;nh r&iacute;t</p>

<p align="left">C&aacute;c lotion gel b&aacute;n trong suốt bọc lấy da với đầy đủ độ ẩm</p>

<p align="left">Đ&atilde; được b&aacute;c sĩ da liễu thử nghiệm về độ an to&agrave;n.</p>

<p align="left"><strong>Th&agrave;nh phần:</strong></p>

<p>&nbsp;- Chiết xuất 100% nước l&aacute; tr&agrave; non được l&ecirc;n men tự nhi&ecirc;n.</p>

<p>&nbsp;<strong>-</strong>&nbsp;Qui tr&igrave;nh<strong>:</strong></p>

<p>Step 1: Thu hoạch l&aacute; tr&agrave; từ v&ugrave;ng n&ocirc;ng th&ocirc;n, phơi kh&ocirc; lần 1, hấp l&ecirc;n v&agrave; gi&atilde; nhỏ, tạo th&agrave;nh vi&ecirc;n nhỏ, &nbsp;x&acirc;u v&agrave;o que, phơi lần 2.&nbsp;Sau đ&oacute;, tạo th&agrave;nh nước tr&agrave; đựng trong một hũ lớn.</p>

<p>Step 2: Nước&nbsp;tr&agrave;&nbsp;để&nbsp;360giờ&nbsp;chuẩn&nbsp;bị&nbsp;cho&nbsp;qu&aacute;&nbsp;tr&igrave;nh&nbsp;l&ecirc;n&nbsp;men&nbsp;tự&nbsp;nhi&ecirc;n</p>

<p>Step 3:&nbsp;L&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y</p>

<p align="left"><strong>Hướng dẫn sử dụng:</strong></p>

<p align="left">Ngay sau khi sử dụng tinh chất, lấy một lượng vừa đủ thoa đều theo kết cấu da vỗ nhẹ để tăng độ thẩm thấu. D&ugrave;ng 2 lần/ ng&agrave;y, s&aacute;ng v&agrave; tối.</p>

<p align="left"><strong>Đối tượng sử dụng:</strong></p>

<ul type="square">
	<li>Kh&aacute;ch h&agrave;ng muốn nhanh ch&oacute;ng cung cấp độ ẩm&nbsp;cho l&agrave;n da kh&ocirc;</li>
	<li>kh&aacute;ch h&agrave;ng muốn kh&aacute;ch h&agrave;ng l&agrave;m ẩm l&agrave;m mới&nbsp;l&agrave;n da</li>
	<li>những người muốn một d&ograve;ng ẩm chăm s&oacute;c da với gi&aacute; hợp l&yacute;</li>
</ul>

<p align="left"><strong>TL:&nbsp;</strong>160ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2110_the-chok-chok-green-tea-watery-lotion.jpg', N'/images/photoproduct/2016/6/sc_full_2110_the-chok-chok-green-tea-watery-lotion.jpg', CAST(0x0000A634010FCB12 AS DateTime), 1, N'160ml', N'', N'Hàn Quốc', 0.0000, 547000.0000, 0, 13, N'vi', 1, 1, 0, N'The-Chok-Chok-Green-Tea-Watery-Lotion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (102, N'Tony Lab AC Control Whitening After Spot', N'UDs5N5', N'84', N'<p><strong>Nguy&ecirc;n nh&acirc;n g&acirc;y ra mụn:</strong></p>

<p>- Do sự tăng tiết về hooc m&ocirc;n khiến tuyến b&atilde; nhờn hoạt động mạnh mẽ</p>

<p>- Qu&aacute; tr&igrave;nh l&agrave;m sạch kh&ocirc;ng tốt khiến b&atilde; nhờn t&iacute;ch tụ qu&aacute; nhiều g&acirc;y &ocirc;xi h&oacute;a lỗ ch&acirc;n l&ocirc;ng</p>

<p>- Tế b&agrave;o sừng gi&agrave; sừng chết kh&ocirc;ng được lấy đi khiến lớp sừng dầy l&ecirc;n</p>

<p>- Vi khuẩn sống k&yacute; sinh tr&ecirc;n da ph&acirc;n hủy b&atilde; nhờn v&agrave; g&acirc;y vi&ecirc;m nhiễm</p>

<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Huyết thanh đặc trị vết th&acirc;m v&agrave; sẹo mụn. Chăm s&oacute;c v&ugrave;ng da bị tổn thương do mụn để lại gi&uacute;p da s&aacute;ng đều m&agrave;uvới th&agrave;nh phần ch&iacute;nh l&agrave; Vitamin C v&agrave; Niacinamide, tạo h&agrave;ng r&agrave;o vững chắc bảo vệ da đặc biệt tăng khả năng đề kh&aacute;ng cho những v&ugrave;ng da bị n&oacute;ng r&aacute;t, đỏ ửng. Sản phẩm đ&atilde; được kiểm nghiệm da liễu an to&agrave;n cho da</p>

<p>C&ocirc;ng thức 7 Free : parabens, mineral oil , talc, benzophenone and triethanolamine, Sulfate-based surfactants, Tac color n&ecirc;n an to&agrave;n tuyệt đối cho da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>- Chiết xuất rễ th&ocirc;ng v&agrave;ng, kh&aacute;ng vi&ecirc;m, chống khuẩn cho da</p>

<p>- Arbutin l&agrave;m mờ vết th&acirc;m v&agrave; đồng đều sắc diện da</p>

<p>- Chiết xuất thảo mộc, cung cấp ẩm v&agrave; l&agrave;m dịu da</p>

<p>- Tăng khả năng l&agrave;m s&aacute;ng da, mờ vết</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>- Kh&aacute;ch h&agrave;ng rối loạn hoocmon do tuổi dậy th&igrave;</p>

<p>- Kh&aacute;ch h&agrave;ng bị mụn</p>

<p>- Kh&aacute;ch h&agrave;ng c&oacute; l&agrave;n da dầu</p>

<p>- Kh&aacute;ch h&agrave;ng kh&ocirc;ng h&agrave;i l&ograve;ng với sản phẩm trị mụn đang d&ugrave;ng</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>B&ocirc;i lượng sản phẩm thật mỏng l&ecirc;n v&ugrave;ng da cần chăm s&oacute;c sau đ&oacute; vỗ nhẹ để sản phẩm thẩm thấu trọn vẹn v&agrave;o da.</p>

<p><strong>Qui tr&igrave;nh sử dụng:</strong></p>

<p>Nước c&acirc;n bằng (Toner) - Sữa dưỡng (Emulsion) &ndash; Huyết thanh đặc trị vết th&acirc;m v&agrave; trị mụn</p>

<p><strong>TL</strong>: 25 ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2119_tony-lab-ac-control-whitening-after-spot2.jpg', N'/images/photoproduct/2016/6/sc_full_2119_tony-lab-ac-control-whitening-after-spot2.jpg', CAST(0x0000A6340111376B AS DateTime), 1, N'25ml', N'', N'Hàn Quốc', 0.0000, 409000.0000, 0, 36, N'vi', 1, 1, 0, N'Tony-Lab-AC-Control-Whitening-After-Spot', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (117, N'The Chok Chok Green Tea Watery Mist 50ml', N'UWTwKQ', N'87', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>Xịt kho&aacute;ng dạng phun sương với những hạt ph&acirc;n tử cực nhỏ gi&uacute;p bổ sung độ ẩm tức th&igrave; cho l&agrave;n da kh&ocirc; v&agrave; thiếu nước. Chứa 100% chiết xuất nước tr&agrave; xanh tinh khiết, l&ecirc;n men tự nhi&ecirc;n để l&agrave;n da hấp thụ tối ưu năng lượng được cung cấp từ tr&agrave; xanh. Kh&ocirc;ng g&acirc;y cảm gi&aacute;c d&iacute;nh r&iacute;t, an to&agrave;n cho mọi loại da.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>- Chiết xuất 100% nước l&aacute; tr&agrave; non được l&ecirc;n men tự nhi&ecirc;n.</p>

<p>- Qui tr&igrave;nh:</p>

<p>Step 1: Thu hoạch l&aacute; tr&agrave; từ v&ugrave;ng n&ocirc;ng th&ocirc;n, phơi kh&ocirc; lần 1, hấp l&ecirc;n v&agrave; gi&atilde; nhỏ, tạo th&agrave;nh vi&ecirc;n nhỏ, x&acirc;u v&agrave;o que, phơi lần 2.Sau đ&oacute;, tạo th&agrave;nh nước tr&agrave; đựng trong một hũ lớn.</p>

<p>Step 2: Nước tr&agrave; để 360 giờ chuẩn bị cho qu&aacute; tr&igrave;nh l&ecirc;nmen tự nhi&ecirc;n</p>

<p>Step 3: L&ecirc;n men tự nhi&ecirc;n 365 ng&agrave;y</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>Kh&aacute;ch h&agrave;ng muốn nhanh ch&oacute;ng cung cấp độ ẩm cho l&agrave;n da thiếu nước</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Đặt sản phẩm ở khoảng c&aacute;ch 20-30 cm, xịt một lượng vừa đủ rồi vỗ nhẹ để sản phẩm thẩm thấu. Sử dụng trước hoặc sau khi trang điểm, trước hoặc sau khi chơi thể thao hoặc khi cảm thấy da bị kh&ocirc;.</p>

<p><strong>TL</strong>: 50 ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2115_the-chok-chok-green-tea-watery-mist-50ml.jpg', N'/images/photoproduct/2016/6/sc_full_2115_the-chok-chok-green-tea-watery-mist-50ml.jpg', CAST(0x0000A63401137BAA AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 302000.0000, 0, 1, N'vi', 1, 1, 1, N'The-Chok-Chok-Green-Tea-Watery-Mist-50ml', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (118, N'The Hayan Cherry Blossom Whitening Essence', N'S3vvFM', N'84', N'<p><strong>C&ocirc;ng dụng:</strong></p>

<p>D&ograve;ng sản phẩm l&agrave;m trắng da trong tương lai bằng c&aacute;ch kh&ocirc;i phục sức sống từ b&ecirc;n trong của mỗi l&agrave;n da. Chứa 100% chiết xuất nước hoa anh đ&agrave;o n&uacute;i Jeju Hallasan, l&agrave; th&agrave;nh phần gi&agrave;u vitamin, cung cấp hiệu quả l&agrave;m trắng tuyệt vời. Nước hoa Anh đ&agrave;o c&oacute; m&agrave;u hồng nhạt hấp thụ nhanh ch&oacute;ng v&agrave;o da, đem lại vẻ sảng kho&aacute;i cho l&agrave;n da v&agrave; kh&ocirc;ng d&iacute;nh r&iacute;t. Sản phẩm đ&atilde; được b&aacute;c sĩ da liễu thử nghiệm về độ an to&agrave;n.</p>

<p><strong>Th&agrave;nh phần:</strong></p>

<p>Chiết xuất nước hoa anh đ&agrave;o được lấy từ n&uacute;i Hallasan đảo Jeju, hiệu quả:</p>

<p>-Duy tr&igrave; sức sống</p>

<p>-L&agrave;m trắng da</p>

<p>-Cung cấp ẩm</p>

<p><strong>Đối tượng sử dụng:</strong></p>

<p>-Kh&aacute;ch h&agrave;ng muốn hồi sinh l&agrave;n da tối xỉn</p>

<p>-Kh&aacute;ch h&agrave;ng da c&oacute; đốm n&acirc;u v&agrave; nhược điểm tr&ecirc;n bề mặt da</p>

<p>-Kh&aacute;ch h&agrave;ng muốn một sản phẩm chăm s&oacute;c da kh&ocirc;ng d&iacute;nh r&iacute;t thế hệ mới</p>

<p>-Kh&aacute;ch h&agrave;ng muốn sản phẩm chăm s&oacute;c l&agrave;m trắng với gi&aacute; cả hợp l&yacute;</p>

<p><strong>Hướng dẫn sử dụng:</strong></p>

<p>Sau khi l&agrave;m sạch da, lấy một lượng vừa đủ thoa đều khắp mặt sau đ&oacute; d&ugrave;ng tay vỗ nhẹ để tăng độ thẩm thấu.</p>

<p><strong>TL</strong>: 55ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2086_the-hayan-cherry-blossom-whitening-essence.jpg', N'/images/photoproduct/2016/6/sc_full_2086_the-hayan-cherry-blossom-whitening-essence.jpg', CAST(0x0000A6340110AC7D AS DateTime), 1, N'55ml', N'', N'Hàn Quốc', 0.0000, 669000.0000, 0, 7, N'vi', 1, 1, 1, N'The-Hayan-Cherry-Blossom-Whitening-Essence', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (119, N'My Sunny Perfecting Sun Block', N'liYF9o', N'89', N'<p>Kem chống nắng với chỉ số bảo vệ cao, l&agrave; lựa chọn ho&agrave;n hảo cho l&agrave;n da mẫn cảm v&agrave; dễ bị t&aacute;c động bởi tia tử ngoại</p>

<p><strong>HDSD</strong>:&nbsp;d&ugrave;ng 1 lượng vừa đủ thoa l&ecirc;n v&ugrave;ng da cần bảo vệ</p>

<p><strong>TL</strong>:&nbsp;100 g</p>

<p><strong>HSD</strong>:&nbsp;3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p><strong>Nh&oacute;m sản phẩm: URBAN ANTI+DOTES</strong></p>

<p>Dầu gội c&oacute; chứa phức hợp hạt nano si&ecirc;u nhỏ (hay c&ograve;n gọi l&agrave; hạt silicon si&ecirc;u nhỏ) b&aacute;m v&agrave;o v&ugrave;ng t&oacute;c bị hư tổn (Silicon: giống như một lớp &aacute;o cho&agrave;ng bảo vệ t&oacute;c). Những hạt silicon n&agrave;y c&oacute; thể b&aacute;m d&iacute;nh v&agrave;o t&oacute;c bởi bao quanh ch&uacute;ng l&agrave; lớp m&agrave;ng t&iacute;ch điện dương (t&oacute;c t&iacute;ch điện &acirc;m).</p>

<p><em><strong>Đặc điểm kh&aacute;c biệt với những sản phẩm chứa Silicon kh&aacute;c</strong></em>:&nbsp;Đ&oacute; l&agrave; trọng lượng những ph&acirc;n tử Silicon v&agrave; c&aacute;ch thức ch&uacute;ng b&aacute;m v&agrave;o sơi t&oacute;c kh&aacute;c nhau. Do vậy, tạo cho t&oacute;c cảm gi&aacute;c khỏe khoắn hơn v&agrave; kh&ocirc;ng g&acirc;y nặng t&oacute;c hay bết d&iacute;nh.</p>

<p><strong>Re-Energize - T&Aacute;I TẠO SINH LỰC</strong></p>

<p>Giải cứu phong c&aacute;ch mức độ 1: L&agrave;m hết sức, chơi hết m&igrave;nh, đ&oacute; l&agrave; ch&acirc;m ng&ocirc;n cho t&oacute;c bạn trở lại d&aacute;ng vẻ b&igrave;nh thường bẳng dầu gội củng cố lại độ ẩm v&agrave; gia tăng độ b&oacute;ng. T&aacute;i Tạo Sinh Lực cho d&aacute;ng vẻ mệt mỏi của t&oacute;c</p>

<p>Mang về lại cho m&aacute;i t&oacute;c mệt mỏi v&agrave; căng thẳng sự cường tr&aacute;ng. Tiếp th&ecirc;m đổ ẩm, gi&uacute;p phục hồi lại của m&aacute;i t&oacute;c yếu, T&oacute;c c&oacute; thể khoa trương với sự b&oacute;ng s&aacute;ng v&agrave; chắc khỏe. T&aacute;i Tạo Sinh Lực &amp; GET YOUR ACT TOGETHER.</p>
', N'/images/photoproduct/2016/6/sc_small_2117_my-sunny-perfecting-sun-block.jpg', N'/images/photoproduct/2016/6/sc_full_2117_my-sunny-perfecting-sun-block.jpg', CAST(0x0000A6340112CE18 AS DateTime), 1, N'100g', N'', N'Hàn Quốc', 0.0000, 532000.0000, 0, 35, N'vi', 1, 0, 1, N'My-Sunny-Perfecting-Sun-Block', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (120, N'Master Lab Hyaluronic Acid Mask', N'siTNUS', N'95', N'<p>Mặt nạ chăm s&oacute;c l&agrave;n da kh&ocirc;, thiếu độ ẩm</p>

<p>Mặt nạ miếng bổ sung nước tức th&igrave; cho l&agrave;n da đem lại l&agrave;n da mềm mại hơn.</p>

<p><strong>HDSD</strong>: Rửa sạch mặt, sau đ&oacute; lau kh&ocirc; mặt v&agrave; l&agrave;m theo thứ tự sau:</p>

<p>- Thoa ampoule l&ecirc;n khắp mặt</p>

<p>- D&ugrave;ng miếng Mask đắp l&ecirc;n</p>

<p>- Sau khoảng10-20 ph&uacute;t, nhẹ nh&agrave;ng th&aacute;o miếng mặt nạ rồi vỗ nhẹ cho dưỡng chất thẩm thấu s&acirc;u v&agrave;o trong da.</p>

<p><strong>DL</strong>: 19g</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p><strong>NSX</strong>: H&agrave;n Quốc</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2080_master-lab-hyaluronic-acid-mask.jpg', N'/images/photoproduct/2016/6/sc_full_2080_master-lab-hyaluronic-acid-mask.jpg', CAST(0x0000A63500B84FC9 AS DateTime), 1, N'19g', N'', N'Hàn Quốc', 0.0000, 76000.0000, 0, 3, N'vi', 1, 1, 0, N'Master-Lab-Hyaluronic-Acid-Mask', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (121, N'Ferment Snail Hydro Gel Mask', N'Ci38KD', N'95', N'<p><strong>C&ocirc;ng dụng</strong>&nbsp;: Mặt nạ đặc trị l&agrave;m trắng,ngăn ngừa nếp nhăn, cải thiện da tổn thưởng. D&agrave;nh cho tất cả c&aacute;c loại da.Mặt nạ chứa chiết xuất nhớt ốc s&ecirc;n với khả năng t&aacute;i sinh thần kỳ cung cấp độ ẩm v&agrave; dưỡng chất, tạo lớp m&agrave;ng bảo vệ da, duy tr&igrave; l&agrave;n da lu&ocirc;n mềm mại, căng mịn. Đồng thời chiết xuất từ tơ cũng gi&uacute;p giảm thiểu t&igrave;nh trạng thiếu nước của l&agrave;n da kh&ocirc;, đem lại l&agrave;n da trắng s&aacute;ng, khỏe mạnh v&agrave; c&oacute; độ đ&agrave;n hồi.&nbsp;</p>

<p><strong>HDSD</strong>: Sau khi rửa mặt, b&igrave;nh ổn da bằng nước hoa hồng. Đắp miếng mặt nạ l&ecirc;n mặt, sau 20-30 ph&uacute;t, th&aacute;o lớp mặt nạ n&agrave;y ra, d&ugrave;ng tay vỗ nhẹ để những dưỡng chất c&ograve;n lại thẩm thấu v&agrave;o da.Sử dụng khoảng 2~3 tuần/ lần, sử dụng kết hợp với bộ sản phẩm Ferment Snail để tăng hiệu quả.</p>

<p><strong>TL</strong>: 1EA-25g</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sản xuất</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2075_ferment-snail-hydro-gel-mask.jpg', N'/images/photoproduct/2016/6/sc_full_2075_ferment-snail-hydro-gel-mask.jpg', CAST(0x0000A63500B971FB AS DateTime), 1, N'25g', N'', N'Hàn Quốc', 0.0000, 260000.0000, 0, 4, N'vi', 1, 1, 0, N'Ferment-Snail-Hydro-Gel-Mask', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (122, N'Magic Food Choco Mushroom Cream Pore Pack', N'HcD6wZ', N'95', N'<p>Mặt nạ se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng chiết xuất từ cacao, nấm v&agrave; bột đất s&eacute;t hiệu quả l&agrave;m sạch s&acirc;u,se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng, cacao hấp thu lượng b&atilde; nhờn dư thừa gi&uacute;p da s&aacute;ng mịn , khỏe mạnh</p>

<p>HDSD: Sau khi sử dụng tẩy tế b&agrave;o chết mặt, để da kh&ocirc; sau đ&oacute; lấy một lượng sản phẩm vửa đủ massage đều l&ecirc;n da mặt, để từ 5 ~ 10 ph&uacute;t sau đ&oacute; rửa sạch lại với nước ấm</p>

<p>TL: 70 ml</p>

<p>HSD: 3 năm sau ng&agrave;y sx</p>

<p>NSX: H&agrave;n Quốc</p>

<p>Lưu &yacute;: Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2077_magic-food-mushroom-chocolate-sleeping-mask.jpg', N'/images/photoproduct/2016/6/sc_full_2077_magic-food-mushroom-chocolate-sleeping-mask.jpg', CAST(0x0000A63500B95BC5 AS DateTime), 1, N'70ml', N'', N'Hàn Quốc', 0.0000, 417000.0000, 0, 5, N'vi', 1, 1, 0, N'Magic-Food-Choco-Mushroom-Cream-Pore-Pack', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (123, N'Daily Aloe Fresh Mask Sheet', N'D2hs34', N'95', N'<p>&nbsp;</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2093_aloe-fresh-mask-sheet.jpg', N'/images/photoproduct/2016/6/sc_full_2093_aloe-fresh-mask-sheet.jpg', CAST(0x0000A63500BD8D6B AS DateTime), 1, N'', N'', N'Hàn Quốc', 0.0000, 200000.0000, 0, 6, N'vi', 1, 0, 0, N'Daily-Aloe-Fresh-Mask-Sheet', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (124, N'Naturalth Goat Milk Cream Gel Mask', N'z9Oe6H', N'95', N'<p>Mặt nạ đặc trị l&agrave;m trắng+cải thiện nếp nhăn Mặt nạ dạng gel chứa chiết xuất sữa d&ecirc; thanh tr&ugrave;ng từ New Zealand gi&uacute;p bổ sung độ ẩm từ s&acirc;u b&ecirc;n trong, hiệu quả l&agrave;m mềm mịn da, duy tr&igrave; l&agrave;n da trắng s&aacute;ng.</p>

<p>&nbsp;</p>

<p><strong>HDSD</strong>: Sau khi rửa mặt, b&igrave;nh ổn da bằng nước hoa hồng. Đắp miếng mặt nạ l&ecirc;n mặt, sau 30 ph&uacute;t, th&aacute;o lớp mặt nạ n&agrave;y ra, d&ugrave;ng tay vỗ tay để những dưỡng chất c&ograve;n lại thẩm thấu v&agrave;o da.Sử dụng khoảng 2~3 tuần/ lần, sử dụng kết hợp với bộ sản phẩm Natural Goat Milk để tăng hiệu quả.</p>

<p><strong>TL</strong>: 1EA-25g</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sản xuất</p>

<p><strong>NSX</strong>: H&agrave;n Quốc</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2094_naturalth-goat-milk-cream-gel-mask.jpg', N'/images/photoproduct/2016/6/sc_full_2094_naturalth-goat-milk-cream-gel-mask.jpg', CAST(0x0000A63500BDFC1D AS DateTime), 1, N'25g', N'', N'Việt Nam', 0.0000, 197000.0000, 0, 7, N'vi', 1, 0, 0, N'Naturalth-Goat-Milk-Cream-Gel-Mask', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (125, N'Luxury Gem Gold 24K Mask', N'SxG98u', N'95', N'<p>Mặt nạ v&agrave;ng chăm s&oacute;c đặc biệt cho da, với th&agrave;nh phần từ bột v&agrave;ng nguy&ecirc;n chất gi&uacute;p tăng cường khả năng đ&agrave;n hồi v&agrave; sức sống cho l&agrave;n da</p>

<p><strong>HDSD:</strong>&nbsp;Sau khi rửa mặt, lau kh&ocirc;, lấy một lượng vừa đủ thoa đều khắp mặt (như massage), trừ mắt v&agrave; m&ocirc;i, để trong khoảng 15 ph&uacute;t, đến khi lớp mặt nạ kh&ocirc; th&igrave; rửa sạch lại bằng nước ấm</p>

<p><strong>TL</strong>: 100 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2096_luxury-gem-gold-24k-mask.jpg', N'/images/photoproduct/2016/6/sc_full_2096_luxury-gem-gold-24k-mask.jpg', CAST(0x0000A63500BE894E AS DateTime), 1, N'100ml', N'', N'Hàn Quốc', 0.0000, 715000.0000, 0, 8, N'vi', 1, 0, 0, N'Luxury-Gem-Gold-24K-Mask', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (126, N'Tony Lab AC Control Spot Patch', N'z6POGh', N'95', N'<p>Miếng mặt nạ với phức hợp những nguy&ecirc;n liệu c&oacute; t&aacute;c dụng b&igrave;nh ổn cho l&agrave;n da dầu mụn hiệu quả chăm s&oacute;c cho v&ugrave;ng da bị tổn thương, hoặc l&agrave;n da mệt mỏi do căng thẳng. Hiệu quả giảm thiểu v&agrave; l&agrave;m se vết mụn, gi&uacute;p l&agrave;n da mịn m&agrave;ng, tươi tắn hơn.</p>

<p><strong>TP</strong>: chiết xuất rễ th&ocirc;ng, rau sam, phyto oligo...</p>

<p><strong>HDSD</strong>: Rửa mặt sạch v&agrave; lau kh&ocirc; vị tr&iacute; c&oacute; mụn, d&aacute;n miếng lột mụn v&agrave; để trong khoảng 8-10 tiếng. Sau khoảng thời gian n&ecirc;u tr&ecirc;n th&igrave; lột miếng mặt nạ ra. Sử dụng trong l&uacute;c ngủ sẽ đem lại hiệu quả cao hơn.</p>

<p><strong>TL</strong>: 1 miếng</p>

<p><strong>HSD</strong>:&nbsp;3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2104_tony-lab-ac-control-spot-patch.jpg', N'/images/photoproduct/2016/6/sc_full_2104_tony-lab-ac-control-spot-patch.jpg', CAST(0x0000A63500C09A31 AS DateTime), 1, N'', N'', N'Hàn Quốc', 0.0000, 40000.0000, 0, 9, N'vi', 1, 0, 0, N'Tony-Lab-AC-Control-Spot-Patch', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (127, N'Pureness 100 Mask Sheet', N'RvBdf4', N'95', N'<p><strong>Pureness 100 Propolist Mask Sheet Skin Calming</strong></p>

<p>Mặt nạ miếng 100% cotton th&agrave;nh phần từ s&aacute;p ong, l&agrave;m sạch, loại bỏ b&atilde; nhờn&nbsp;</p>

<p><strong>Pureness 100 Caviar Mask Sheet Nutrition&nbsp;</strong></p>

<p>Mặt nạ miếng 100% cotton bổ sung dưỡng chất, tăng khả năng đ&agrave;n hồi&nbsp;</p>

<p><strong>Pureness 100 Shea Butter Mask Sheet Moisturing</strong></p>

<p>Mặt nạ miếng 100% cotton chiết xuất từ bơ bổ sung dưỡng chất, tăng cường độ ẩm&nbsp;</p>

<p><strong>Pureness 100 Hyaluronic Acid Mask Sheet Hydrating&nbsp;</strong></p>

<p>&nbsp;Mặt nạ miếng 100% cotton chiết xuất từ acid sinh học c&oacute; sẵn cung cấp độ ẩm cho da</p>

<p><strong>Pureness 100 Red Ginseng Mask Sheet Shine&nbsp;</strong></p>

<p>Mặt nạ miếng 100% cotton bổ sung dưỡng chất, tăng khả năng đ&agrave;n hồi&nbsp;</p>

<p><strong>HDSD</strong>: Rửa sạch mặt, sau đ&oacute; lau kh&ocirc; mặt v&agrave; l&agrave;m theo thứ tự sau:</p>

<p>- Thoa ampoule l&ecirc;n khắp mặt</p>

<p>- D&ugrave;ng miếng Mask đắp l&ecirc;n</p>

<p>- Sau khoảng10-20 ph&uacute;t, nhẹ nh&agrave;ng th&aacute;o miếng mặt nạ&nbsp;&nbsp;</p>

<p><strong>&nbsp;Trọn</strong><strong>g lượng:</strong>&nbsp;2ml&nbsp;</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2107_pureness-100-mask-sheet.jpg', N'/images/photoproduct/2016/6/sc_full_2107_pureness-100-mask-sheet.jpg', CAST(0x0000A63500C19E68 AS DateTime), 1, N'2ml', N'', N'Hàn Quốc', 0.0000, 40000.0000, 0, 10, N'vi', 1, 0, 0, N'Pureness-100-Mask-Sheet', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (128, N'Im Real Mask Sheet', N'qy8RPW', N'95', N'<p><strong>Im Real Rice Mask Sheet Clear Skin</strong>&nbsp;</p>

<p><em>Mặt nạ chăm s&oacute;c l&agrave;m trắng</em></p>

<p>Mặt nạ miếng chứa dưỡng chất từ gạo v&agrave; cấu tạo miếng mặt nạ từ b&ocirc;ng mềm, gi&uacute;p chăm s&oacute;c cho l&agrave;n da ng&agrave;y c&agrave;ng trắng s&aacute;ng hơn</p>

<p><strong>&nbsp;Im Real Avocado Mask Sheet Nutrition</strong></p>

<p><em>Mặt nạ bổ sung dưỡng chất, tăng khả năng đ&agrave;n hồi, t&aacute;i tạo da</em></p>

<p>Mặt nạ &nbsp;chứa th&agrave;nh phần &nbsp;từ quả bơ v&agrave; cấu tạo miếng mặt nạ từ b&ocirc;ng mềm, gi&uacute;p chăm s&oacute;c cho l&agrave;n da ng&agrave;y c&agrave;ngmềm mượt v&agrave; khỏe hơn</p>

<p><strong>&nbsp;Im Real Aloe Mask Sheet Moisturezing</strong></p>

<p><em>&nbsp;Mặt nạ bổ sung độ ẩm</em></p>

<p>Mặt nạ &nbsp;chứa th&agrave;nh phần &nbsp;từ l&ocirc; hội, hiệu quả l&agrave;m dịu nhẹ cho l&agrave;n da bị tổn thương, bổ sung độ ẩm cho l&agrave;n da khỏe v&agrave; mềm mại</p>

<p><strong>&nbsp;Im Real Tomato Mask Sheet Radiance</strong></p>

<p><em>&nbsp;Mặt nạ l&agrave;m trắng</em></p>

<p>Mặt nạ &nbsp;chứa th&agrave;nh phần &nbsp;từ c&agrave; chua gi&uacute;p da trắng s&aacute;ng v&agrave; b&oacute;ng mượt hơn</p>

<p><strong>&nbsp;Im Real Red Wine Mask Sheet Pore Care</strong></p>

<p><em>&nbsp;Mặt nạ se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng</em></p>

<p>Mặt nạ &nbsp;chứa dưỡng chất từ rượu vang đỏ v&agrave; cấu tạo miếng mặt nạ từ b&ocirc;ng mềm, hiệu quả chăm s&oacute;c v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng</p>

<p><strong>&nbsp;Im Real Seaweeds Mask Sheet Skin Purifying</strong></p>

<p><em>Mặt nạ l&agrave;m sạch thanh khiết</em></p>

<p>Mặt nạ chứa dưỡng chất từ tảo biển, cấu tạo mặt nạo từ b&ocirc;ng mềm, hiệu quả chăm s&oacute;c v&agrave; gi&uacute;p da sạch, tinh khiết hơn.</p>

<p><strong>Im Real Tea tree Mask Sheet Skin Calming</strong></p>

<p><em>Mặt nạ l&agrave;m sạch loại bỏ b&atilde; nhờn</em></p>

<p>Mặt nạ miếng chứa th&agrave;nh phần từ tr&agrave; xanh, hiệu quả l&agrave;m sạch, loại bỏ b&atilde; nhờn.</p>

<p><strong>HDSD</strong>: Rửa sạch mặt, sau đ&oacute; lau kh&ocirc; mặt v&agrave; l&agrave;m theo thứ tự sau:</p>

<p>- Thoa ampoule l&ecirc;n khắp mặt</p>

<p>- D&ugrave;ng miếng Mask đắp l&ecirc;n</p>

<p>- Sau khoảng10-20 ph&uacute;t, nhẹ nh&agrave;ng th&aacute;o miếng mặt nạ&nbsp;&nbsp;</p>

<p><strong>&nbsp;Trọng lượng:</strong>&nbsp;21ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2065_im-real-rice-mask-sheet.jpg', N'/images/photoproduct/2016/6/sc_full_2065_im-real-rice-mask-sheet.jpg', CAST(0x0000A63500C638C4 AS DateTime), 1, N'21ml', N'', N'Hàn Quốc', 0.0000, 40000.0000, 0, 11, N'vi', 1, 0, 0, N'Im-Real-Mask-Sheet', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (129, N'Egg Pore Nose Pack', N'ziIiFp', N'95', N'<p>Miếng lột mũi chiết xuất từ l&ograve;ng trắng trứng v&agrave; hoa tr&agrave; gi&uacute;p điều chỉnh b&atilde; nhờn, loại bỏ mụn đầu đen, chất bẩn v&agrave; vi khuẩn nằm s&acirc;u b&ecirc;n trong, cho v&ugrave;ng da ở mũi sạch mịn hơn.</p>

<p><strong>TP</strong>: chiết xuất l&ograve;ng trắng trứng, hoa tr&agrave;</p>

<p><strong>HDSD</strong>: Rửa mặt sạch v&agrave; l&agrave;m ướt mũi, d&aacute;n miếng lột mũi v&agrave; miết thật chặt, sau 10-15 ph&uacute;t, gỡ ra khi miếng lột mũi đ&atilde; kh&ocirc;.</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2071_nose-pack.jpg', N'/images/photoproduct/2016/6/sc_full_2071_nose-pack.jpg', CAST(0x0000A63500C7DD41 AS DateTime), 1, N'', N'', N'Hàn Quốc', 0.0000, 19000.0000, 0, 12, N'vi', 1, 0, 0, N'Egg-Pore-Nose-Pack', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (130, N'Floria Nurtra Energy Foam Cleanser', N'jygQlP', N'91', N'<p>Sữa rửa mặt cung cấp dưỡng chất cho da</p>

<p><strong>C&ocirc;ng dụng:</strong>&nbsp;Sữa rửa mặt chiết xuất từ dầu Argan v&agrave; c&aacute;c loại thảo dược chăm s&oacute;c da dịu nhẹ , l&agrave;m sạch mọi bụi bẩn s&acirc;u trong lỗ ch&acirc;n l&ocirc;ng cải thiện t&igrave;nh trạng da bong tr&oacute;c v&agrave; l&atilde;o h&oacute;a .</p>

<p><strong>HDSD:&nbsp;</strong>Sau khi l&agrave;m ướt mặt, buổi s&aacute;ng lấy 1 lượng khoảng 1cm , buổi tối lấy 1 lượng khoảng 1,5 ~ 2cm tạo bọt mịn sau đ&oacute; massage l&ecirc;n mặt v&agrave; rửa sạch lại với nước ấm .</p>

<p><strong>TL:</strong>&nbsp;150 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2076_floria-nurtra-energy-foam-cleanser.jpg', N'/images/photoproduct/2016/6/sc_full_2076_floria-nurtra-energy-foam-cleanser.jpg', CAST(0x0000A66A00DC40A6 AS DateTime), 1, N'150ml', N'', N'Việt Nam', 0.0000, 267000.0000, 0, 1, N'vi', 1, 0, 0, N'Floria-Nurtra-Energy-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (131, N'Pure Eco Bamboo Clean Water Cleansing Gel Foam', N'AkcBoW', N'91', N'<p>Sữa rửa mặt chiết xuất từ tre tươi H&agrave;n Quốc</p>

<p><strong>C&ocirc;ng dụng:</strong>&nbsp;Sữa rửa mặt tạo bọt dạng Gel gi&uacute;p loại bỏ bụi bẩn v&agrave; lớp trang điểm nhẹ đem lại cho l&agrave;n da s&aacute;ng khỏe, tươi mới . C&oacute; thể sử dụng cho to&agrave;n th&acirc;n.</p>

<p><strong>HDSD:</strong>&nbsp;Sau khi l&agrave;m ướt mặt, buổi s&aacute;ng lấy 1 lượng khoảng 1cm , buổi tối lấy 1 lượng khoảng 1,5 ~ 2cm tạo bọt mịn sau đ&oacute; massage l&ecirc;n mặt v&agrave; rửa sạch lại với nước ấm.</p>

<p><strong>TL</strong>: 300 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2077_pure-eco-bamboo-clean-water-cleansing-gel-foam.jpg', N'/images/photoproduct/2016/6/sc_full_2077_pure-eco-bamboo-clean-water-cleansing-gel-foam.jpg', CAST(0x0000A63500C990CD AS DateTime), 1, N'300ml', N'', N'Hàn Quốc', 0.0000, 307000.0000, 0, 2, N'vi', 1, 0, 0, N'Pure-Eco-Bamboo-Clean-Water-Cleansing-Gel-Foam', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (133, N'The Oriental Gyeol Cleansing Foam', N'ZnQ2I3', N'91', N'<p>Sữa rửa mặt cao cấp chiết xuất từ Đ&ocirc;ng Y</p>

<p><strong>C&ocirc;ng dụng:</strong>&nbsp;Sữa rửa mặt tạo bọt cao cấp chiết xuất từ c&aacute;c th&agrave;nh phần Đ&ocirc;ng Y v&agrave; v&agrave;ng c&oacute; chức năng đ&agrave;o thải độc tố, loại bỏ tế b&agrave;o sừng gi&agrave; , loại bỏ mụn c&aacute;m, mụn đầu đen đồng thời cung cấp nguồn dưỡng chất phong ph&uacute; gi&uacute;p nu&ocirc;i dưỡng ,duy tr&igrave; độ ẩm v&agrave; trẻ h&oacute;a l&agrave;n da</p>

<p><strong>HDSD:</strong>&nbsp;Sau khi l&agrave;m ướt mặt, buổi s&aacute;ng lấy 1 lượng khoảng 1cm , buổi tối lấy 1 lượng khoảng 1,5 ~ 2cm tạo bọt mịn sau đ&oacute; massage l&ecirc;n mặt v&agrave; rửa sạch lại với nước ấm.</p>

<p><strong>TL:&nbsp;</strong>150 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2081_the-oriental-gyeol-cleansing-foam.jpg', N'/images/photoproduct/2016/6/sc_full_2081_the-oriental-gyeol-cleansing-foam.jpg', CAST(0x0000A63500EB0977 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 386000.0000, 0, 3, N'vi', 1, 0, 0, N'The-Oriental-Gyeol-Cleansing-Foam', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (134, N'Timeless Ferment Snail Cleanser', N'gjZEvn', N'91', N'<p>Sữa rửa mặt từ nhớt ốc s&ecirc;n l&ecirc;n men</p>

<p>Sữa rửa mặt chứa 20% chiết xuất từ nhớt ốc s&ecirc;n l&ecirc;n men tập trung l&agrave;m sạch, lấy đi bụi bẩn v&agrave; lớp trang điểm, gi&uacute;p cải thiện m&agrave;u da, l&agrave;m mờ vết th&acirc;m, duy tr&igrave; l&agrave;n da mềm mướt hiệu quả.</p>

<p><strong>HDSD:</strong>&nbsp;lấy 1 lượng vừa đủ rat ay, tạo bọt v&agrave; thoa đều khắp mặt, rồi rửa lại thật sạch bằng nước ấm.</p>

<p><strong>TL:</strong>&nbsp;150 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2084_timeless-ferment-snail-cleanser.jpg', N'/images/photoproduct/2016/6/sc_full_2084_timeless-ferment-snail-cleanser.jpg', CAST(0x0000A63500CB7E09 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 496000.0000, 0, 4, N'vi', 1, 0, 0, N'Timeless-Ferment-Snail-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (135, N'Naturalth Goat Milk Cream Foam Cleanser', N'H67OWl', N'91', N'<p>&nbsp;</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2072_naturalth-goat-milk-cream-foam-cleanser.jpg', N'/images/photoproduct/2016/6/sc_full_2072_naturalth-goat-milk-cream-foam-cleanser.jpg', CAST(0x0000A6350108FA5F AS DateTime), 1, N'200ml', N'', N'Hàn Quốc', 0.0000, 415000.0000, 0, 5, N'vi', 1, 0, 0, N'Naturalth-Goat-Milk-Cream-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (136, N'Magic Food Banana Cream Foam Cleanser', N'VD7mbo', N'91', N'<p>Sữa rửa mặt từ chuối, hiệu quả như một loại thực phẩm sạch cho da, th&agrave;nh phần mật ong trong chuối gi&uacute;p l&agrave;m sạch v&agrave; bổ sung dưỡng chất</p>

<p><strong>HDSD</strong>:&nbsp;Lấy 1 lượng vừa đủ, tạo bọt với nước, thoa đều l&ecirc;n mặt (tr&aacute;nh v&ugrave;ng mắt v&agrave; m&ocirc;i), nhẹ nh&agrave;ng massage rồi rửa lại thật sạch với nước</p>

<p><strong>TL</strong>:&nbsp;150 ml</p>

<p><strong>HSD</strong>:&nbsp;3 năm sau ng&agrave;y sx</p>

<p>Lưu &yacute;:&nbsp;Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2074_foam-cleanser.png', N'/images/photoproduct/2016/6/sc_full_2074_foam-cleanser.png', CAST(0x0000A63501095935 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 387000.0000, 0, 6, N'vi', 1, 0, 0, N'Magic-Food-Banana-Cream-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (137, N'Aquaporine Moisture Foam Cleanser', N'q3CM0K', N'91', N'<p>Sữa rửa mặt d&agrave;nh cho da hỗn hợp dầu thi&ecirc;n kh&ocirc;</p>

<p>Sữa rửa mặt l&agrave;m sạch s&acirc;u, th&uacute;c đẩy l&agrave;n da khỏe mạnh qua việc bổ sung lượng ẩm phong ph&uacute;.</p>

<p><strong>TP</strong>: Tảo xoắn, tảo biển, nước liễu...</p>

<p><strong>HDSD:</strong>&nbsp;Lấy 1 lượng vừa đủ, tạo bọt với nước, thoa đều l&ecirc;n mặt (tr&aacute;nh v&ugrave;ng mắt v&agrave; m&ocirc;i), nhẹ nh&agrave;ng massage rồi rửa lại thật sạch với nước.</p>

<p><strong>TL:</strong>&nbsp;150 ml</p>

<p><strong>HSD:&nbsp;</strong>3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2076_moisture-foam-cleanser.jpg', N'/images/photoproduct/2016/6/sc_full_2076_moisture-foam-cleanser.jpg', CAST(0x0000A635010A1260 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 275000.0000, 0, 7, N'vi', 1, 0, 0, N'Aquaporine-Moisture-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (138, N'Tony Lab AC Control Ance Foam', N'VtT4Xe', N'91', N'<p>Sữa rửa mặt đặc trị mụn</p>

<p>-&nbsp;<strong>Chức năng</strong>: L&agrave; một loại dược mỹ phẩm ti&ecirc;n tiến dạng kem tạo lượng bọt phong ph&uacute; v&agrave; mềm mại, hiệu quả kh&aacute;ng khuẩn, l&agrave;m sạch bụi bẩn s&acirc;u b&ecirc;n trong lỗ ch&acirc;n l&ocirc;ng, l&agrave;m se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng, điều tiết dầu, loại bỏ những khuẩn g&acirc;y mụn, gi&uacute;p điều trị v&agrave; cải thiện cho l&agrave;n da c&oacute; mụn.</p>

<p>-&nbsp;<strong>TP</strong>: chiết xuất từ rễ c&acirc;y th&ocirc;ng, xương rồng, rau m&aacute;, x&ocirc; thơm...</p>

<p>-&nbsp;<strong>HDSD</strong>: lấy 1 lượng vừa đủ ra tay, tạo bọt v&agrave; thoa đều khắp mặt, rồi rửa sạch lại bằng nước sạch, d&ugrave;ng s&aacute;ng v&agrave; tối.</p>

<p>-&nbsp;<strong>TL</strong>: 150ml</p>

<p>-&nbsp;<strong>HSD</strong>:&nbsp;3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2078_tony-lab-ac-control-acne-foam.jpg', N'/images/photoproduct/2016/6/sc_full_2078_tony-lab-ac-control-acne-foam.jpg', CAST(0x0000A635010AB04A AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 396000.0000, 0, 8, N'vi', 1, 0, 0, N'Tony-Lab-AC-Control-Ance-Foam', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (139, N'Clean Dew Aloe Foam Cleanser', N'3sadjo', N'91', N'<p><strong>Clean Dew Aloe &nbsp;Foam Cleanser : da kh&ocirc; v&agrave; nhạy cảm</strong></p>

<p>-&nbsp;<strong>Chức năng</strong>: L&agrave;m sạch l&agrave;n da một c&aacute;ch mềm mại, cung cấp độ ẩm cho da &nbsp;mang lại cảm gi&aacute;c dịu nhẹ cho l&agrave;n da&nbsp;</p>

<p>-&nbsp;<strong>Th&agrave;nh phần</strong>: Chiết xuất từ l&aacute; nước c&acirc;y l&ocirc; hội</p>

<p><strong>HDSD</strong>&nbsp;:&nbsp;Buối s&aacute;ng cho cho sản phẩm khoảng 1cm , buổi tối : 2 cm đ&aacute;nh b&ocirc;ng bọt v&agrave; nhẹ nh&agrave;ng rửa tr&ecirc;n da mặt, rửa sạch bằng nước .D&ugrave;ng 2 lần s&aacute;ng v&agrave; tối.&nbsp;</p>

<p><strong>TL</strong>&nbsp;: 180ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2081_img_0576-1.jpg', N'/images/photoproduct/2016/6/sc_full_2081_img_0576-1.jpg', CAST(0x0000A635010B454F AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 139000.0000, 0, 9, N'vi', 1, 0, 0, N'Clean-Dew-Aloe-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (141, N'Clean Dew Red Grapfruit Foam Cleanser', N'bhuA5b', N'91', N'<p>D&agrave;nh cho mọi loại da</p>

<p align="justify">L&agrave;m sạch l&agrave;n da một c&aacute;ch mềm mại, tăng độ đ&agrave;n hồi cho l&agrave;n da m&agrave; kh&ocirc;ng g&acirc;y k&iacute;ch ứng&nbsp;</p>

<p><strong>TP</strong>:&nbsp;Tinh chất red grapefruit (bưởi t&acirc;y)</p>

<p><strong>HDSD</strong>&nbsp;:&nbsp;buối s&aacute;ng cho cho sản phẩm khoảng 1cm , buổi tối : 2 cm đ&aacute;nh b&ocirc;ng bọt v&agrave; nhẹ nh&agrave;ng rửa tr&ecirc;n da mặt, rửa sạch bằng nước. D&ugrave;ng 2 lần s&aacute;ng v&agrave; tối.&nbsp;</p>

<p>TL : 180ml.&nbsp;</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2097_img_0569-1.jpg', N'/images/photoproduct/2016/6/sc_full_2097_img_0569-1.jpg', CAST(0x0000A635010FCDFB AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 139000.0000, 0, 10, N'vi', 1, 0, 0, N'Clean-Dew-Red-Grapfruit-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (143, N'Clean Dew Lemon Foam Cleanser', N'gJ2a9N', N'91', N'<p>D&agrave;nh cho da hỗn hợp v&agrave; da dầu&nbsp;</p>

<p>L&agrave;m sạch l&agrave;n da một c&aacute;ch mềm mại ,gi&uacute;p s&aacute;ng da v&agrave; khả năng kiềm dầu từ tr&aacute;i chanh.</p>

<p><strong>TP</strong>:&nbsp;Tinh chất chanh tươi</p>

<p><strong>HDSD</strong>&nbsp;:&nbsp;buối s&aacute;ng cho cho sản phẩm khoảng 1cm, buổi tối : 2 cm đ&aacute;nh b&ocirc;ng bọt v&agrave; nhẹ nh&agrave;ng rửa tr&ecirc;n da mặt, rửa sạch bằng nước. D&ugrave;ng 2 lần s&aacute;ng v&agrave; tối</p>

<p><strong>TL</strong>: 180ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2084_img_0573-1.jpg', N'/images/photoproduct/2016/6/sc_full_2084_img_0573-1.jpg', CAST(0x0000A635010C4FD6 AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 139000.0000, 0, 11, N'vi', 1, 0, 0, N'Clean-Dew-Lemon-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (144, N'Clean Dew Acerola Foam Cleanser', N'vG7lLx', N'91', N'<p>D&agrave;nh cho da nhạy cảm</p>

<p>L&agrave;m sạch l&agrave;n da một c&aacute;ch mềm mại ,bổ sung vitamin v&agrave; kho&aacute;ng chất gi&uacute;p tăng cường năng lượng v&agrave; khả năng chống khuẩn , chống oxy h&oacute;a cho l&agrave;n da.</p>

<p><strong>TP</strong>:&nbsp;tinh chất Acerola (sơ ri)</p>

<p><strong>HD</strong><strong>S</strong><strong>D</strong>&nbsp;:&nbsp;buối s&aacute;ng cho cho sản phẩm khoảng 1cm , buổi tối : 2 cm đ&aacute;nh b&ocirc;ng bọt v&agrave; nhẹ nh&agrave;ng rửa tr&ecirc;n da mặt, rửa sạch bằng nước. D&ugrave;ng 2 lần s&aacute;ng v&agrave; tối.&nbsp;</p>

<p><strong>TL</strong>&nbsp;:&nbsp;180ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2090_img_0574-1.jpg', N'/images/photoproduct/2016/6/sc_full_2090_img_0574-1.jpg', CAST(0x0000A635010DFB34 AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 139000.0000, 0, 12, N'vi', 1, 0, 0, N'Clean-Dew-Acerola-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (145, N'Clean Dew Bluebery Foam Cleanser', NULL, N'91', N'<p>D&agrave;nh cho da kh&ocirc; v&agrave; xỉn m&agrave;u&nbsp;</p>

<p>L&agrave;m sạch l&agrave;n da một c&aacute;ch mềm mại , gi&uacute;p l&agrave;n da th&ocirc; r&aacute;p trở n&ecirc;n mềm mại v&agrave; mịn m&agrave;ng</p>

<p><strong>TP</strong>:&nbsp;Tinh chất qủa việt quất</p>

<p><strong>HDSD</strong>&nbsp;:&nbsp;Buối s&aacute;ng cho cho sản phẩm khoảng 1cm, buổi tối : 2 cm đ&aacute;nh b&ocirc;ng bọt v&agrave; nhẹ nh&agrave;ng rửa tr&ecirc;n da mặt, rửa sạch bằng nước. D&ugrave;ng 2 lần s&aacute;ng v&agrave; tối</p>

<p><strong>TL</strong>&nbsp;:&nbsp;180ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2093_img_0575-1.jpg', N'/images/photoproduct/2016/6/sc_full_2093_img_0575-1.jpg', CAST(0x0000A635010EC199 AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 139000.0000, 0, 13, N'vi', 1, 0, 0, N'Clean-Dew-Bluebery-Foam-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (146, N'Eggpore Deep Cleansing Foam', N'CnJgua', N'91', N'<p>Sữa rửa mặt tẩy tế b&agrave;o chết d&agrave;nh cho da dầu hiệu quả se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng, điều tiết b&atilde; nhờn đồng thời loại bỏ chất bẩn v&agrave; lớp sừng chết, cho l&agrave;n da mềm mượt, sạch mịn.</p>

<p><strong>Th&agrave;nh phần</strong>:&nbsp;&nbsp;chiết xuất từ trứng&nbsp;</p>

<p><strong>Hướng dẫn sử dụng</strong>:&nbsp;Sau khi tẩy trang, lấy 1 lượng vừa đủ tạo bọt v&agrave; thoa đều khắp mặt, rồi rửa sạch lại với nước. Sử dụng 2 lần/ ng&agrave;y v&agrave;o buổi s&aacute;ng v&agrave; tối.</p>

<p><strong>Tịnh lượng:&nbsp;</strong>150gram</p>

<p><strong>Hạn sử dụng</strong>:&nbsp;3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2099_srm-trung3.jpg', N'/images/photoproduct/2016/6/sc_full_2099_srm-trung3.jpg', CAST(0x0000A63501105613 AS DateTime), 1, N'150g', N'', N'Hàn Quốc', 0.0000, 254000.0000, 0, 14, N'vi', 1, 0, 0, N'Eggpore-Deep-Cleansing-Foam', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (147, N'Magic Food Golden Mushroom Sleeping Pack', N'jLgRdG', N'92', N'<p>Mặt nạ ngủ chiết xuất từ v&agrave;ng nguy&ecirc;n chất v&agrave; nấm shiitake gi&uacute;p cung cấp h&agrave;m lượng dinh dưỡng dồi d&agrave;o cho da ngay cả trong l&uacute;c ngủ . Chức năng chống nhăn v&agrave; cải thiện t&iacute;nh đ&agrave;n hồi tr&ecirc;n da mạnh mẽ</p>

<p>HDSD: Sau khi sử dụng đầy đủ c&aacute;c bước chăm s&oacute;c da , lấy 1 lượng sản phẩm vừa đủ thoa đều l&ecirc;n da, nhẹ nh&agrave;ng massage để sản phẩm thẩm thấu v&agrave;o da</p>

<p>TL: 70 ml</p>

<p>HSD: 3 năm sau ng&agrave;y sx</p>

<p>NSX: H&agrave;n Quốc</p>

<p>Lưu &yacute;: Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2110_tony-moly-magic-food-mushroom-gold-sleeping-mask.jpg', N'/images/photoproduct/2016/6/sc_full_2110_tony-moly-magic-food-mushroom-gold-sleeping-mask.jpg', CAST(0x0000A6350113758F AS DateTime), 1, N'70ml', N'', N'Hàn Quốc', 0.0000, 417000.0000, 0, 1, N'vi', 1, 0, 0, N'Magic-Food-Golden-Mushroom-Sleeping-Pack', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (148, N'Magic Food Banana Sleeping Pack', N'SNqIbY', N'92', N'<p>Mặt nạ ngủ tập trung bổ sung độ ẩm v&agrave; dưỡng chất. Chuối v&agrave; hoa c&uacute;c li&ecirc;n kết đem lại độ mềm mướt như sữa cho l&agrave;n da</p>

<p><strong>HDSD</strong>: Thoa 1 lượng vừa đủ l&ecirc;n to&agrave;n khu&ocirc;n mặt, để qua đ&ecirc;m rồi rửa lại v&agrave;o s&aacute;ng h&ocirc;m sau</p>

<p><strong>TL</strong>: 85 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2112_magic-foot-banana-sleeping-pack.jpg', N'/images/photoproduct/2016/6/sc_full_2112_magic-foot-banana-sleeping-pack.jpg', CAST(0x0000A6350113D324 AS DateTime), 1, N'85ml', N'', N'Hàn Quốc', 0.0000, 410000.0000, 0, 2, N'vi', 1, 0, 0, N'Magic-Food-Banana-Sleeping-Pack', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (149, N'Aquaporine Water Bomb Sleeping Pack', N'FPHarq', N'92', N'<p>T&aacute;i tạo v&agrave; hồi sinh l&agrave;n da</p>

<p>Mặt nạ ngủ bổ sung độ ẩm cho l&agrave;n da kh&ocirc; v&agrave; thiếu nước, giải quyết vấn đề về l&agrave;n da sần s&ugrave;i, th&ocirc; r&aacute;p, kh&ocirc;ng căng mịn.</p>

<p><strong>TP</strong>: nước liễu, tảo xoắn, tảo biển..</p>

<p><strong>HDSD:</strong>&nbsp;Thoa 1 lượng vừa đủ l&ecirc;n to&agrave;n khu&ocirc;n mặt v&agrave; massage trong khoảng 2-3 ph&uacute;t, đắp qua đ&ecirc;m rồi rửa lại v&agrave;o s&aacute;ng h&ocirc;m sau.</p>

<p><strong>TL:</strong>&nbsp;100 ml</p>

<p><strong>HSD:&nbsp;</strong>3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2114_aquaporine-water-bomb-sleeping-pack.jpg', N'/images/photoproduct/2016/6/sc_full_2114_aquaporine-water-bomb-sleeping-pack.jpg', CAST(0x0000A63501145226 AS DateTime), 1, N'100ml', N'', N'Hàn Quốc', 0.0000, 395000.0000, 0, 3, N'vi', 1, 0, 0, N'Aquaporine-Water-Bomb-Sleeping-Pack', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (150, N'Timeless Ferment Snail Cleansing Gel', N'EhLgha', N'93', N'<p>Sản phẩm tẩy trang dạng dầu gel chiết xuất từ nhớt ốc s&ecirc;n l&ecirc;n men gi&uacute;p lấy đi lớp trang điểm v&agrave; bụi bẩn, đem lại l&agrave;n da sạch mịn m&agrave; vẫn duy tr&igrave; độ ẩm, bổ sung nguồn dưỡng chất phong ph&uacute; gi&uacute;p phục hồi chức năng của da. &nbsp; - &nbsp; Dạng gel mềm mại nhẹ nh&agrave;ng lấy đi bụi bẩn m&agrave; kh&ocirc;ng g&acirc;y cảm gi&aacute;c kh&oacute; chịu.&nbsp;Đặc biệt chiết xuất nhớt ốc s&ecirc;n len men - l&agrave; th&agrave;nh phần l&agrave;nh t&iacute;nh, c&oacute; khả năng l&agrave;m sạch s&acirc;u m&agrave; kh&ocirc;ng g&acirc;y tổn thương da.</p>

<p><strong>TP</strong>: chiết xuất nhớt ốc s&ecirc;n l&ecirc;n men<br />
<strong>HDSD</strong>: Lau kh&ocirc; nước tr&ecirc;n mặt, lấy 1 lượng vừa đủ, massage nhẹ nh&agrave;ng l&ecirc;n to&agrave;n khu&ocirc;n mặt rồi rửa lại bằng nước sạch.<br />
<strong>TL</strong>: 200g&nbsp;</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2116_timeless-ferment-snail-cleansing-gel2.jpg', N'/images/photoproduct/2016/6/sc_full_2116_timeless-ferment-snail-cleansing-gel2.jpg', CAST(0x0000A6350115167C AS DateTime), 1, N'200g', N'', N'Hàn Quốc', 0.0000, 596000.0000, 0, 1, N'vi', 1, 0, 0, N'Timeless-Ferment-Snail-Cleansing-Gel', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (151, N'Blast Perfect Lip & Eye Remover', N'kEyNX4', N'93', N'<p>Sản phẩm tẩy trang chuy&ecirc;n dụng gi&uacute;p l&agrave;m sạch s&acirc;u lớp trang điểm ở mắt v&agrave; m&ocirc;i.</p>

<p>-&nbsp;<strong>TP</strong>:&nbsp;chiết xuất dầu jojoba, olive, lavender, quả bơ...</p>

<p>-&nbsp;<strong>HDSD</strong>:&nbsp;lấy 1 lượng vừa đủ ra b&ocirc;ng tẩy trang rồi nhẹ nh&agrave;ng lau sạch</p>

<p>-&nbsp;<strong>TL</strong>:&nbsp;100 ml</p>

<p>-&nbsp;<strong>HSD</strong>:&nbsp;3 năm sau ng&agrave;y sx</p>

<p>-&nbsp;Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2118_blast--perfect-lip-eye-remover.jpg', N'/images/photoproduct/2016/6/sc_full_2118_blast--perfect-lip-eye-remover.jpg', CAST(0x0000A63501157AD8 AS DateTime), 1, N'100ml', N'', N'Hàn Quốc', 0.0000, 246000.0000, 0, 2, N'vi', 1, 0, 0, N'Blast-Perfect-Lip--Eye-Remover', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (152, N'Clean Dew Apple Mint Cleansing Oil', N'lV8CWb', N'93', N'<p>Dầu tẩy trang với chiết xuất từ t&aacute;o, bạc h&agrave; v&agrave; c&aacute;c th&agrave;nh phần từ thực vật c&oacute; t&aacute;c dụng l&agrave;m sạch s&acirc;u, tạo cảm gi&aacute;c nhẹ nh&agrave;ng, thư gi&atilde;n khi sử dụng. C&oacute; thể l&agrave;m sạch mọi lớp trang điểm bao gồm kem nền, kem BB, chuốt mi, eyeliner&hellip;</p>

<p><strong>TP</strong>: chiết xuất hạt chanh, hạt dẻ, đậu tương....</p>

<p><strong>HDSD</strong>: Lấy 1 lượng vừa đủ ra b&ocirc;ng tẩy trang rồinhẹ nh&agrave;ng lau sạch lớp trang điểm.</p>

<p><strong>TL</strong>: 155ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2122_clean-dew-apple-mint-cleansing-oil2.jpg', N'/images/photoproduct/2016/6/sc_full_2122_clean-dew-apple-mint-cleansing-oil2.jpg', CAST(0x0000A63501168CC5 AS DateTime), 1, N'155ml', N'', N'Hàn Quốc', 0.0000, 333000.0000, 0, 3, N'vi', 1, 0, 0, N'Clean-Dew-Apple-Mint-Cleansing-Oil', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (153, N'Blast Fresh Lip & Eye Remover', N'8rNjbX', N'93', N'<p>Sản phẩm tẩy trang dạng nước gi&uacute;p rửa sạch nhẹ nh&agrave;ng lớp trang điểm ở mắt v&agrave; m&ocirc;i</p>

<p>-&nbsp;<strong>TP</strong>:&nbsp;chiết xuất dầu jojoba, olive, lavender, quả bơ...</p>

<p>-&nbsp;<strong>HDSD</strong>:&nbsp;lấy 1 lượng vừa đủ ra b&ocirc;ng tẩy trang rồi nhẹ nh&agrave;ng lau sạch</p>

<p>-&nbsp;<strong>TL</strong>:&nbsp;100 ml</p>

<p>-&nbsp;<strong>HSD</strong>:&nbsp;3 năm sau ng&agrave;y sx</p>

<p>-&nbsp;Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2124_fresh-lip-eye-remover.jpg', N'/images/photoproduct/2016/6/sc_full_2124_fresh-lip-eye-remover.jpg', CAST(0x0000A635011727BF AS DateTime), 1, N'100ml', N'', N'Hàn Quốc', 0.0000, 246000.0000, 0, 4, N'vi', 1, 0, 0, N'Blast-Fresh-Lip--Eye-Remover', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (154, N'Clean Dew Avocado Cleansing Cream', N'7BNgnG', N'93', N'<p>Kem tẩy trang chiết xuất từ quả bơ - th&agrave;nh phần chứa nhiều dưỡng chất, gi&uacute;p l&agrave;m sạch mọi bụi bẩn v&agrave; lớp trang điểm s&acirc;u b&ecirc;n trong da, đồng thời cung cấp năng lượng cho l&agrave;n da khỏe v&agrave; đẹp, sạch mịn m&agrave;ng. Sản phẩm kh&ocirc;ng chứa c&aacute;c chất c&oacute; hại cho da n&ecirc;n đặc biệt ph&ugrave; hợp với l&agrave;n da nhạy cảm.</p>

<p><strong>TP</strong>:&nbsp;chiết xuất từ marin collagen&nbsp;</p>

<p><strong>DL</strong>: 180 ml</p>

<p><strong>HDSD</strong>:&nbsp;Lấy 1 lượng vừa đủ thoa đều l&ecirc;n mặt, nhẹ nh&agrave;ng massage rồi d&ugrave;ng b&ocirc;ng hoặc giấy mềm lau sạch. Rửa lại bằng sữa sửa mặt.&nbsp;<strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/6/sc_small_2126_clean-dew-avocado-cleansing-cream3.jpg', N'/images/photoproduct/2016/6/sc_full_2126_clean-dew-avocado-cleansing-cream3.jpg', CAST(0x0000A6350117A4C9 AS DateTime), 1, N'180ml', N'', N'Hàn Quốc', 0.0000, 313000.0000, 0, 5, N'vi', 1, 0, 0, N'Clean-Dew-Avocado-Cleansing-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (155, N'Body With Body Lotion', N'OevXiK', N'98', N'<p>Sữa dưỡng thể tổng hợp những dưỡng chất từ dầu dừa gi&uacute;p đem lại l&agrave;n da mềm mại, mịn m&agrave;ng ngay tức th&igrave;. Nhẹ nh&agrave;ng chăm s&oacute;c cho da, c&acirc;n bằng lượng dầu-nước, duy tr&igrave; l&agrave;n da khỏe khoắn. Sản phẩm mang m&ugrave;i hương oliu thanh m&aacute;t.</p>

<p><strong>HDSD</strong>: sau khi tắm lấy 1 lượng vừa đủ thoa đều to&agrave;n th&acirc;n v&agrave; nhẹ nh&agrave;ng massage cho dưỡng chất thẩm thấu v&agrave;o da.</p>

<p><strong>TL</strong>: 300 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2052_body-with-body-lotion.jpg', N'/images/photoproduct/2016/7/sc_full_2052_body-with-body-lotion.jpg', CAST(0x0000A6360099C7A9 AS DateTime), 1, N'300ml', N'', N'Hàn Quốc', 0.0000, 265000.0000, 0, 2, N'vi', 1, 0, 0, N'Body-With-Body-Lotion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (156, N'Pure Eco Bamboo Cool Water Soothing Gel', N'pJn6SS', N'98', N'<p>Dưỡng da d&agrave;nh cho mặt v&agrave; cơ thể</p>

<p><strong>C&ocirc;ng dụng&nbsp;</strong>: Gel dưỡng dịu nhẹ cho da mặt v&agrave; cơ thể chiết xuất 99% nước tre từ DamYang ngay lập tức thư gi&atilde;n v&agrave; dưỡng ẩm da bởi khả năng l&agrave;m m&aacute;t .</p>

<p><strong>HDSD</strong>: Lấy 1 lượng vừa đủ thoa đều khắp mặt v&agrave; cơ thể rồi nhẹ nh&agrave;ng massage cho dưỡng chất thấm đều v&agrave;o s&acirc;u b&ecirc;n trong.</p>

<p><strong>TL</strong>: 300 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2054_pure-eco-bamboo-cool-water-soothing-gel.jpg', N'/images/photoproduct/2016/7/sc_full_2054_pure-eco-bamboo-cool-water-soothing-gel.jpg', CAST(0x0000A636009A4C56 AS DateTime), 1, N'300ml', N'', N'Hàn Quốc', 0.0000, 230000.0000, 0, 2, N'vi', 1, 0, 0, N'Pure-Eco-Bamboo-Cool-Water-Soothing-Gel', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (157, N'Bubble Tree Milk Soft Body Lotion', N'RMoCNn', N'98', N'<p>Dưỡng thể chiết xuất từ sữa</p>

<p><strong>C&ocirc;ng dụng</strong>: Sữa dưỡng cho to&agrave;n th&acirc;n chiết xuất từ sữa đem lại l&agrave;n da trắng s&aacute;ng, mịn m&agrave;ng</p>

<p><strong>HDSD</strong>: Sau khi tắm, lau kh&ocirc; người, d&ugrave;ng 1 lượng sản phẩm vừa đủ massage đều to&agrave;n th&acirc;n để sản phẩm thẩm thấu v&agrave; nu&ocirc;i dưỡng l&agrave;n da</p>

<p><strong>TL:&nbsp;</strong>300 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2058_bubble-tree-milk-soft-body-lotionjpg.jpg', N'/images/photoproduct/2016/7/sc_full_2058_bubble-tree-milk-soft-body-lotionjpg.jpg', CAST(0x0000A636009B4F2E AS DateTime), 1, N'300ml', N'', N'Hàn Quốc', 0.0000, 267000.0000, 0, 3, N'vi', 1, 0, 0, N'Bubble-Tree-Milk-Soft-Body-Lotion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (158, N'Floria Essence Body Mist', N'ajSh6J', N'98', N'<p>Xịt dưỡng thể chứa th&agrave;nh phần hoa di&ecirc;n vỹ xanh tạo cảm gi&aacute;c thanh m&aacute;t dịu nhẹ. Với khả năng thẩm thấu nhanh, bổ sung lượng ẩm lớn, sản phẩm gi&uacute;p đem lại l&agrave;n da mềm mướt m&agrave; kh&ocirc;ng g&acirc;y bết d&iacute;nh</p>

<p><strong>HDSD</strong>: Sau khi tắm,lau kh&ocirc; cơ thể, lắc đều rồi xịt nhẹ l&ecirc;n to&agrave;n th&acirc;n</p>

<p><strong>TL</strong>: 150 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2060_floria-essence-body-mist.jpg', N'/images/photoproduct/2016/7/sc_full_2060_floria-essence-body-mist.jpg', CAST(0x0000A636009BD149 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 335000.0000, 0, 4, N'vi', 1, 0, 0, N'Floria-Essence-Body-Mist', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (159, N'Blooming Days Shower Cologne', N'V9QjEe', N'98', N'<p><strong>Romantic Garden</strong></p>

<p>Nước hoa sau tắm tạo cảm gi&aacute;c ngọt ng&agrave;o v&agrave; đ&aacute;ng y&ecirc;u mỗi ng&agrave;y.</p>

<p><strong>Fresh Breeze</strong></p>

<p>Nước hoa sau tắm tạo cảm gi&aacute;c m&aacute;t mẻ v&agrave; thoải m&aacute;i mỗi ng&agrave;y</p>

<p><strong>HDSD</strong>: Sau khi tắm,lau kh&ocirc; cơ thể, lắc đều rồi xịt nhẹ l&ecirc;n to&agrave;n th&acirc;n</p>

<p><strong>TL</strong>: 150 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2069_blooming-days-shower-cologne.jpg', N'/images/photoproduct/2016/7/sc_full_2069_blooming-days-shower-cologne.jpg', CAST(0x0000A636009E5546 AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 0.0000, 0, 5, N'vi', 1, 0, 0, N'Blooming-Days-Shower-Cologne', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (160, N'Blooming Days Perfum Body Lotion ', N'M68bvl', N'98', N'<p><strong>Fresh Breeze</strong></p>

<p>Sữa dưỡng thể với thiết kế sang trọng, m&ugrave;i thơm sang trọng đặc trị l&agrave;m trắng v&agrave; cải thiện nếp nhăn, đặc biệt với l&agrave;n da to&agrave;n th&acirc;n thường kh&ocirc; v&agrave; mất nước dẫn tới hiện tượng da đen sạm v&agrave; th&ocirc; r&aacute;p, đem lại l&agrave;n da mướt v&agrave; mịn m&agrave;ng, mềm mại.</p>

<p><strong>Romantic Garden</strong></p>

<p>Sữa dưỡng thể với thiết kế sang trọng, m&ugrave;i thơm ngọt ng&agrave;o v&agrave; đ&aacute;ng y&ecirc;u, đặc trị l&agrave;m trắng v&agrave; cải thiệp nếp nhăn, đặc biệt với l&agrave;n da to&agrave;n th&acirc;n thường kh&ocirc; v&agrave; mất nước dẫn tới hiện tượng da đen sạm v&agrave; th&ocirc; r&aacute;p, đem lại l&agrave;n da mướt v&agrave; mịn m&agrave;ng, mềm mại.</p>

<p><strong>HDSD</strong>:&nbsp;Lau kh&ocirc; người sau khi tắm rồi thoa 1 lượng vừa đủ l&ecirc;n khắp to&agrave;n th&acirc;n.</p>

<p><strong>TL</strong>:&nbsp;290 ml</p>

<p><strong>HSD</strong>:&nbsp;3 năm sau ng&agrave;y sx&nbsp;</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2042_blooming-days-perfum-body-lotion.jpg', N'/images/photoproduct/2016/7/sc_full_2042_blooming-days-perfum-body-lotion.jpg', CAST(0x0000A63600B78F38 AS DateTime), 1, N'290ml', N'', N'Hàn Quốc', 0.0000, 448000.0000, 0, 6, N'vi', 1, 0, 0, N'Blooming-Days-Perfum-Body-Lotion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (161, N'Floria Firming Body Oil', N'ujUjsh', N'98', N'<p>Dầu dưỡng thể tăng cường khả năng đ&agrave;n hồi tức th&igrave;, cải thiện từng thớ da to&agrave;n th&acirc;n bị kh&ocirc; v&agrave; nứt nẻ, gi&uacute;p l&agrave;n da to&agrave;n th&acirc;n mềm mại như c&aacute;nh hoa</p>

<p><strong>TP</strong>: chiết xuất từ hoa pink mallow&nbsp;</p>

<p><strong>DL</strong>: 150ml</p>

<p><strong>HDSD</strong>: D&ugrave;ng khi thấy da kh&ocirc; hoặc sau khi tắm&nbsp;</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2044_1383630856_l1.jpg', N'/images/photoproduct/2016/7/sc_full_2044_1383630856_l1.jpg', CAST(0x0000A63600B8024F AS DateTime), 1, N'150ml', N'', N'Hàn Quốc', 0.0000, 332000.0000, 0, 7, N'vi', 1, 0, 0, N'Floria-Firming-Body-Oil', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (162, N'Pure Eco Aloe Gel', N'479er9', N'98', N'<p>Gel dưỡng da với th&agrave;nh phần 92% l&ocirc; hội tự nhi&ecirc;n hiệu quả l&agrave;m m&aacute;t da, cung cấp nước cho da. L&ocirc; hội c&oacute; t&aacute;c dụng l&agrave;m giảm sự l&atilde;o ho&aacute; của da, tạo độ ẩm tr&ecirc;n da, tăng khả năng đ&agrave;n hồi, ngăn ngừa nếp nhăn. Đồng thời mang chức năng b&igrave;nh ổn cho l&agrave;n da chịu nhiều k&iacute;ch ứng v&agrave; tổn thương.&nbsp;</p>

<p><strong>Th&agrave;nh phần</strong>: chiết xuất l&ocirc; hội, m&iacute;a, l&ecirc;n men đậu tương...</p>

<p><strong>Hướng dẫn sử dụng</strong>: Lấy 1 lượng vừa đủ thoa đều l&ecirc;n v&ugrave;ng da chịu nhiều t&aacute;c động b&ecirc;n ngo&agrave;i. Đặc biệt ph&ugrave; hợp kh&ocirc;i phục v&ugrave;ng da tổn thương do ch&aacute;y nắng</p>

<p><strong>Tịnh lượng</strong>: 300 ml</p>

<p><strong>Hạn sử dụng</strong>: 3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2047_aloegel.jpg', N'/images/photoproduct/2016/7/sc_full_2047_aloegel.jpg', CAST(0x0000A63600B894D1 AS DateTime), 1, N'300ml', N'', N'Hàn Quốc', 0.0000, 155000.0000, 0, 8, N'vi', 1, 0, 0, N'Pure-Eco-Aloe-Gel', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (163, N'Body With Body Cleanser', N'07NomJ', N'97', N'<p>Sữa tắm tổng hợp những dưỡng chất từ dầu dừa hiệu quả l&agrave;m sạch s&acirc;u, chăm s&oacute;c dịu nhẹ với lượng bọt mềm mại, phong ph&uacute;. Sản phẩm mang m&ugrave;i hương của dầu oliu thanh m&aacute;t.</p>

<p><strong>HDSD</strong>: Cho sữa tắm v&agrave;o b&ocirc;ng tắm, thoa đều to&agrave;n th&acirc;n rồi tắm lại bằng nước sạch.</p>

<p><strong>TL</strong>: 300 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2050_body-with-body-cleanser.jpg', N'/images/photoproduct/2016/7/sc_full_2050_body-with-body-cleanser.jpg', CAST(0x0000A63600B98585 AS DateTime), 1, N'300ml', N'', N'Hàn Quốc', 0.0000, 265000.0000, 0, 1, N'vi', 1, 0, 0, N'Body-With-Body-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (164, N'Bubble Tree Milk Soft Body Cleanser', N'iriRcH', N'97', N'<p>Sữa tắm chiết xuất từ sữa</p>

<p><strong>C&ocirc;ng dụng</strong>: Sữa tắm chiết xuất từ sữa đem lại nguồn dưỡng chất phong ph&uacute; cho da</p>

<p><strong>HDSD</strong>: Lấy 1 lượng sản phẩm vừa đủ , tạo bọt, massage to&agrave;n th&acirc;n v&agrave; l&agrave;m sạch lại với nước</p>

<p><strong>TL</strong>: 300 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2052_bubble-tree-milk-soft-body-cleanser.jpg', N'/images/photoproduct/2016/7/sc_full_2052_bubble-tree-milk-soft-body-cleanser.jpg', CAST(0x0000A63600B9F49A AS DateTime), 1, N'300ml', N'', N'Hàn Quốc', 0.0000, 267000.0000, 0, 2, N'vi', 1, 0, 0, N'Bubble-Tree-Milk-Soft-Body-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (165, N'Blooming Days Perfume Body Cleanser', N'L5cVTa', N'97', N'<p><strong>Romantic Garden</strong></p>

<p>Sữa tắm bổ sung độ ẩm với lượng bọt phong ph&uacute; v&agrave; m&ugrave;i hương ngọt ng&agrave;o, đ&aacute;ng y&ecirc;u đem lại cảm gi&aacute;c dễ chịu khi sử dụng</p>

<p><strong>Fresh Breeze</strong></p>

<p>Sữa tắm bổ sung độ ẩm với lượng bọt phong ph&uacute; đem lại cảm gi&aacute;c sạch, m&aacute;t sau khi sử dụng</p>

<p><strong>HDSD</strong>: Lấy 1 lượng vừa đủ ra b&ocirc;ng tắm, tạo bọt với nước rồi massage to&agrave;n th&acirc;n, sau đ&oacute; tắm lại bằng nước sạch</p>

<p><strong>TL</strong>: 300 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2053_blooming-days-perfume-body-cleanser.jpg', N'/images/photoproduct/2016/7/sc_full_2053_blooming-days-perfume-body-cleanser.jpg', CAST(0x0000A63600BA6072 AS DateTime), 1, N'300ml', N'', N'Hàn Quốc', 0.0000, 448000.0000, 0, 3, N'vi', 1, 0, 0, N'Blooming-Days-Perfume-Body-Cleanser', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (166, N'Naturath Green Food Moisture Hand Cream', N'QecqzD', N'99', N'<p><strong>Natural Green Hand Cream Avocado</strong></p>

<p><strong>C&ocirc;ng dụng</strong>&nbsp;: Kem dưỡng da tay chiết xuất từ bơ cung cấp h&agrave;m lượng dưỡng chất dồi d&agrave;o cho da.</p>

<p><strong>Natural Green Hand Cream Shea Butter</strong></p>

<p><strong>C&ocirc;ng dụng</strong>&nbsp;: Kem dưỡng da tay chiết xuất Bơ Hạt Mỡ gi&uacute;p dưỡng ẩm v&agrave; l&agrave;m săn chắc da</p>

<p><strong>HDSD:</strong>&nbsp;Sau khi rửa tay hoặc khi tay bị kh&ocirc; b&ocirc;i 1 lượng sản phẩm l&ecirc;n tay, xoa đều để tăng khả năng hấp thụ</p>

<p><strong>TL:</strong>&nbsp;30 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2057_naturath-green-food-moisture-hand-cream.jpg', N'/images/photoproduct/2016/7/sc_full_2057_naturath-green-food-moisture-hand-cream.jpg', CAST(0x0000A63600BB6C6F AS DateTime), 1, N'30ml', N'', N'Hàn Quốc', 0.0000, 130000.0000, 0, 1, N'vi', 1, 0, 0, N'Naturath-Green-Food-Moisture-Hand-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (167, N'Naturath Green Flower Moisture Hand Cream', N'Rjde69', N'99', N'<p>Natural Green Hand Cream Acacia</p>

<p>Kem dưỡng da tay tăng độ đ&agrave;n hồi</p>

<p><strong>C&ocirc;ng dụng:&nbsp;</strong>Kem dưỡng da tay chiết xuất thực vật &ndash; c&acirc;y Keo Acacia gi&uacute;p nu&ocirc;i dưỡng v&agrave; tăng độ đ&agrave;n hồi cho da&nbsp;</p>

<p><strong>HDSD:&nbsp;</strong>Sau khi rửa tay hoặc khi tay bị kh&ocirc; b&ocirc;i 1 lượng sản phẩm l&ecirc;n tay, xoa đều để tăng khả năng hấp thụ</p>

<p><strong>TL:</strong>&nbsp;30 ml</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2060_naturath-green-flower-moisture-hand-cream.jpg', N'/images/photoproduct/2016/7/sc_full_2060_naturath-green-flower-moisture-hand-cream.jpg', CAST(0x0000A63600BC66AB AS DateTime), 1, N'30ml', N'', N'Hàn Quốc', 0.0000, 130000.0000, 0, 2, N'vi', 1, 0, 0, N'Naturath-Green-Flower-Moisture-Hand-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (168, N'Magic Food Banana Hand Milk', N'1QGFeV', N'99', N'<p>Kem tay dạng sữa, chứa th&agrave;nh phần chuối v&agrave; chất b&eacute;o từ sữa bổ sung độ ẩm v&agrave; đem lại độ mịn cho l&agrave;n da tay</p>

<p><strong>HDSD</strong>: Rửa tay sạch, lau kh&ocirc;, thoa 1 lượng vừa đủ rồi nhẹ nh&agrave;ng massage</p>

<p><strong>TL</strong>: 45 ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2066_magic-foot-banana-hand-milk.jpg', N'/images/photoproduct/2016/7/sc_full_2066_magic-foot-banana-hand-milk.jpg', CAST(0x0000A63600BDFC8B AS DateTime), 1, N'45ml', N'', N'Hàn Quốc', 0.0000, 248000.0000, 0, 3, N'vi', 1, 0, 0, N'Magic-Food-Banana-Hand-Milk', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (169, N'I’m Real Milk Moituring Nutritive Hand Lotion', N'6AuR5p', N'99', N'<p>Sữa dưỡng da tay từ sữa tươi &ndash; d&agrave;nh cho da kh&ocirc;</p>

<p>- Sữa dưỡng tay chiết xuất từ sữa tươi, loại bỏ lớp sừng chết, gi&uacute;p da tay mềm mại, kh&ocirc;ng kh&ocirc; nẻ.</p>

<p>-&nbsp;<strong>TP</strong>: protein dạng sữa, dầu jojoba, dầu oliu</p>

<p>-&nbsp;<strong>HDSD</strong>: Rửa tay sạch rồi thoa một lượng vừa đủ l&ecirc;n da tay v&agrave; vuốt nhẹ (d&ugrave;ng h&agrave;ng ng&agrave;y)</p>

<p>-&nbsp;<strong>TL</strong>: 250ml</p>

<p>-&nbsp;<strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p>- Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2072_im-real-milk.jpg', N'/images/photoproduct/2016/7/sc_full_2072_im-real-milk.jpg', CAST(0x0000A63600BFA95C AS DateTime), 1, N'250ml', N'', N'Hàn Quốc', 0.0000, 383000.0000, 0, 4, N'vi', 1, 0, 0, N'I’m-Real-Milk-Moituring-Nutritive-Hand-Lotion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (170, N'Panda’s Dream White Hand cream', N'Id2nXu', N'99', N'<p>Kem dưỡng tay đặc trị l&agrave;m trắng, đồng thời bổ sung độ ẩm, gi&uacute;p những l&agrave;n da tay th&ocirc; r&aacute;p, đen sạm trở n&ecirc;n trắng s&aacute;ng, mượt m&agrave; hơn.&nbsp;&nbsp;</p>

<p><strong>TP</strong>: chiết xuất nước tre, măng...</p>

<p><strong>HDSD</strong>: Thoa 1 lượng vừa đủ l&ecirc;n v&ugrave;ng da tay v&agrave; vuốt nhẹ.</p>

<p><strong>TL</strong>: 30g</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2074_phomax_4397-1.jpg', N'/images/photoproduct/2016/7/sc_full_2074_phomax_4397-1.jpg', CAST(0x0000A63600C004A7 AS DateTime), 1, N'30g', N'', N'Hàn Quốc', 0.0000, 279000.0000, 0, 5, N'vi', 1, 0, 0, N'Panda’s-Dream-White-Hand-cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (171, N'Red Apple Hand Cream', N'9zGzkD', N'99', N'<p>Kem&nbsp;tay&nbsp;cung cấp độ ẩm, duy tr&igrave; độ đản hồi&nbsp;từ mật ong v&agrave; t&aacute;o đỏ</p>

<p>Kem dưỡng&nbsp;da&nbsp;tay&nbsp;h&agrave;ng&nbsp;ng&agrave;y với chức năng massage&nbsp;tạo&nbsp;độ đ&agrave;n hồi, cho l&agrave;n da&nbsp;tay&nbsp;kh&ocirc;ng c&ograve;n kh&ocirc; v&agrave; th&ocirc; r&aacute;p,</p>

<p>chiết xuất t&aacute;o v&agrave; mật ong cho l&agrave;n da&nbsp;tay&nbsp;khỏe, săn chắc hơn&nbsp;v&agrave; l&aacute;ng mượt.</p>

<p><strong>TP</strong>: chiết xuất t&aacute;o, mật ong, l&aacute; ng&acirc;n hạnh, chiết&nbsp;xuất dầu hạt hướng dương...</p>

<p><strong>HDSD</strong>:&nbsp;rửa&nbsp;tay sạch rồi lấy 1&nbsp;lượng vừa đủ thoa đều khắp mặt, nhẹ nh&agrave;ng massage cho dưỡng chất thẩm</p>

<p>thấu&nbsp;s&acirc;u v&agrave;o da tay.</p>

<p><strong>TL</strong>:&nbsp;30 g</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2075_red-appletox-handcream.jpg', N'/images/photoproduct/2016/7/sc_full_2075_red-appletox-handcream.jpg', CAST(0x0000A63600C08709 AS DateTime), 1, N'30g', N'', N'Hàn Quốc', 0.0000, 230000.0000, 0, 6, N'vi', 1, 0, 0, N'Red-Apple-Hand-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (172, N'Peach Anti-aging Handcream', N'2iFJfZ', N'99', N'<p><strong><em>Th&agrave;nh phần v&agrave; c&ocirc;ng dụng:</em></strong></p>

<p>Kem dưỡng tay ngăn ngừa l&atilde;o h&oacute;a (cải thiện nếp nhăn). Chiết xuất từ quả đ&agrave;o (chứa h&agrave;m lượng lớn Licopen) v&agrave; chiết xuất từ hạt gạo chứa nhiều dưỡng chất gi&uacute;p đem lại l&agrave;n da mềm mại, mịn m&agrave;ng.</p>

<p>Th&agrave;nh phần Adenosine c&oacute; khả năng cải thiện nếp nhăn, tăng khả năng đ&agrave;n hồi cho da.</p>

<p><strong><em>HDSD:&nbsp;</em></strong>Rửa tay sạch, sau khi tay đ&atilde; kh&ocirc;, cho một lượng vừa đủ ra tay v&agrave; thoa đều cho sản phẩm thẩm thấu đều v&agrave;o da.</p>

<p><em><strong>Dung lượng:&nbsp;</strong>30g</em></p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2077_peach-anti-aging-handcream.jpg', N'/images/photoproduct/2016/7/sc_full_2077_peach-anti-aging-handcream.jpg', CAST(0x0000A63600C0E33C AS DateTime), 1, N'30g', N'', N'Hàn Quốc', 0.0000, 185000.0000, 0, 7, N'vi', 1, 0, 0, N'Peach-Anti-aging-Handcream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (173, N'BC-Dation-Plus', N'NYTfSR', N'100', N'<p>Kem trang điểm ho&agrave;n hảo t&ocirc;ng s&aacute;ng 01</p>

<p>Kem trang điểm ho&agrave;n hảo tự nhi&ecirc;n 02</p>

<p><strong>C&ocirc;ng dụng:</strong>&nbsp;Kem trang điểm th&ocirc;ng minh thế hệ mới bao gồm c&aacute;c chức năng của BB cream, CC cream v&agrave; Foundation gi&uacute;p chống nắng, chống nhăn, l&agrave;m trắng, cung cấp độ ẩm nhẹ cho da gi&uacute;p lớp trang điểm b&aacute;m bền ho&agrave;n hảo m&agrave; kh&ocirc;ng hề l&agrave;m kh&ocirc; da.</p>

<p><strong>HDSD:</strong>&nbsp;Sau khi sử dụng c&aacute;c bước dưỡng da ban ng&agrave;y, sử dụng chổi hoặc b&ocirc;ng m&uacute;t t&aacute;n đều kem cho lớp trang điểm l&aacute;ng mịn ho&agrave;n hảo.</p>

<p><strong>TL:</strong>&nbsp;40g</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>

<p><strong>Lưu &yacute; :</strong>&nbsp;Để xa tầm tay của trẻ em .Ngưng sử dụng khi c&oacute; hiện tượng mẩn đỏ.</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2078_bc-dation-plus.jpg', N'/images/photoproduct/2016/7/sc_full_2078_bc-dation-plus.jpg', CAST(0x0000A63600C158F4 AS DateTime), 1, N'40g', N'', N'Hàn Quốc', 0.0000, 720000.0000, 0, 2, N'vi', 1, 0, 0, N'BC-Dation-Plus', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (174, N'Timeless Ferment Snail BB Cream', N'6QLZWQ', N'100', N'<p>Kem trang điểm ho&agrave;n hảo tự nhi&ecirc;n</p>

<p><strong>C&ocirc;ng dụng</strong>: Kem trang điểm chiết xuất từ nhớt ốc s&ecirc;n l&ecirc;n men với v&agrave;ng đem lại hiệu quả trang điểm ho&agrave;n hảo đồng thời cải thiện c&aacute;c vấn đề l&atilde;o h&oacute;a da v&agrave; l&agrave;m trắng&nbsp;</p>

<p><strong>HDSD</strong>: Sau khi sử dụng c&aacute;c bước dưỡng da ban ng&agrave;y, sử dụng chổi hoặc b&ocirc;ng m&uacute;t t&aacute;n đều kem cho lớp trang điểm l&aacute;ng mịn ho&agrave;n hảo.</p>

<p><strong>TL</strong>: 50ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p><strong>Xuất xứ:</strong>&nbsp;H&agrave;n Quốc</p>

<p><strong>Lưu &yacute;</strong>&nbsp;: Để xa tầm tay của trẻ em .Ngưng sử dụng khi c&oacute; hiện tượng mẩn đỏ.</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2080_timeless-ferment-snail-suncream2--.jpg', N'/images/photoproduct/2016/7/sc_full_2080_timeless-ferment-snail-suncream2--.jpg', CAST(0x0000A63600C1AF1A AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 828000.0000, 0, 2, N'vi', 1, 0, 0, N'Timeless-Ferment-Snail-BB-Cream', NULL, NULL, NULL, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (175, N'Luminous Goddess Aura All Glow BB', N'tZs7Oe', N'100', N'<p>Kem trang điểm b&aacute;m bền l&acirc;u tr&ocirc;i</p>

<p><strong>C&ocirc;ng dụng:</strong>&nbsp;Kem trang điểm với khả năng Hydrat h&oacute;a cao gi&uacute;p l&agrave;n da đủ độ ẩm , chức năng che phủ tốt cho l&agrave;n da đều m&agrave;u v&agrave; che phủ ho&agrave;n hảo.&nbsp;</p>

<p><strong>HDSD:</strong>&nbsp;Sau khi sử dụng c&aacute;c bước dưỡng da ban ng&agrave;y, sử dụng chổi hoặc b&ocirc;ng m&uacute;t t&aacute;n đều kem cho lớp trang điểm l&aacute;ng mịn ho&agrave;n hảo.</p>

<p><strong>TL:</strong>&nbsp;40g</p>

<p><strong>HSD:</strong>&nbsp;3 năm sau ng&agrave;y sx</p>

<p><strong>Lưu &yacute; :</strong>&nbsp;Để xa tầm tay của trẻ em .Ngưng sử dụng khi c&oacute; hiện tượng mẩn đỏ. Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2081_luminous-goddess-aura-all-glow-bb.jpg', N'/images/photoproduct/2016/7/sc_full_2081_luminous-goddess-aura-all-glow-bb.jpg', CAST(0x0000A63600C20A7D AS DateTime), 1, N'40g', N'', N'Hàn Quốc', 0.0000, 610000.0000, 0, 3, N'vi', 1, 0, 0, N'Luminous-Goddess-Aura-All-Glow-BB', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (176, N'Naturalth Goat Milk Pure CC Cream', N'ZBie5C', N'100', N'<p>Kem trang điểm tổng hợp: l&agrave;m trắng+cải thiện nếp nhăn+ngăn ngừa tia tử ngoại. Sản phẩm chứa 30% h&agrave;m lượng sữa d&ecirc; từ New Zealand v&agrave; 50% độ ẩm c&oacute; khả năng dưỡng da gi&uacute;p cải thiện l&agrave;n da, tạo n&ecirc;n lớp trang điểm tự nhi&ecirc;n, duy tr&igrave; l&agrave;n da l&aacute;ng b&oacute;ng, khỏe mạnh từ b&ecirc;n trong.</p>

<p><strong>HDSD</strong>: Sau khi d&ugrave;ng c&aacute;c sản phẩm dưỡng da cơ bản, lấy 1 lượng vừa đủ CC Cream (khoảng 1 hạt đậu), thoa theo thứ tự g&ograve; m&aacute; &ndash; tr&aacute;n &ndash; mũi - cằm. Nếu muốn che phủ tốt hơn c&oacute; thể thoa th&ecirc;m 1 lần để tăng cường hiệu quả</p>

<p><strong>TL</strong>: 40g</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p><strong>NSX</strong>: H&agrave;n Quốc</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2083_naturalth-goat-milk-pure-cc-cream.jpg', N'/images/photoproduct/2016/7/sc_full_2083_naturalth-goat-milk-pure-cc-cream.jpg', CAST(0x0000A63600C284FA AS DateTime), 1, N'40g', N'', N'Hàn Quốc', 0.0000, 765000.0000, 0, 4, N'vi', 1, 0, 0, N'Naturalth-Goat-Milk-Pure-CC-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (177, N'Tony Lab AC Control BB Cream', N'P9NtXC', N'100', N'<p>Kem trang điểm tổng hợp d&agrave;nh cho da dầu mụn</p>

<p>Kem 3 trong 1 đặc biệt hiệu quả với l&agrave;n da mụn, l&agrave;n da yếu, gi&uacute;p giảm thiểu k&iacute;ch ứng, che đi vết mụn v&agrave; những vết th&acirc;m do mụn để lại, cho l&agrave;n da khỏe v&agrave; sạch mịn.</p>

<p><strong>TP:</strong>&nbsp;Tinh chất l&aacute; th&ocirc;ng v&agrave;ng, l&aacute; x&ocirc; thơm, rau sam ...</p>

<p><strong>HDSD:</strong>&nbsp;Lấy 1 lượng vừa đủ rồi d&ugrave;ng b&ocirc;ng m&uacute;t t&aacute;n ngắn v&agrave; nhanh tay theo chiều cấu tạo da.</p>

<p><strong>TL:</strong>&nbsp;35 ml</p>

<p><strong>HSD:&nbsp;</strong>3 năm sau ng&agrave;y sx</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2059_ac-control-bb2.jpg', N'/images/photoproduct/2016/7/sc_full_2059_ac-control-bb2.jpg', CAST(0x0000A63600DC61FB AS DateTime), 1, N'35ml', N'', N'Hàn Quốc', 0.0000, 409000.0000, 0, 5, N'vi', 1, 0, 0, N'Tony-Lab-AC-Control-BB-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (178, N'Luminous Live Aura CC Cream', N'qnpND3', N'100', N'<p><strong>Chức năng</strong>: Kem trang điểm th&ocirc;ng minh ngăn ngừa tia tử ngoại-l&agrave;m trắng-cải thiện nếp nhăn-da l&aacute;ng mượt-bổ sung độ ẩm-kem l&oacute;t-kem nền. Gi&uacute;p c&acirc;n bằng lượng dầu-nước trong da, đồng thời bổ sung độ ẩm qua th&agrave;nh phần hyaluronic hiệu quả c&acirc;n bằng sắc tố da, khả năng che phủ tốt che đi vết n&aacute;m, t&agrave;n nhang</p>

<p><strong>Th&agrave;nh phần</strong>: Marin collagen tăng cường độ đ&agrave;n hồi, cho da khỏe, b&oacute;ng l&aacute;ng, tươi s&aacute;ng đầy sức sống.</p>

<p><strong>HDSD</strong>: Sau khi d&ugrave;ng c&aacute;c sản phẩm dưỡng da cơ bản, lấy 1 lượng vừa đủ CC Crean(khoảng 1 hạt đậu), thoa theo thứ tự g&ograve; m&aacute; &ndash; tr&aacute;n &ndash; mũi - cằm. Nếu muốn che phủ tốt hơn c&oacute;thể thoa th&ecirc;m 1 lần để tăng cường hiệu quả</p>

<p><strong>TL</strong>: 50ml</p>

<p><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</p>

<p><strong>NSX</strong>: H&agrave;n Quốc</p>

<p>Bảo quản nơi tho&aacute;ng m&aacute;t</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2061_tonymoly-luminous-live-aura-cc-cream-500x500.jpg', N'/images/photoproduct/2016/7/sc_full_2061_tonymoly-luminous-live-aura-cc-cream-500x500.jpg', CAST(0x0000A63600DCE647 AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 655000.0000, 0, 6, N'vi', 1, 0, 0, N'Luminous-Live-Aura-CC-Cream', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (179, N'BCDation SPF30 PA++', N'5HcEG7', N'100', N'<p align="justify">Kem trang điểm tổng hợp kết hợp khả năng che khuyết của BB Cream v&agrave; sự tự nhi&ecirc;n, mỏng mịn của CC Cream, duy tr&igrave; lớp trang điểm nhẹ nh&agrave;ng, tự nhi&ecirc;n. Đồng thời sản phẩm c&ograve;n chứa đến 50% tinh chất ẩm n&ecirc;n c&oacute; khả năng cung cấp lượng ẩm lớn, duy tr&igrave; l&agrave;n da khỏe, l&aacute;ng mịn, ngăn ngừa hiện tượng l&atilde;o h&oacute;a da.</p>

<p align="justify"><strong>TP</strong>: arbutin, bột ngọc trai...</p>

<p align="justify"><strong>HDSD</strong>: Sau khi d&ugrave;ng Skin v&agrave; Lotion, lấy 1 lượng vừa đủ rồi d&ugrave;ng b&ocirc;ng m&uacute;t t&aacute;n ngắn v&agrave; nhanh tay theo chiều kết cấu da.</p>

<p align="justify"><strong>TL</strong>: 50 ml</p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2062_bc-dation4.jpg', N'/images/photoproduct/2016/7/sc_full_2062_bc-dation4.jpg', CAST(0x0000A63600DD3BE7 AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 720000.0000, 0, 7, N'vi', 1, 0, 0, N'BCDation-SPF30-PA', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (180, N'Luminous Pure Aura CC Cream SPF30 PA++', N'Jz1wmG', N'100', N'<p>D&ograve;ng kem c&oacute; sự kết hợp một chuỗi m&agrave;u sắc trong dạng vi&ecirc;n n&eacute;n (m&agrave;u xanh, đỏ, v&agrave;ng) ph&ugrave; hợp với l&agrave;n da từ b&ecirc;n trong, do đ&oacute; c&oacute; khả năng điều chỉnh m&agrave;u da, l&agrave;m s&aacute;ng da.</p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mỏng mịn hơn nhưng khả năng che khuyết điểm lại vượt trội hơn</p>

<p>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sản phẩm l&agrave; sự kết hợp SKINCARE + MAKEUP</p>

<p><strong>Skincare</strong><em>: Bổ sung độ ẩm</em><em>, tăng cường sự l&aacute;ng mượt,&nbsp; đặc trị l&agrave;m trắng</em><em>, đặc trị ngăn ngừa nếp nhăn</em>,&nbsp;<em>ngăn ngừa tia tử ngoại</em></p>

<p>&nbsp;<strong>Makeup:&nbsp;</strong><em>Điều chỉnh m&agrave;u da</em><em>, khả năng b&aacute;m d&iacute;nh vượt trội</em><em>, khả năng l&agrave;m s&aacute;ng</em><em>, khả năng che phủ, l&agrave;m mờ t&agrave;n nhang</em><strong><em>,&nbsp;</em></strong><em>mướt v&agrave; tỏa s&aacute;ng</em></p>

<p><strong>Sự ph&aacute;t triển của 1 chuỗi m&agrave;u sắc</strong></p>

<p>CC Cream l&agrave; sản phẩm được pha trộn bởi 1 chuỗi hạt c&oacute; m&agrave;u (color capsule)</p>

<p><strong>Một bước tiến mới đối với l&agrave;n da</strong></p>

<p>Tạo lớp che phủ ho&agrave;n hảo</p>

<p><strong>Moisture Base 45%</strong></p>

<p><strong>Tạo lớp bảo vệ da ho&agrave;n hảo</strong></p>

<p>C&oacute; khả năng duy tr&igrave; độ ẩm trong suốt 12h (đ&atilde; được&nbsp;qua thử nghiệm l&acirc;m s&agrave;ng, tại Trung t&acirc;m hỗ trợ l&acirc;m sang của trường ĐH Semyung)</p>

<p><strong>HDSD</strong>:&nbsp;Sau khi d&ugrave;ng c&aacute;c sản phẩm dưỡng da cơ bản, lấy 1 lượng vừa đủ CC Crean (khoảng 1 hạt đậu), thoa theo thứ tự g&ograve; m&aacute; &ndash; tr&aacute;n &ndash; mũi - cằm. Nếu muốn che phủ tốt hơn c&oacute; thể thoa th&ecirc;m 1 lần để tăng cường hiệu quả</p>

<p><strong><strong>TL:</strong>&nbsp;50ml</strong></p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2065_cc-cream-2.jpg', N'/images/photoproduct/2016/7/sc_full_2065_cc-cream-2.jpg', CAST(0x0000A63600DE12DE AS DateTime), 1, N'50ml', N'', N'Hàn Quốc', 0.0000, 655000.0000, 0, 8, N'vi', 1, 0, 0, N'Luminous-Pure-Aura-CC-Cream-SPF30-PA', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (181, N'BC Dation Cushion Plus', N'Km7Gzp', N'101', N'<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);">Kem trang điểm ho&agrave;n hảo t&ocirc;ng s&aacute;ng 01</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);">Kem trang điểm ho&agrave;n hảo t&ocirc;ng tự nhi&ecirc;n 02</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>C&ocirc;ng dụng</strong>: Kem trang điểm th&ocirc;ng minh thế hệ mới bao gồm c&aacute;c chức năng của BB cream, CC cream v&agrave; Foundation gi&uacute;p chống nắng, chống nhăn, l&agrave;m trắng, cung cấp độ ẩm nhẹ cho da gi&uacute;p lớp trang điểm b&aacute;m bền ho&agrave;n hảo m&agrave; kh&ocirc;ng hề l&agrave;m kh&ocirc; da.</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>HDSD:</strong><span>&nbsp;</span>Sau khi sử dụng c&aacute;c bước dưỡng da ban ng&agrave;y, sử dụng b&ocirc;ng th&ocirc;ng minh đi k&egrave;m vỗ đều sản phẩm l&ecirc;n da cho lớp trang điểm l&aacute;ng mịn.</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>TL:</strong><span>&nbsp;</span>15g</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>HSD:</strong><span>&nbsp;</span>3 năm sau ng&agrave;y sx</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>Lưu &yacute;:</strong><span>&nbsp;</span>Để xa tầm tay của trẻ em .Ngưng sử dụng khi c&oacute; hiện tượng mẩn đỏ.</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);">Bảo quản nơi tho&aacute;ng m&aacute;t</span></div>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2081_bc-dation-cushion-plus5.jpg', N'/images/photoproduct/2016/7/sc_full_2081_bc-dation-cushion-plus5.jpg', CAST(0x0000A63900C12FFA AS DateTime), 1, N'15g', N'', N'Hàn Quốc', 0.0000, 765000.0000, 0, 1, N'vi', 1, 0, 0, N'BC-Dation-Cushion-Plus', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (182, N'BC Dation Water Pact', N'qPSosS', N'101', N'<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 12pt;">Phấn tươi cao cấp với 3 t&aacute;c dụng: l&agrave;m trắng + cải thiện nếp nhăn + ngăn ngừa tia tử ngoại. Sản phẩm chứa 100% nước kho&aacute;ng tự nhi&ecirc;n (carbonated water) bổ sung lượng ẩm s&acirc;u từ b&ecirc;n trong, tốt hơn nhiều lần so với nước th&ocirc;ng thường. Sản phẩm vừa c&oacute; khả năng tạo lớp nền mỏng mịn, vừa c&oacute; khả năng che phủ tốt, đồng thời, tạo độ tươi m&aacute;t, duy tr&igrave; nhiệt độ -20C sau khi phấn đ&atilde; kh&ocirc;, gi&uacute;p duy tr&igrave; sự căng mịn l&acirc;u d&agrave;i cho l&agrave;n da.</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 12pt;"><strong>TP</strong>: Như tr&ecirc;n bao b&igrave;</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 12pt;"><strong>HDSD</strong>: D&ugrave;ng b&ocirc;ng phấn c&oacute; sẵn lấy 1 lượng vừa đủ vỗ đều theo chiều kết cấu da.</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 12pt;"><strong>TL</strong>:15 g</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 12pt;"><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 12pt;"><strong>NSX</strong>: H&agrave;n Quốc</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: 12pt;">Bảo quản nơi tho&aacute;ng m&aacute;t</span></div>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2048_bc-dation-water-pact2.jpg', N'/images/photoproduct/2016/7/sc_full_2048_bc-dation-water-pact2.jpg', CAST(0x0000A63900DEC4E3 AS DateTime), 1, N'15 g', N'', N'Hàn Quốc', 0.0000, 820000.0000, 0, 2, N'vi', 1, 0, 0, N'BC-Dation-Water-Pact', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (183, N'Aqua Aura UV Moist Cushion', N'ZMJc8H', N'101', N'<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);">Phấn nước cao cấp gồm 8 t&aacute;c dụng l&agrave;m m&aacute;t dịu da, bổ sung độ ẩm, l&agrave;m trắng, tạo độ b&oacute;ng mịn, ngăn ngừa tia tử ngoại, khả năng che khuyết, ngăn ngừa nếp nhăn, tạo lớp ngăn c&aacute;ch lớp dưỡng da v&agrave; lớp trang điểm gi&uacute;p lớp nền trang điểm rạng rỡ, tươi tắn, tự nhi&ecirc;n.</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>TP</strong><span>&nbsp;</span>: l&ocirc; hội, rau sam, hoa c&uacute;c...</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>HDSD</strong><span>&nbsp;</span>: Sử dụng v&agrave;o bước kem l&oacute;t, hoặc kem nền hoặc kem chống nắng. Hoặc c&oacute; thể sử dụng sau khi trang điểm.&nbsp;&nbsp;</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>TL</strong><span>&nbsp;</span>: 13 g</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt; color: rgb(0, 0, 0);"><strong>HSD<span>&nbsp;</span></strong>: 3 năm sau ng&agrave;y sx</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">Bảo quản nơi tho&aacute;ng m&aacute;t</span></div>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2051_aqua-aura-uv-moist-cushion2.jpg', N'/images/photoproduct/2016/7/sc_full_2051_aqua-aura-uv-moist-cushion2.jpg', CAST(0x0000A63900DE1C88 AS DateTime), 1, N'12 g', N'', N'Hàn Quốc', 0.0000, 702000.0000, 0, 3, N'vi', 1, 0, 0, N'Aqua-Aura-UV-Moist-Cushion', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (184, N'Aqua Aura Jelly Cushion SPF 36 PA ++', N'byFLCZ', N'101', N'<div class="detail-product-content-price" style="margin: 0px; padding: 0px; width: 365px; color: rgb(255, 0, 0); font-size: 16px; font-weight: normal; font-family: Arial, Helvetica, sans-serif; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">702.000 VNĐ</div>

<div class="detail-product-content" style="margin: 0px; padding: 6px 0px 16px; width: 365px; line-height: 18px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">
<div style="margin: 0px; padding: 0px;"><span style="font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); font-size: 12pt;">Phấn nền dạng nước được chứa trong miếng nệm m&uacute;t c&oacute; kết cấu đặc biệt, gồm 5 t&aacute;c dụng: l&agrave;m m&aacute;t dịu da, ngăn thấm loang mồ h&ocirc;i gi&uacute;p lớp nền r&aacute;o mịn cả ng&agrave;y, dưỡng trắng da, chống nắng v&agrave; cho một lớp nền trang điểm rạng rỡ, tươi tắn, tự nhi&ecirc;n.</span></div>

<div style="margin: 0px; padding: 0px;"><span style="font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); font-size: 12pt;"><strong>HDSD:</strong><span>&nbsp;</span>Sử dụng v&agrave;o bước kem l&oacute;t, hoặc kem nền hoặc kem chống nắng. Hoặc c&oacute; thể sử dụng sau khi trang điểm.</span></div>

<div style="margin: 0px; padding: 0px;"><span style="font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); font-size: 12pt;"><strong>TL:</strong>13 g</span></div>

<div style="margin: 0px; padding: 0px;"><span style="font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); font-size: 12pt;"><strong>HSD:</strong><span>&nbsp;</span>3 năm sau ng&agrave;y sx</span></div>

<div style="margin: 0px; padding: 0px;"><span style="font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); font-size: 12pt;">Bảo quản nơi tho&aacute;ng m&aacute;</span><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">t</span></div>
</div>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2053_aqua-aura-jelly-cushion.jpg', N'/images/photoproduct/2016/7/sc_full_2053_aqua-aura-jelly-cushion.jpg', CAST(0x0000A63900DA0CDC AS DateTime), 1, N'13 g', N'', N'Hàn Quốc', 0.0000, 702000.0000, 0, 4, N'vi', 1, 0, 0, N'Aqua-Aura-Jelly-Cushion-SPF-36-PA', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (185, N'Timeless Carat Moisture Soft Powder Pact', N'D9t45f', N'101', N'<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">Phấn bột n&eacute;n h&uacute;t dầu si&ecirc;u mịn</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>Chức năng<span>&nbsp;</span></strong>: Phấn bột dạng n&eacute;n t&aacute;c dụng h&uacute;t đi lượng dầu thừa tr&ecirc;n bề mặt da, chống c&aacute;c t&aacute;c động c&oacute; hại của tia tử ngoại. Tinh chất collagen v&agrave; c&aacute;c chất hữu cơ đem lại l&agrave;n da mịn m&agrave;ng, tươi s&aacute;ng tự nhi&ecirc;n.</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>TP</strong>: collagen, chất hữu cơ, dầu argan...</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>HDSD</strong>: D&ugrave;ng b&ocirc;ng phấn thoa nhẹ nh&agrave;ng tr&ecirc;n to&agrave;n khu&ocirc;n mặt trước thoa v&agrave;o v&ugrave;ng chữ T, tr&aacute;nh miết b&ocirc;ng phấn để tạo độ mịn v&agrave; b&aacute;m phấn.</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>TL</strong>: 13g</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>HSD</strong>: 3 năm sau ng&agrave;y sx &nbsp;</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">- Bảo quản nơi tho&aacute;ng m&aacute;t</span></div>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2055_timeless-carat-moisture-soft-powder-pact2.jpg', N'/images/photoproduct/2016/7/sc_full_2055_timeless-carat-moisture-soft-powder-pact2.jpg', CAST(0x0000A63900DA8229 AS DateTime), 1, N'13 g', N'', N'Hàn Quốc', 0.0000, 765000.0000, 0, 5, N'vi', 1, 0, 0, N'Timeless-Carat-Moisture-Soft-Powder-Pact', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (186, N'Face Mix Mineral Powder Pact', N'HxZC5A', N'101', N'<p style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-size: 12pt; line-height: 18.4px; font-family: &quot;Times New Roman&quot;, serif;">Phấn n&eacute;n kết hợp từ những hạt bột nhỏ mịn, đem lại l&agrave;n da s&aacute;ng v&agrave; l&aacute;ng mượt, che đi được những v&ugrave;ng da tối, c&oacute; khuyết điểm, m&agrave; vẫn giữ được l&agrave;n da đẹp, mịn tự nhi&ecirc;n.</span></p>

<p style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><strong><span style="font-size: 12pt; line-height: 18.4px; font-family: &quot;Times New Roman&quot;, serif;">TP:<span>&nbsp;</span></span></strong><span style="font-size: 12pt; line-height: 18.4px; font-family: &quot;Times New Roman&quot;, serif;">nước hoa sen, seramide, marine collagen, quả lựu...</span></p>

<p style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><strong><span style="font-size: 12pt; line-height: 18.4px; font-family: &quot;Times New Roman&quot;, serif;">HDSD</span></strong><span style="font-size: 12pt; line-height: 18.4px; font-family: &quot;Times New Roman&quot;, serif;">: d&ugrave;ng b&ocirc;ng phấn thoa nhẹ nh&agrave;ng tr&ecirc;n to&agrave;n khu&ocirc;n mặt trước rồi thoa v&agrave;o v&ugrave;ng chữ T.</span></p>

<p style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><strong><span style="font-size: 12pt; line-height: 18.4px; font-family: &quot;Times New Roman&quot;, serif;">TL</span></strong><span style="font-size: 12pt; line-height: 18.4px; font-family: &quot;Times New Roman&quot;, serif;">: 9g<span>&nbsp;</span></span></p>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2057_face-mix-mineral-powder-pact.jpg', N'/images/photoproduct/2016/7/sc_full_2057_face-mix-mineral-powder-pact.jpg', CAST(0x0000A63900DB0BF8 AS DateTime), 1, N'9 g', N'', N'Hàn Quốc', 0.0000, 485000.0000, 0, 6, N'vi', 1, 0, 0, N'Face-Mix-Mineral-Powder-Pact', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (187, N'Face Mix Oil Paper Powder', N'qfMa0U', N'101', N'<div style="margin: 0px; padding: 0px; text-align: justify;"><span style="font-family: Arial, Helvetica, sans-serif; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; font-size: 14pt; color: rgb(0, 0, 0);"><span style="font-size: 12pt; font-family: &quot;Times New Roman&quot;;">Phấn bột c&oacute; chức năng giấy thấm dầu, gi&uacute;p h&uacute;t dầu v&agrave; mồ h&ocirc;i, điều chỉnh b&atilde; nhờn v&agrave; duy tr&igrave; l&agrave;n da căng mịn m&agrave; kh&ocirc;ng bết d&iacute;nh, duy tr&igrave; l&agrave;n da s&aacute;ng v&agrave; khỏe.</span></span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;">&nbsp;</div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">&nbsp;</div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><strong><span style="font-size: 12pt; line-height: 21px; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0);"><em>HDSD</em></span></strong><span style="color: rgb(0, 0, 0); font-size: 12pt; line-height: 21px; font-family: &quot;Times New Roman&quot;;">:<span>&nbsp;</span></span><span style="color: rgb(0, 0, 0); font-size: 12pt; line-height: 21px; font-family: &quot;Times New Roman&quot;;">d&ugrave;ng b&ocirc;ng phấn thoa nhẹ nh&agrave;ng tr&ecirc;n to&agrave;n khu&ocirc;n mặt trước rồi thoa v&agrave;o v&ugrave;ng chữ T.</span></div>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2059_face-mix-oil-paper-powder.jpg', N'/images/photoproduct/2016/7/sc_full_2059_face-mix-oil-paper-powder.jpg', CAST(0x0000A63900DB7934 AS DateTime), 1, N'', N'', N'Hàn Quốc', 0.0000, 387000.0000, 0, 7, N'vi', 1, 0, 0, N'Face-Mix-Oil-Paper-Powder', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (188, N'Timeless Carat Dual Concenaler', N'jSfoxI', N'102', N'<p align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>Chức năng</strong>: Sản phẩm che khuyết điểm gồm 2 đầu, 1 đầu dạng thỏi, 1 đầu dạng lỏng. Đầu dạng thỏi che đi những khuyết điểm đậm như nốt ruồi, t&agrave;n nhang. Đầu dạng lỏng gi&uacute;p che phủ một c&aacute;ch tự nhi&ecirc;n, che đi những khuyết điểm nhẹ như quầng th&acirc;m.</span></p>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>HDSD</strong>: Trước hoặc sau khi sử dụng kem nền, thoa 1 lượng vừa đủ l&ecirc;n thoa đều những v&ugrave;ng da cần che khuyết (tr&aacute;nh hiện tượng tạo sự ngăn c&aacute;ch giữa m&agrave;u da v&agrave; lớp trang điểm)</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>TL</strong>: 4.2g + 4.5 ml</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">-<span>&nbsp;</span><strong>HSD</strong>: 3 năm sau ng&agrave;y sx</span></div>

<div align="justify" style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px;"><span style="font-family: &quot;Times New Roman&quot;; font-size: 12pt;">- Bảo quản nơi tho&aacute;ng m&aacute;t</span></div>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2080_timeless-carat-dual-concenaler2.jpg', N'/images/photoproduct/2016/7/sc_full_2080_timeless-carat-dual-concenaler2.jpg', CAST(0x0000A639011217F1 AS DateTime), 1, N'4.2g + 4.5 ml', N'', N'Hàn Quốc', 0.0000, 295000.0000, 0, 1, N'vi', 1, 0, 0, N'Timeless-Carat-Dual-Concenaler', NULL, NULL, NULL, 0)
INSERT [dbo].[_Product] ([ProductID], [ProductName], [ProductCode], [CatalogID], [Summary], [Content], [ImagePath], [ImageBigPath], [DateModify], [Store], [Promotion], [Warranty], [Manufacture], [PriceOld], [PriceNew], [Views], [OrderDisplay], [Lang], [IsShow], [IsHot], [IsPromotion], [Link], [Approve], [StartDate], [EndDate], [Rating]) VALUES (189, N'Face Mix Primer Lip Concealer', N'SXjpuf', N'102', N'<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><span style="font-size: 12pt; font-family: &quot;Times New Roman&quot;;">Sản phẩm che khuyết điểm m&ocirc;i l&agrave; một lớp nền ho&agrave;n hảo cho m&ocirc;i, tạo n&ecirc;n lớp che phủ ho&agrave;n hảo gi&uacute;p sắc tố m&ocirc;i s&aacute;ng m&agrave;u hơn, t&ocirc;n l&ecirc;n m&agrave;u son, đồng thời th&agrave;nh phần dưỡng c&oacute; b&ecirc;n trong sản phẩm gi&uacute;p cải thện dần c&aacute;c vấn đề của m&ocirc;i.</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;">&nbsp;</div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><strong style="font-size: 12pt; font-family: &quot;Times New Roman&quot;;">TP</strong>:<span>&nbsp;</span><span style="font-size: 12pt;">chiết xuất từ marin collagen</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><strong style="font-size: 12pt; font-family: &quot;Times New Roman&quot;;">DL&nbsp;</strong>:<span>&nbsp;</span><span style="font-size: 12pt;">9g</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><strong style="font-size: 12pt; font-family: &quot;Times New Roman&quot;;">HDSD</strong><span style="font-size: 12pt;">:<span>&nbsp;</span></span><span style="font-size: 12pt; font-family: &quot;Times New Roman&quot;;">Sau khi ho&agrave;n thiện lớp trang điểm nền, lấy 1 lượng vừa đủ thoa đều l&ecirc;n m&ocirc;i, sau đ&oacute; d&ugrave;ng c&oacute; m&agrave;u b&ecirc;n tr&ecirc;n&nbsp;</span></div>

<div style="margin: 0px; padding: 0px; color: rgb(123, 116, 116); font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 18px; orphans: auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-align: justify;"><strong style="font-size: 12pt; font-family: &quot;Times New Roman&quot;;">HSD :&nbsp;</strong><span style="font-size: 12pt; font-family: &quot;Times New Roman&quot;;">3 năm sau ng&agrave;y sx</span></div>
', N'<p>&nbsp;</p>
', N'/images/photoproduct/2016/7/sc_small_2092_201328144928579.jpg', N'/images/photoproduct/2016/7/sc_full_2092_201328144928579.jpg', CAST(0x0000A63901152743 AS DateTime), 1, N'9g', N'', N'Hàn Quốc', 0.0000, 147000.0000, 0, 2, N'vi', 1, 0, 0, N'Face-Mix-Primer-Lip-Concealer', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[_Product] OFF
/****** Object:  Table [dbo].[_PostTag]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_PostTag](
	[PostTagID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[Tag] [nvarchar](50) NULL,
	[Link] [varchar](50) NULL,
 CONSTRAINT [PK_PostTag] PRIMARY KEY CLUSTERED 
(
	[PostTagID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_Post]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[CatelogID] [int] NULL,
	[PostName] [nvarchar](200) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Link] [nvarchar](200) NULL,
	[Summary] [nvarchar](500) NULL,
	[PostContent] [nvarchar](max) NULL,
	[DateModified] [datetime] NULL,
	[IsHot] [bit] NULL,
	[Lang] [nvarchar](10) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[OrderDisplay] [int] NULL,
	[Approve] [bit] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Post] ON
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (4, 76, N'Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng', N'/images/newspost/2016/5/sc_small_2105_5.jpg', N'Huong-dan-nhuom-toc-nam-dep-hoan-hao-thoi-thuong', N'Nhuộm tóc không còn là việc quá xa lạ đối với đấng mày râu trong thời buổi hiện tại. Khi mà chính màu tóc cũng đang tạo nên một cơn sốt trong làng thẩm mĩ thì việc lựa chọn cho mình một màu tóc để đánh bật lên phong cách, cá tính, thu hút người đối diện là điều hoàn toàn nên làm.', N'<p>Tuy nhi&ecirc;n mỗi người lại c&oacute; mỗi quan điểm kh&aacute;c nhau. C&oacute; người th&iacute;ch giữ lại m&agrave;u t&oacute;c đen truyền thống, c&oacute; người th&iacute;ch chạy theo xu hướng v&agrave; c&oacute; người th&iacute;ch l&agrave;m mới m&igrave;nh. Nhưng kh&ocirc;ng phải ai cũng biết c&aacute;ch l&agrave;m sao để c&oacute; một m&aacute;i&nbsp;<strong><a href="/vi/news/posts/76/Toc-nam" target="_blank" title="Tóc đẹp">t&oacute;c đẹp</a></strong>&nbsp;ho&agrave;n hảo nhất cho d&ugrave; c&oacute; nhuộm hay kh&ocirc;ng.</p>

<p><img alt="Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng" src="/images/images/stylist1.jpg" style="height:844px; width:600px" /></p>

<p><strong>Cập nhật xu hướng</strong></p>

<p>Việc chọn lựa m&agrave;u t&oacute;c kh&ocirc;ng chỉ đ&aacute;p ứng ti&ecirc;u ch&iacute; đẹp m&agrave; c&ograve;n phải hợp thời. Hiện nay c&oacute; những m&agrave;u t&oacute;c nam đang tạo n&ecirc;n một cơn sốt ch&iacute;nh l&agrave;: x&aacute;m kh&oacute;i, n&acirc;u đỏ, xanh r&ecirc;u...</p>

<p>Bạn phải chọn lựa cho m&igrave;nh được m&agrave;u t&oacute;c ph&ugrave; hợp để kh&ocirc;ng bị lạc l&otilde;ng so với xu hướng hiện nay.</p>

<p><strong>Ph&acirc;n t&iacute;ch bản th&acirc;n</strong></p>

<p>Bạn phải x&aacute;c định được m&agrave;u da của m&igrave;nh l&agrave; s&aacute;ng hay tối, ph&ugrave; hợp với t&ocirc;ng m&agrave;u n&agrave;o. Đối với những ai c&oacute; l&agrave;n da s&aacute;ng, ngo&agrave;i những t&ocirc;ng m&agrave;u nổi bật th&igrave; c&aacute;c m&agrave;u tối cũng rất đ&aacute;ng để thử.</p>

<p>Ngược lại nếu những anh ch&agrave;ng c&oacute; nước da ngăm chỉ n&ecirc;n chọn những m&agrave;u sắc ở mức độ trung t&iacute;nh. M&agrave;u n&acirc;u c&oacute; lẽ l&agrave; v&iacute; dụ điển h&igrave;nh.</p>

<p><strong>Thương hiệu tạo n&ecirc;n đẳng cấp</strong></p>

<p>Bạn n&ecirc;n tham khảo một số thương hiệu thuốc nhuộm tr&ecirc;n thị trường để biết được d&ograve;ng n&agrave;o l&agrave; tốt với t&oacute;c bạn. Bởi nếu sử dụng thuốc nhuộm kh&ocirc;ng đảm bảo chất lượng chẳng những sẽ kh&ocirc;ng l&ecirc;n m&agrave;u như &yacute; m&agrave; c&ograve;n ảnh hưởng rất lớn đến da đầu, về l&acirc;u về d&agrave;i c&oacute; thể dẫn đến ung thư da.</p>

<p>Ngo&agrave;i ra, bạn n&ecirc;n chọn c&aacute;c salon uy t&iacute;n v&igrave; để nhuộm t&oacute;c nam đẹp v&agrave; l&ecirc;n đ&uacute;ng m&agrave;u cần phải đ&uacute;ng c&ocirc;ng đoạn v&agrave; quan trọng nhất l&agrave; c&aacute;ch pha m&agrave;u.</p>

<p><strong>Chăm s&oacute;c sau khi nhuộm</strong></p>

<p>Bất cứ việc g&igrave; cũng vậy, cần phải c&oacute; sự chăm s&oacute;c để duy tr&igrave; vẻ đẹp. Sau khi nhuộm, thời gian đầu t&oacute;c sẽ rất yếu v&agrave; cần được chăm s&oacute;c. Bạn c&oacute; thể sử dụng c&aacute;c loại dầu gội phục hồi t&oacute;c, b&ecirc;n cạnh đ&oacute; n&ecirc;n sử dụng c&aacute;c serum giữ m&agrave;u cho t&oacute;c để c&oacute; m&agrave;u t&oacute;c đẹp như mơ.</p>
', CAST(0x0000A65000AEB3E8 AS DateTime), 0, N'vi', N'tóc nam', N'Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng', N'Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng', 1, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (10, 65, N'Sẽ là hối tiếc nếu trong đời chưa một lần để tóc mái xoăn!', N'/images/newspost/2016/6/sc_small_2069_10.jpg', N'Se-la-hoi-tiec-neu-trong-doi-chua-mot-lan-de-toc-mai-xoan', N'Mốt tóc mái xoăn với những biến tấu cực ấn tượng mang tới phái đẹp vẻ đẹp sành điệu khiến nhiều người khao khát.', N'<p>Những kiểu&nbsp;<strong>t&oacute;c m&aacute;i xoăn</strong>&nbsp;mang tới vẻ đẹp lạ lẫm v&agrave; cực thu h&uacute;t cho chị em ph&aacute;i đẹp. C&oacute; nhiều c&aacute;ch biến tấu với t&oacute;c m&aacute;i xoăn, chị em&nbsp;phụ nữ&nbsp;c&oacute; thể lựa chọn cho m&igrave;nh kiểu&nbsp;<a href="/vi/news/posts/65/Toc-dep" target="_blank">t&oacute;c đẹp</a>&nbsp;v&agrave; ph&ugrave; hợp nhất với khu&ocirc;n mặt của m&igrave;nh.</p>

<p>H&atilde;y l&agrave; người ti&ecirc;n phong trong xu hướng l&agrave;m đẹp với m&aacute;i xoăn s&agrave;nh điệu để bạn trở th&agrave;nh người đẹp nhất mỗi nơi bạn xuất hiện.</p>

<p><img alt="Phần tóc mái mỏng được uống xoăn nhẹ rất tự nhiên, trông nhưng một phần tóc con nhưng được vào nếp gọn gàng. Kiểu tóc này khiến bạn như trẻ ra thêm vài tuổi, giống một nữ sinh trung học." src="/images/images/222.jpg" style="height:613px; width:500px" /></p>

<p>Phần t&oacute;c m&aacute;i mỏng được uống xoăn nhẹ rất tự nhi&ecirc;n, tr&ocirc;ng nhưng một phần t&oacute;c con nhưng được v&agrave;o nếp&nbsp;gọn g&agrave;ng. Kiểu t&oacute;c n&agrave;y khiến bạn như trẻ ra th&ecirc;m v&agrave;i tuổi, giống một nữ sinh trung học.</p>

<p><img alt="Biến tấu phần mái dài bằng cách uốn xoăn nhẹ nhàng mang tới vẻ đẹp tự nhiên cho toàn bộ khuôn mặt của bạn." src="/images/images/223.jpg" style="height:432px; width:500px" /></p>

<p>Biến tấu phần m&aacute;i d&agrave;i bằng c&aacute;ch uốn xoăn nhẹ nh&agrave;ng mang tới vẻ đẹp tự nhi&ecirc;n cho to&agrave;n bộ khu&ocirc;n mặt của bạn.</p>

<p><img alt="Kiểu tóc này rất phù hợp cho những nàng sở hữu tính cách năng động và cá tính. " src="/images/images/224.jpg" style="height:557px; width:500px" /></p>

<p>Kiểu t&oacute;c n&agrave;y rất ph&ugrave; hợp cho những n&agrave;ng sở hữu t&iacute;nh c&aacute;ch năng động v&agrave; c&aacute; t&iacute;nh.&nbsp;</p>

<p><img alt="Một chút nổi loạn với kiểu tóc mái xoăn đánh rối vô cùng thời trang." src="/images/images/225.jpg" style="height:650px; width:500px" /></p>

<p><img alt="Một chút nổi loạn với kiểu tóc mái xoăn đánh rối vô cùng thời trang." src="/images/images/226.jpg" style="height:587px; width:500px" /></p>

<p>Một ch&uacute;t nổi loạn với kiểu t&oacute;c m&aacute;i xoăn đ&aacute;nh rối v&ocirc; c&ugrave;ng thời trang.</p>

<p><img alt="Kiểu tóc đầy nữ tính, cực dễ chiều lòng mọi khuôn mặt và chẳng bao giờ lạc hậu." src="/images/images/228.jpg" style="height:340px; width:500px" /></p>

<p>Kiểu t&oacute;c đầy nữ t&iacute;nh, cực dễ chiều l&ograve;ng mọi khu&ocirc;n mặt v&agrave; chẳng bao giờ lạc hậu.</p>

<p>theo&nbsp;eva.vn</p>
', CAST(0x0000A65000AEB5E0 AS DateTime), 0, N'vi', N'tóc đẹp', N'Sẽ là hối tiếc nếu trong đời chưa một lần để tóc mái xoăn!', N'Sẽ là hối tiếc nếu trong đời chưa một lần để tóc mái xoăn!', 10, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (23, 65, N'7 kiểu tóc gọn gàng cho ngày hè nắng nóng', N'/images/newspost/2016/6/sc_small_2070_12.jpg', N'7-kieu-toc-gon-gang-cho-ngay-he-nang-nong', N'Với những biến tấu tóc này, chị em vẫn có thể tha hồ điệu mặc cho ngày hè oi bức cùng với mồ hôi gây cảm giác bí bách, khó chịu.', N'<p>M&ugrave;a h&egrave; đến l&agrave; dịp ph&aacute;i đẹp tung tăng với nhiều kiểu trang phục như v&aacute;y ngắn, quần shorts, &aacute;o hai d&acirc;y&hellip; Tuy nhi&ecirc;n đối với kiểu t&oacute;c th&igrave; dường như kh&ocirc;ng c&oacute; nhiều sự lựa chọn. Hầu hết đều trung th&agrave;nh với t&oacute;c b&uacute;i cao hoặc buộc đu&ocirc;i ngựa bởi nhiều chị em ngại mồ h&ocirc;i khiến cho t&oacute;c bị bết r&iacute;t, kh&ocirc;ng v&agrave;o nếp, l&agrave;m hỏng mất kiểu&nbsp;<a href="/vi/news/posts/65/Toc-dep" target="_blank">t&oacute;c đẹp</a>. Dưới đ&acirc;y l&agrave; một số gợi &yacute; biến tấu với m&aacute;i t&oacute;c d&agrave;nh cho ng&agrave;y h&egrave; m&agrave; chị em c&oacute; thể &aacute;p dụng kh&ocirc;ng chỉ ở nơi c&ocirc;ng sở m&agrave; c&ograve;n tại ph&ograve;ng tập gym, lớp yoga hoặc những buổi tụ họp, tiệc t&ugrave;ng.</p>

<p><strong>1. T&oacute;c b&uacute;i cổ điển</strong></p>

<p>Kiểu t&oacute;c n&agrave;y tuy đơn giản nhưng tạo được ấn tượng sang trọng, qu&yacute; ph&aacute;i v&agrave; đứng đắn nếu kết hợp với trang phục đơn giản, thanh nh&atilde;. T&oacute;c b&uacute;i cổ điển gọn g&agrave;ng vừa ph&ugrave; hợp với chị em trong nhiều dịp v&agrave; nhiều hoạt động kh&aacute;c nhau vừa g&oacute;p phần gi&uacute;p khu&ocirc;n mặt s&aacute;ng sủa, thanh tho&aacute;t hơn.</p>

<p><img alt="tóc búi cổ điển" src="/images/images/229.jpg" style="height:667px; width:500px" /></p>

<p>T&oacute;c b&uacute;i cổ điển gọn g&agrave;ng, gi&uacute;p khu&ocirc;n mặt&nbsp;thanh tho&aacute;t hơn lại ph&ugrave; hợp với c&ocirc;ng sở lẫn tiệc t&ugrave;ng</p>

<p><strong>2. T&oacute;c m&aacute;i hất ngược ra sau</strong></p>

<p>Kiểu t&oacute;c n&agrave;y chưa mất đến một ph&uacute;t để ho&agrave;n th&agrave;nh, chỉ cần t&uacute;m lại phần t&oacute;c m&aacute;i rồi vuốt ngược ra ph&iacute;a sau v&agrave; cố định bằng cặp ghim l&agrave; bạn đ&atilde; c&oacute; ngay diện mạo mới năng động v&agrave; c&aacute; t&iacute;nh.</p>

<p><img alt="tóc hất ngược ra phía sau" src="/images/images/230.jpg" style="height:667px; width:500px" /></p>

<p>Cặp ngược t&oacute;c m&aacute;i ra sau vừa gi&uacute;p gương mặt gọn g&agrave;ng, đem lại cảm gi&aacute;c thoải m&aacute;i, m&aacute;t mẻ trong ng&agrave;y h&egrave; n&oacute;ng bức vừa gi&uacute;p l&agrave;n da th&ocirc;ng tho&aacute;ng v&agrave; bớt nguy cơ bị mụn v&ugrave;ng tr&aacute;n trong những ng&agrave;y thời tiết kh&oacute; chịu</p>

<p><strong>3. T&oacute;c đu&ocirc;i ngựa biến tấu</strong></p>

<p>Tương tự kiểu t&oacute;c đu&ocirc;i ngựa th&ocirc;ng thường, nhưng điểm nhấn nằm ở chỗ chiếc d&acirc;y buộc t&oacute;c của bạn sẽ bị che đi bằng một lọn t&oacute;c kh&aacute;c. Thay v&igrave; t&oacute;m gọn hết t&oacute;c v&agrave; buộc lại, c&aacute;c n&agrave;ng h&atilde;y chừa ra một lọn t&oacute;c với dộ d&agrave;y bằng khoảng một chiếc ống h&uacute;t. Sau khi buộc t&oacute;c bằng d&acirc;y thun, d&ugrave;ng lọn t&oacute;c n&agrave;y quấn quanh chỗ buộc để che đi sợi thun v&agrave; cố định lọn t&oacute;c n&agrave;y bằng kẹp tăm.</p>

<p><img alt="" src="/images/images/231.jpg" style="height:667px; width:500px" /></p>

<p>Điểm nhấn của kiểu đu&ocirc;i ngựa biến tấu so với truyền thống nằm ở lọn t&oacute;c quấn kh&eacute;o để&nbsp;giấu đi chiếc d&acirc;y thun buộc t&oacute;c.</p>

<p><strong>4. C&agrave;i băng đ&ocirc;</strong></p>

<p>M&oacute;n phụ kiện n&agrave;y gi&uacute;p cố định phần t&oacute;c m&aacute;i v&agrave; l&agrave;m điểm nhấn trong trường hợp chị em trang điểm theo phong c&aacute;ch tự nhi&ecirc;n v&agrave; lựa chọn trang phục tương đối đơn giản. Khi chọn băng đ&ocirc;, n&ecirc;n lưu &yacute; đến h&igrave;nh d&aacute;ng của khu&ocirc;n mặt: mặt tr&ograve;n th&iacute;ch hợp với băng đ&ocirc; bản to dẹt, mặt V-line n&ecirc;n lựa chọn băng đ&ocirc; mỏng bản nhỏ, v&agrave; băng đ&ocirc; d&agrave;y &ldquo;hợp cạ&rdquo; nhất với n&agrave;ng mặt tr&aacute;i xoan.</p>

<p><img alt="" src="/images/images/232.jpg" style="height:667px; width:500px" /></p>

<p>Băng đ&ocirc; l&agrave; một phụ kiện hữu &iacute;ch&nbsp;vừa gi&uacute;p chị&nbsp;em th&ecirc;m nổi bật vừa gi&uacute;p cố định m&aacute;i t&oacute;c gọn g&agrave;ng trong m&ugrave;a n&oacute;ng</p>

<p><strong>5. T&oacute;c buộc thấp vểnh sau g&aacute;y</strong></p>

<p><strong>C</strong>hỉ cần kh&eacute;o l&eacute;o t&aacute;ch phần m&aacute;i rồi t&uacute;m gọn chỗ t&oacute;c c&ograve;n lại ra ph&iacute;a sau g&aacute;y, gấp phần đu&ocirc;i t&oacute;c l&ecirc;n sau đ&oacute; cố định bằng chun, bạn đ&atilde; sở hữu một kiểu t&oacute;c vừa gọn vừa dịu d&agrave;ng rồi đấy. Kiểu t&oacute;c n&agrave;y đặc biệt th&iacute;ch hợp với người c&oacute; m&aacute;i t&oacute;c d&agrave;i ngang vai v&agrave; kh&aacute; thuận tiện khi đội mũ bảo hiểm bởi bạn sẽ kh&ocirc;ng bị sụp cả b&uacute;i t&oacute;c xuống như khi b&uacute;i cao hoặc buộc đu&ocirc;i ngựa.</p>

<p><img alt="" src="/images/images/233.jpg" style="height:667px; width:500px" /></p>

<p>T&oacute;c buộc thấp vểnh sau g&aacute;y rất&nbsp;thuận tiện khi đội mũ bảo hiểm&nbsp;</p>

<p><strong>6. T&oacute;c tết đu&ocirc;i c&aacute;</strong></p>

<p>T&oacute;c tết kiểu n&agrave;y rất gọn g&agrave;ng, tr&aacute;nh g&acirc;y rối t&oacute;c n&ecirc;n cũng rất thuận tiện với trường hợp đội mũ bảo hiểm trong khi phải tr&ugrave;m mũ của &aacute;o kho&aacute;c chống nắng ra ngo&agrave;i.</p>

<p><img alt="" src="/images/images/234.jpg" style="height:667px; width:500px" /></p>

<p>Hơi tốn thời gian chuẩn bị một ch&uacute;t nhưng t&oacute;c đu&ocirc;i c&aacute; gọn g&agrave;ng vừa&nbsp;gi&uacute;p chị em tỏa s&aacute;ng vừa&nbsp;di chuyển thuận tiện khi đội mũ bảo hiểm</p>

<p><strong>7. Tết m&aacute;i kiểu vương miện</strong></p>

<p>Vừa cố định t&oacute;c m&aacute;i gọn g&agrave;ng để khu&ocirc;n mặt tho&aacute;ng v&agrave; s&aacute;ng sủa vừa đem lại hiệu ứng dịu d&agrave;ng, cổ điển n&ecirc;n kiểu t&oacute;c n&agrave;y rất được l&ograve;ng chị em. Nếu kh&ocirc;ng muốn những lọn t&oacute;c m&aacute;i l&ograve;a x&ograve;a tr&ecirc;n mặt c&ugrave;ng với mồ h&ocirc;i tr&aacute;n l&agrave;m lem phấn v&agrave; mascara trang điểm, c&aacute;c n&agrave;ng n&ecirc;n thử m&aacute;i t&oacute;c tết vương miện n&agrave;y.</p>

<p><img alt="Tóc mái tết hình vương miện điệu đà cũng là một gợi ý hay chị em nên thử" src="/images/images/235.jpg" style="height:667px; width:500px" /></p>

<p>T&oacute;c m&aacute;i tết h&igrave;nh vương miện điệu đ&agrave; cũng l&agrave; một gợi &yacute; hay chị em n&ecirc;n thử.</p>

<p>theo eva.vn</p>
', CAST(0x0000A65000AEB6DE AS DateTime), 0, N'vi', N'tóc đẹp', N'Với những biến tấu tóc này, chị em vẫn có thể tha hồ điệu mặc cho ngày hè oi bức cùng với mồ hôi gây cảm giác bí bách, khó chịu.', N'7 kiểu tóc gọn gàng cho ngày hè nắng nóng', 10, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (24, 80, N'Kiểu tóc ngắn “quyến rũ” Miranda Kerr “khuấy động” mùa Hè', N'/images/newspost/2016/5/sc_small_2109_1.jpg', N'Kieu-toc-ngan-“quyen-ru”-Miranda-Kerr-“khuay-dong”-mua-He', N'Tạm biệt mái tóc dài thướt tha, Miranda Kerr vẫn rất nổi bật với nhiều kiểu tóc ngắn đẹp vô cùng sang trọng và cá tính.', N'<p>D&ugrave; đ&atilde; kh&ocirc;ng c&ograve;n gắn liền với&nbsp;biệt danh &lsquo;thi&ecirc;n thần Victoria Secret&rsquo; quyến rũ nữa nhưng kiều nữ Miranda Kerr vẫn chưa hề mất đi sự quyến rũ vốn c&oacute; của m&igrave;nh. Si&ecirc;u mẫu 33 tuổi lu&ocirc;n nổi bật v&agrave; rạng ngời mỗi khi xuất hiện trước c&ocirc;ng ch&uacute;ng với một vẻ ngo&agrave;i đ&aacute;ng ngưỡng mộ.<br />
Những kiểu t&oacute;c của n&agrave;ng cũng l&agrave; một trong những ti&ecirc;u điểm ch&uacute; &yacute; của ph&aacute;i đẹp tr&ecirc;n khắp thế giới. Trong những lần xuất hiện gần đ&acirc;y, Miranda tiếp tục chứng tỏ sức h&uacute;t của m&igrave;nh với những kiểu t&oacute;c ngắn&nbsp;mới lạ b&ecirc;n cạnh th&acirc;n h&igrave;nh quyến rũ. H&atilde;y c&ugrave;ng xem c&ocirc; n&agrave;ng đ&atilde; biến tấu như thế n&agrave;o cho m&aacute;i t&oacute;c ngắn của m&igrave;nh nh&eacute;!</p>

<p><img alt="Tóc retro quyến rũ" src="/images/images/Miranda-Kerr-Hair-Makeup-2016%20(5).jpg" style="height:1024px; width:682px" /></p>

<p>Trong lần xuất hiện tại bữa tiệc sau lễ trao giải Oscar năm nay, Miranda v&ocirc; c&ugrave;ng quyến rũ với m&aacute;i t&oacute;c xoăn retro lượn s&oacute;ng. Những nếp t&oacute;c phồng nhẹ tr&ecirc;n đầu được tiếp nối tự nhi&ecirc;n với những lọn xoăn mềm mại b&ecirc;n dưới. C&ugrave;ng với đ&ocirc;i m&ocirc;i đỏ, m&aacute;i t&oacute;c khiến cho người ta gợi nhớ đến h&igrave;nh ảnh của Marilyn Monroe nhưng vẫn kh&ocirc;ng thể qu&ecirc;n đi gương mặt h&uacute;t hồn của si&ecirc;u mẫu.</p>

<p><img alt="/Miranda Kerr " src="/images/images/Miranda-Kerr-Hair-Makeup-2016%20(1).jpg" style="height:841px; width:634px" /></p>

<p><em><strong>theo REUTERS</strong></em></p>
', CAST(0x0000A65000AEF941 AS DateTime), 1, N'vi', N'tóc ngắn', N'Kiểu tóc ngắn “quyến rũ” Miranda Kerr “khuấy động” mùa Hè', N'Kiểu tóc ngắn “quyến rũ” Miranda Kerr “khuấy động” mùa Hè', 1, 1, NULL)
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (26, 77, N'Học để trở thành nhà tạo mẫu tóc chuyên nghiệp', N'/images/newspost/2016/5/sc_small_2109_3.jpg', N'Hoc-de-tro-thanh-nha-tao-mau-toc-chuyen-nghiep', N'Trong bối cảnh nhu cầu làm đẹp ngày càng tăng, vai trò của nhà tạo mẫu tóc theo đó mà được nhìn nhận cao hơn so với trước đây. Hiện nay, không ít những trung tâm đào tạo về tóc được xây dựng nhằm thu hút các bạn trẻ theo học, nhưng một thực trạng không thể tránh khỏi, đó lào tạo càng nhiều, thất nghiệp càng cao. ', N'<p>Nguy&ecirc;n nh&acirc;n ch&iacute;nh l&agrave; do những salon t&oacute;c lu&ocirc;n đặt y&ecirc;u cầu về kinh nghiệm, tr&igrave;nh độ tay nghề của người thợ khi tuyển dụng. Đ&acirc;y l&agrave; một điều kiện hết sức kh&oacute; khăn cho bạn mới vừa tham gia học ng&agrave;nh t&oacute;c, chỉ vừa được đ&agrave;o tạo về l&yacute; thuyết m&agrave; chưa c&oacute; thời gian trải nghiệm thực tế.</p>

<p><strong>Y&ecirc;u cầu cao về đ&agrave;o tạo kỹ năng</strong></p>

<p>Khi bắt đầu tham gia kho&aacute; học Nh&agrave; tạo mẫu t&oacute;c chuy&ecirc;n nghiệp tại Belle beaute, học vi&ecirc;n sẽ được tiếp x&uacute;c với m&ocirc;i trường học th&acirc;n thiện, tận t&acirc;m do những nh&agrave; tạo mẫu đang l&agrave;m việc tại hệ thống trực tiếp giảng dạy.</p>

<p><img alt="Trung tâm đào tạo Belle hair salon" src="/images/images/C360_2016-04-18-15-58-12-289.jpg" style="height:638px; width:850px" /></p>

<p>Chương tr&igrave;nh học được x&acirc;y dựng đặc biệt sẽ khiến bạn phải nỗ lực hết c&ocirc;ng sức từ thứ 2 đến thứ 7, thậm ch&iacute; cả những ng&agrave;y chủ nhật d&agrave;nh cho thực h&agrave;nh. Trong 3 th&aacute;ng đầu, giảng vi&ecirc;n tại trung t&acirc;m đ&agrave;o tạo sẽ theo s&aacute;t để k&egrave;m cặp, nhằm đảm bảo bạn nắm được những kiến thức căn bản, tiếp cận với c&aacute;c m&aacute;y m&oacute;c trang thiết bị hiện đại v&agrave; c&aacute;c c&ocirc;ng nghệ ti&ecirc;n tiến như uốn s&oacute;ng nước, uốn dợn s&oacute;ng, uốn c&uacute;p phồng, uốn bay, duỗi dợn, duỗi c&uacute;p, nhuộm 3D v&agrave; c&aacute;c c&aacute;ch cắt tạo kiểu mới nhất. Bạn sẽ được ph&aacute;t huy c&aacute;c kiến thức đ&oacute; tại c&aacute;c chi nh&aacute;nh Belle salon từ 1-2 tuần sau đ&oacute;. Trước khi trở th&agrave;nh một nh&acirc;n vi&ecirc;n ch&iacute;nh thức, bạn sẽ c&oacute; &iacute;t nhất một th&aacute;ng nữa để ho&agrave;n th&agrave;nh việc trang bị c&aacute;c kỹ năng ban đầu.</p>

<p><strong>Đ&agrave;o tạo con người v&agrave; chuy&ecirc;n m&ocirc;n</strong></p>

<p>Ngo&agrave;i việc đ&agrave;o tạo về kỹ năng chuy&ecirc;n m&ocirc;n, tại đ&acirc;y c&ograve;n đặt mục ti&ecirc;u truyền đạt cho học vi&ecirc;n c&aacute;c kiến thức về c&aacute;c kỹ năng tư vấn, giao tiếp, khả năng nắm bắt t&acirc;m l&yacute; kh&aacute;ch h&agrave;ng&hellip; cũng được trang bị bởi giảng vi&ecirc;n thạc sĩ am hiểu trong ng&agrave;nh l&agrave;m đẹp. Đặc biệt hơn, c&aacute;c buổi chia sẻ về kỹ năng sống, sao cho c&oacute; &iacute;ch cho bản th&acirc;n v&agrave; x&atilde; hội li&ecirc;n tục được tổ chức nhằm ph&aacute;t triển tư duy c&aacute;n bộ nh&acirc;n vi&ecirc;n.</p>

<p><img alt="Chuyên gia hàng đầu về tóc tham gia giảng dạy." src="/images/images/C360_2016-04-18-18-15-38-066.jpg" style="height:638px; width:850px" /></p>

<p>Đ&acirc;y sẽ l&agrave; nơi hội tụ của những nh&agrave; tạo mẫu t&oacute;c xuất sắc nhất c&ugrave;ng với trang thiết bị m&aacute;y m&oacute;c, c&ocirc;ng nghệ hiện đại. Ngo&agrave;i định hướng ph&aacute;t triển tr&ecirc;n tất cả c&aacute;c th&agrave;nh phố tại Việt Nam.</p>

<p>Điện thoại <strong>0946661112&nbsp;</strong> để được tư vấn v&agrave; hướng dẫn chi tiết.</p>
', CAST(0x0000A65000AEFA4D AS DateTime), 1, N'vi', N'Đào tạo ', N'Đào tạo ', N'Học để trở thành nhà tạo mẫu tóc chuyên nghiệp', 1, 1, CAST(0x0000A6050125D5FA AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (27, 65, N'Giải đáp 11 thắc mắc về chăm sóc tóc', N'/images/newspost/2016/5/sc_small_2109_4.jpg', N'Giai-dap-11-thac-mac-ve-cham-soc-toc', N'Làm sao để tóc bóng mượt và chắc khỏe? Có nên lo lắng quá khi tóc gãy rụng? Xử lý tóc khô và cong veo thế nào? Làm sao để giữ màu tóc lâu bền? Hãy để các chuyên gia giải đáp thắc mắc về chăm sóc tóc và tư vấn cho bạn những bí quyết hay nhất để có mái tóc khỏe đẹp và hợp mốt.
', N'<p><em><strong>1. L&agrave;m c&aacute;ch n&agrave;o để duy tr&igrave; m&aacute;i t&oacute;c b&oacute;ng mượt v&agrave; chắc khỏe?</strong></em></p>

<p>So s&aacute;nh với ch&acirc;n t&oacute;c, ngọn t&oacute;c của ch&uacute;ng ta c&oacute; thể mất nhiều hơn gấp 3 lần lượng protein, th&agrave;nh phần ch&iacute;nh trong cấu tr&uacute;c của mỗi lớp biểu b&igrave; t&oacute;c. Sự mất protein khiến m&aacute;i t&oacute;c trở n&ecirc;n xốp hơn v&agrave; dễ tổn thương, chẻ ngọn. V&igrave; thế, d&ugrave;ng dầu gội tăng cường t&iacute;nh năng tạo sự &oacute;ng mượt. D&ugrave;ng dầu xả dưỡng ẩm đến tận phần ch&acirc;n t&oacute;c, gi&uacute;p m&aacute;i t&oacute;c tr&aacute;nh bị kh&ocirc;.</p>

<p><em><strong>2. C&oacute; n&ecirc;n qu&aacute; lo lắng khi t&oacute;c g&atilde;y rụng?</strong></em></p>

<p>Th&ocirc;ng thường c&oacute; khoảng 50 đến 100 sợi t&oacute;c rụng đi mỗi ng&agrave;y, nhưng nếu phần gốc t&oacute;c (với phần viền trắng) kh&ocirc;ng c&oacute; trong phần t&oacute;c rụng, đ&oacute; l&agrave; dấu hiệu t&oacute;c bị g&atilde;y. Theo chuy&ecirc;n gia của Pantene, c&oacute; nhiều nguy&ecirc;n nh&acirc;n khiến t&oacute;c g&atilde;y rụng: ăn uống thiếu khoa học dẫn đến thiếu hụt protein v&agrave; vitamin B, lạm dụng h&oacute;a chất tạo kiểu v&agrave; những biện ph&aacute;p l&agrave;m đẹp t&oacute;c tạm thời. Để ngăn chặn t&oacute;c g&atilde;y rụng, bạn cần gi&uacute;p cho t&oacute;c khỏe từ b&ecirc;n trong, sử dụng c&aacute;c sản phẩm c&oacute; bổ sung protein v&agrave; Pro vitamin, tr&aacute;nh tối đa việc tiếp x&uacute;c với h&oacute;a chất tạo kiểu, nước hồ bơi&hellip;</p>

<p><em><strong>3. L&agrave;m c&aacute;ch n&agrave;o để bảo vệ t&oacute;c khỏi tổn thương do m&ocirc;i trường?</strong></em></p>

<p>Một sản phẩm dưỡng ẩm hoặc serum bảo vệ khỏi tia UV gi&uacute;p tăng độ ẩm cho biểu b&igrave; t&oacute;c v&agrave; tạo lớp bảo vệ, gi&uacute;p hạn chế tối đa những tổn thương từ &ocirc; nhiễm m&ocirc;i trường.</p>

<p><strong><em>4. T&ocirc;i n&ecirc;n d&ugrave;ng c&aacute;c loại thực phẩm g&igrave; để m&aacute;i t&oacute;c khỏe mạnh?</em></strong></p>

<p>B&aacute;c sĩ Minh Hạnh, trung t&acirc;m dinh dưỡng TP. HCM, khuyến kh&iacute;ch chế độ ăn gi&agrave;u protein v&agrave; c&aacute;c dưỡng chất như kẽm, ma-gi&ecirc;, sắt v&agrave; vitamin B. B&ecirc;n cạnh đ&oacute;, h&atilde;y uống &iacute;t nhất từ 8 đến 10 ly nước mỗi ng&agrave;y.</p>

<p><em><strong>5. T&ocirc;i thực sự ch&aacute;n nản với m&aacute;i t&oacute;c kh&ocirc; v&agrave; cong veo của m&igrave;nh.</strong></em></p>

<p>Nếu bạn d&ugrave;ng m&aacute;y tạo kiểu bằng nhiệt, h&atilde;y t&igrave;m những loại c&oacute; c&ocirc;ng nghệ ion. Trị liệu bằng dầu mỗi tuần cũng rất quan trọng. H&atilde;y thoa một &iacute;t dầu dưỡng t&oacute;c Moroccanoil Treatment l&ecirc;n t&oacute;c trước khi sấy. Th&agrave;nh phần dầu argan nhanh ch&oacute;ng thẩm thấu tạo độ s&aacute;ng b&oacute;ng cải thiện độ đ&agrave;n hồi, bảo vệ t&oacute;c khỏi c&aacute;c nh&acirc;n tố g&acirc;y hại từ m&ocirc;i trường v&agrave; cắt giảm thời gian sấy kh&ocirc; t&oacute;c tới 40%.</p>

<p><a href="/images/photoproduct/2016/5/sc_full_2057_32.jpg" target="_blank"><img alt="Dầu dưỡng Moroccanoil chứa thành phần dầu argan" src="/images/photoproduct/2016/5/sc_full_2057_32.jpg" style="height:500px; width:500px" /></a></p>

<p>Dầu dưỡng Moroccanoil chứa th&agrave;nh phần dầu argan</p>

<p><em><strong>6. L&agrave;m c&aacute;ch n&agrave;o để giữ m&agrave;u t&oacute;c l&acirc;u bền?</strong></em></p>

<p>H&atilde;y d&ugrave;ng những sản phẩm d&agrave;nh ri&ecirc;ng cho t&oacute;c nhuộm. Chuy&ecirc;n gia tạo mẫu t&oacute;c của L&rsquo;Or&eacute;al Professionnel khuy&ecirc;n: &ldquo;Nếu bạn bơi lội thường xuy&ecirc;n, h&atilde;y d&ugrave;ng c&aacute;c sản phẩm c&oacute; t&iacute;nh lọc tia UV v&agrave; chứa c&ocirc;ng thức dưỡng. M&agrave;u đỏ lu&ocirc;n phai nhanh nhất, v&igrave; vậy, đừng gội qu&aacute; nhiều nếu sở hữu m&agrave;u t&oacute;c n&agrave;y. Những t&ocirc;ng m&agrave;u v&agrave;ng thường c&oacute; vẻ ngo&agrave;i kh&ocirc;, do đ&oacute;, h&atilde;y d&ugrave;ng serum để dưỡng ẩm cho t&oacute;c&rdquo;.</p>

<p><em><strong>7. T&ocirc;i c&oacute; thể dặm m&agrave;u cho t&oacute;c tại nh&agrave; chứ?</strong></em></p>

<p>Chuy&ecirc;n gia của L&rsquo;Or&eacute;al Professionnel n&oacute;i:&nbsp;&ldquo;H&atilde;y d&ugrave;ng những sản phẩm trước nhuộm v&agrave; khi nhuộm, h&atilde;y nhuộm từ phần gốc. Trải m&agrave;u đều tr&ecirc;n t&oacute;c v&agrave; để trong khoảng 40 ph&uacute;t. Gội lại bằng nước ấm v&agrave; m&aacute;t-xa nhẹ nh&agrave;ng. &ETH;ừng d&ugrave;ng dầu gội. Thay v&agrave;o đ&oacute;, d&ugrave;ng dầu xả v&agrave; giữ trong khoảng 2 ph&uacute;t trước khi xả lại.</p>

<p>B&iacute; quyết: Thoa s&aacute;p dưỡng l&ecirc;n v&ugrave;ng tr&aacute;n, ph&iacute;a sau tai v&agrave; phần cổ để tr&aacute;nh d&iacute;nh m&agrave;u l&ecirc;n da.</p>

<p><em><strong>8. L&agrave;m sao để chữa trị da đầu kh&ocirc;, bong tr&oacute;c?</strong></em></p>

<p>Việc dưỡng dầu thường xuy&ecirc;n v&agrave; d&ugrave;ng c&aacute;c loại dầu gội nhẹ c&oacute; thể trị da đầu kh&ocirc;. Nếu c&oacute; bệnh về da, h&atilde;y nhờ b&aacute;c sĩ da liễu tư vấn. Những loại dầu gội chứa nhựa tar hoặc axit salycilic gi&uacute;p c&aacute;c mảng bong tr&oacute;c rơi ra. Trong khi đ&oacute;, dầu gội chứa Ketoconazole v&agrave; Pyrithione kẽm gi&uacute;p trị da đầu vi&ecirc;m nhiễm.</p>

<p><em><strong>9. T&ocirc;i th&iacute;ch để kiểu t&oacute;c bồng bouffant của những năm 1960. Nếu chải ngược th&igrave; t&oacute;c t&ocirc;i c&oacute; bị tổn thương kh&ocirc;ng?</strong></em></p>

<p>Nh&agrave; tạo mẫu t&oacute;c Andr&eacute; của Ynot salon cho biết: &ldquo;Chải ngược qu&aacute; nhiều chắc chắn sẽ khiến t&oacute;c bị chẻ ngọn, t&oacute;c sẽ bị g&atilde;y rụng, đặc biệt l&agrave; ở đỉnh đầu trở n&ecirc;n dễ g&atilde;y&rdquo;. Thay v&igrave; chải ngược, h&atilde;y sử dụng c&aacute;c sản phẩm tạo độ bồng.</p>

<p><a href="/vi/product/product/74/Keo-bot-tao-do-phong-cho-toc-manh-Alfaparf-Volume-125ml" target="_blank"><img alt="" src="/images/photoproduct/2016/5/sc_full_2081_5.jpg" style="height:500px; width:500px" /></a></p>

<p>KEO BỌT TẠO ĐỘ PHỒNG CHO T&Oacute;C MẢNH ALFAPARF VOLUME</p>

<p><em><strong>10. T&ocirc;i kh&ocirc;ng thể sống thiếu m&aacute;y duỗi t&oacute;c. L&agrave;m c&aacute;ch n&agrave;o để tr&aacute;nh tổn thương m&aacute;i t&oacute;c?</strong></em></p>

<p>C&aacute;c loại m&aacute;y tạo kiểu d&ugrave;ng nhiệt khiến protein t&oacute;c (Keratin) bị bong tr&oacute;c. V&igrave; vậy, nhớ sấy t&oacute;c kh&ocirc; ho&agrave;n to&agrave;n trước khi tạo kiểu. D&ugrave;ng một sản phẩm chịu nhiệt d&agrave;nh ri&ecirc;ng cho c&aacute;c loại m&aacute;y n&agrave;y.</p>

<p><em><strong>11. L&agrave;m c&aacute;ch n&agrave;o để c&oacute; kiểu bob đẹp?</strong></em></p>

<p>Nh&agrave; tạo mẫu t&oacute;c Andr&eacute; tiết lộ: &ldquo;H&atilde;y tỉa hoặc tạo kiểu 6 đến 8 tuần để duy tr&igrave; kiểu d&aacute;ng v&agrave; cũng để chống chẻ ngọn. M&aacute;t-xa da đầu thường xuy&ecirc;n gi&uacute;p da đầu v&agrave; m&aacute;i t&oacute;c khỏe&rdquo;.</p>

<p><strong>theo&nbsp;elle.vn</strong></p>
', CAST(0x0000A65000AEFBC9 AS DateTime), 1, N'vi', N'chăm sóc tóc , tóc đẹp', N'Làm sao để tóc bóng mượt và chắc khỏe? Có nên lo lắng quá khi tóc gãy rụng? Xử lý tóc khô và cong veo thế nào? Làm sao để giữ màu tóc lâu bền?', N'Giải đáp 11 thắc mắc về chăm sóc tóc', 1, 1, CAST(0x0000A60900ADC0CC AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (28, 65, N'Bí quyết chăm sóc tóc hư tổn với Ntm Thịnh Nguyễn', N'/images/newspost/2016/5/sc_small_2073_2.jpg', N'Bi-quyet-cham-soc-toc-hu-ton-voi-Ntm-Thinh-Nguyen', N'Phụ nữ hiện nay thích nhuộm và uốn tóc, mà hóa chất thì sẽ không tốt cho tóc. Có cách nào để khôi phục lại vẻ bóng mượt?
Nhà tạo mẫu Thịnh Nguyễn chia sẻ nhiều thông tin hữu ích về chăm sóc tóc hư tổn.', N'<p><strong>Phụ nữ hiện nay th&iacute;ch nhuộm v&agrave; uốn t&oacute;c, m&agrave; h&oacute;a chất th&igrave; sẽ kh&ocirc;ng tốt cho t&oacute;c. C&oacute; c&aacute;ch n&agrave;o để kh&ocirc;i phục lại vẻ b&oacute;ng mượt?</strong></p>

<p>Sau một số lần l&agrave;m h&oacute;a chất, t&oacute;c sẽ bị hư tổn &iacute;t nhiều, để khắc phục bạn cần tham khảo tư vấn của thợ l&agrave;m t&oacute;c chuy&ecirc;n nghiệp trước khi chọn mua sản phẩm. Nếu t&oacute;c bị hỏng nhẹ n&ecirc;n sử dụng c&aacute;c loại dầu hấp dưỡng ẩm s&acirc;u. Nếu t&oacute;c đ&atilde; bị hỏng nặng tới mức sờ v&agrave;o thấy th&ocirc; r&aacute;p, kh&ocirc; v&agrave; thậm ch&iacute; sợi t&oacute;c đứt th&agrave;nh từng đoạn, thời kỳ n&agrave;y cần d&ugrave;ng c&aacute;c chữa trị s&acirc;u tăng cường. Phương ph&aacute;p n&agrave;y kh&ocirc;ng l&agrave;m l&agrave;nh t&oacute;c 100%, nhưng n&oacute; sẽ khắc phục được rất nhiều t&igrave;nh trạng hư tổn, gi&uacute;p t&oacute;c bạn đanh chắc hơn, dễ chải v&agrave; cho cảm gi&aacute;c mượt m&agrave;, dễ chịu.</p>

<p><img alt="Mái tóc khô và hư tổn" src="/images/images/241.jpg" /></p>

<p>M&aacute;i t&oacute;c kh&ocirc; v&agrave; hư tổn v&agrave;o m&ugrave;a đ&ocirc;ng.</p>

<p><strong>Thường th&igrave; phụ nữ rất quan t&acirc;m đến chăm s&oacute;c da nhưng lại qu&ecirc;n đi m&aacute;i</strong><strong>&nbsp;t&oacute;c. Mong anh tư vấn cho độc giả c&aacute;ch chăm s&oacute;c t&oacute;c dễ &aacute;p dụng.</strong></p>

<p>Hiệu quả nhất l&agrave; chăm s&oacute;c ph&ugrave; hợp với t&igrave;nh trạng t&oacute;c v&agrave; da đầu ở từng thời điểm, thể hiện qua 3 yếu tố: chất liệu t&oacute;c (mỏng, d&agrave;y, khỏe, đ&atilde; qua xử l&yacute; h&oacute;a chất, t&oacute;c hư tổn&hellip;), t&igrave;nh trạng da đầu (da đầu c&oacute; g&agrave;u, da đầu nhờn, hay kh&ocirc;&hellip;) v&agrave; kiểu t&oacute;c (t&oacute;c d&agrave;i, ngắn, uốn, duỗi hay nhuộm&hellip;).</p>

<p>V&iacute; dụ: nếu t&oacute;c bạn khỏe, kh&ocirc;ng hỏng, kh&ocirc;ng c&oacute; vấn đề về da đầu v&agrave; xoăn, bạn c&oacute; thể chỉ cần sử dụng 2 sản phẩm l&agrave; dầu gội v&agrave; xả d&agrave;nh cho t&oacute;c xoăn, đồng thời bạn c&oacute; thể hấp dầu &ocirc;-z&ocirc;n 1 tuần/lần để dưỡng ẩm v&agrave; l&agrave;m khỏe t&oacute;c v&igrave; t&oacute;c xoăn thường hay bị kh&ocirc;.</p>

<p><img alt="Tóc sau khi được chăm sóc tại Belle hair salon" src="/images/images/242.jpg" /></p>

<p><strong>Nhiều phụ nữ rất th&iacute;ch hấp dầu, c&oacute; thể gọi l&agrave; lạm dụng qu&aacute; mức. Điều n&agrave;y c&oacute; tốt cho t&oacute;c?</strong></p>

<p>Hấp dầu l&agrave; việc sử dụng sản phẩm chăm s&oacute;c c&oacute; độ PH thấp, c&oacute; chứa h&agrave;m lượng dưỡng ẩm lớn v&agrave; dưỡng chất tăng cường sức khỏe, độ su&ocirc;n mềm v&agrave; b&oacute;ng mượt cho t&oacute;c. Việc hấp dầu t&ugrave;y thuộc v&agrave;o sức khỏe t&oacute;c ở từng thời điểm cụ thể. Nếu sợi t&oacute;c d&agrave;y, đanh tự nhi&ecirc;n v&agrave; khỏe th&igrave; c&oacute; thể hấp dầu 1 lần/tuần, sử dụng hấp &ocirc; z&ocirc;n nhiệt độ cao. Nếu sợi t&oacute;c mỏng tự nhi&ecirc;n, khỏe cũng c&oacute; thể hấp dầu &ocirc; z&ocirc;n 1 lần/tuần với nguồn nhiệt thấp hơn. Đối với t&oacute;c hỏng v&agrave; đ&atilde; qua xử l&yacute; h&oacute;a chất nhiều lần, kh&ocirc;ng n&ecirc;n d&ugrave;ng nhiệt l&uacute;c n&agrave;y v&igrave; nhiệt c&oacute; t&aacute;c dụng mở bề mặt t&oacute;c s&acirc;u hơn, tốt nhất n&ecirc;n hấp nguội. Kh&ocirc;ng n&ecirc;n hấp dầu qu&aacute; nhiều lần v&igrave; nếu t&oacute;c khỏe b&igrave;nh thường hấp nhiều c&oacute; thể khiến t&oacute;c bị bết, nặng, t&oacute;c kh&ocirc;ng nhẹ, tơi v&agrave; l&atilde;ng ph&iacute;.</p>

<p>NTM Thịnh Nguyễn</p>
', CAST(0x0000A65000AEB02E AS DateTime), 0, N'vi', N'chăm sóc tóc, tóc khô, tóc hư tổn', N'Phụ nữ hiện nay thích nhuộm và uốn tóc, mà hóa chất thì sẽ không tốt cho tóc. Có cách nào để khôi phục lại vẻ bóng mượt?
Nhà tạo mẫu Thịnh Nguyễn chia sẻ nhiều thông tin hữu ích về chăm sóc tóc hư tổn.', N'Bí quyết chăm sóc tóc hư tổn với Ntm Thịnh Nguyễn', 1, 1, CAST(0x0000A60900B91E57 AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (29, 65, N'The argan oil story of Moroccanoil', N'/images/newspost/2016/6/sc_small_2069_1.jpg', N'The-argan-oil-story-of-Moroccanoil', N'Argan trees grow and tenaciously survive in semi-desert areas of the Mediterranean. The deep roots and small leaves of the argan tree allow it to resist arid winds and water loss, resulting in a nut with a unique oil profile.', N'<p><img alt="" src="/images/images/argan_secondary.jpg" style="float:left; height:426px; margin-left:10px; margin-right:10px; width:400px" /><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">The argan oil story of Moroccanoil</span></span></p>

<p>Argan trees grow and tenaciously survive in semi-desert areas of the Mediterranean. The deep roots and small leaves of the argan tree allow it to resist arid winds and water loss, resulting in a nut with a unique oil profile.<br />
Pure argan oil is a rare and precious oil that is harvested and extracted from the nut of the argan tree. For centuries, women across the Mediterranean have used argan oil in their beauty regimen for vibrant, healthy-looking skin and hair.</p>

<p>&nbsp;</p>

<p><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">ARGAN OIL BENEFITS</span></span></p>

<p>Moroccanoil was inspired by the transformative power of argan oil. Rich in vitamins, minerals and antioxidants, this age-old beauty secret has many uses, helping to hydrate and soften your hair, face, body and nails.&nbsp;<br />
<br />
With its high content of antioxidants, essential fatty acids and Vitamin E, the benefits of argan oil naturally help revitalize skin, increase hair&rsquo;s elasticity and consistently restore shine to dull, lifeless hair. It is a powerful antioxidant, UV-protector and free-radical neutralizer.</p>

<p><br />
Argan oil for hair leaves it beautiful, shiny and nourished with each use. Argan oil for skin luxuriously hydrates and infuses it with moisture. Argan oil has also been known to help reduce the appearance of wrinkles.</p>

<p><img alt="" src="/images/images/argan_benefits_1.jpg" style="float:right; height:300px; margin-left:10px; margin-right:10px; width:400px" />&nbsp;</p>

<p><span style="font-size:18px">ARGAN OIL BENEFITS123</span></p>

<p>MOROCCANOIL WAS INSPIRED BY THE TRANSFORMATIVE POWER OF ARGAN OIL. RICH IN VITAMINS, MINERALS AND ANTIOXIDANTS, THIS AGE-OLD BEAUTY SECRET HAS MANY USES, HELPING TO HYDRATE AND SOFTEN YOUR HAIR, FACE, BODY AND NAILS.&nbsp;<br />
<br />
WITH ITS HIGH CONTENT OF ANTIOXIDANTS, ESSENTIAL FATTY ACIDS AND VITAMIN E, THE BENEFITS OF ARGAN OIL NATURALLY HELP REVITALIZE SKIN, INCREASE HAIR&rsquo;S ELASTICITY AND CONSISTENTLY RESTORE SHINE TO DULL, LIFELESS HAIR. IT IS A POWERFUL ANTIOXIDANT, UV-PROTECTOR AND FREE-RADICAL NEUTRALIZER.&nbsp;<br />
<br />
ARGAN OIL FOR HAIR LEAVES IT BEAUTIFUL, SHINY AND NOURISHED WITH EACH USE. ARGAN OIL FOR SKIN LUXURIOUSLY HYDRATES AND INFUSES IT WITH MOISTURE. ARGAN OIL HAS ALSO BEEN KNOWN TO HELP REDUCE THE APPEARANCE OF WRINKLES.</p>

<p>Moroccanoil began with the simple wish to share the transformative powers of our rejuvenating argan-oil infused formulas and adopted this tradition as the philosophy for the brand. All Moroccanoil products for hair, body and skin are infused with argan oil&mdash;signature to the brand.&nbsp;<br />
<br />
Moroccanoil only sources the highest quality argan oil originating from argan trees grown in Morocco. The argan oil used in all our hair products and skin products are manufactured by a cold-press process.<br />
<br />
Pure Argan Oil by Moroccanoil Body&trade; is 100% pure, with no additives, colorants or preservatives. It is fragrance-free, and is perfect to use on your skin or hair for a luxurious and invigorating experience.&nbsp;<br />
<br />
Moroccanoil continues to be the leader in oil-infused hair and body products. It is our passion to deliver argan oil-infused beauty, every day, with products that truly outshine the rest.&nbsp;<br />
<br />
We believe in #ArganEveryDay.</p>
', CAST(0x0000A65000AEB1B4 AS DateTime), 0, N'vi', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', 1, 1, CAST(0x0000A609011DE819 AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (30, 65, N'The argan oil story of Moroccanoil', N'/images/newspost/2016/6/sc_small_2069_1.jpg', N'The-argan-oil-story-of-Moroccanoil', N'Argan trees grow and tenaciously survive in semi-desert areas of the Mediterranean. The deep roots and small leaves of the argan tree allow it to resist arid winds and water loss, resulting in a nut with a unique oil profile.', N'<p><img alt="" src="/images/images/argan_secondary.jpg" style="float:left; height:426px; margin-left:10px; margin-right:10px; width:400px" /><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">The argan oil story of Moroccanoil</span></span></p>', CAST(0x0000A61800AEE12A AS DateTime), NULL, N'vi', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', 1, 1, CAST(0x0000A609011DE819 AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (32, 80, N'The argan oil story of Moroccanoil', N'/images/newspost/2016/6/sc_small_2069_1.jpg', N'The-argan-oil-story-of-Moroccanoil', N'Argan trees grow and tenaciously survive in semi-desert areas of the Mediterranean. The deep roots and small leaves of the argan tree allow it to resist arid winds and water loss, resulting in a nut with a unique oil profile.', N'<p><img alt="" src="/images/images/argan_secondary.jpg" style="float:left; height:426px; margin-left:10px; margin-right:10px; width:400px" /><span style="font-family:arial,helvetica,sans-serif"><span style="font-size:20px">The argan oil story of Moroccanoil</span></span></p>', CAST(0x0000A61800AEE12A AS DateTime), NULL, N'vi', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', N'The argan oil story of Moroccanoil', 1, 1, CAST(0x0000A609011DE819 AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (33, 113, N'Ứng dụng công nghệ laser –YAG trong xóa xăm.', N'/images/newspost/2016/7/sc_small_2106_beautiful-asian-girl-tattoo-on-arm-1.jpg', N'Ung-dung-cong-nghe-laser-–YAG-trong-xoa-xam', N'Hình xăm thể hiện tính thẩm mỹ, ấn tượng về tính cách mạnh bạo, được du nhập vào Việt Nam. Tuy nhiên với nền văn hóa Phương Đông ngàn năm gốc rễ vốn ăn sâu vào tiềm thức của mỗi người thì làn da “thanh bạch” được tôn trọng hơn, cả về góc độ đạo đức và thẩm mỹ.', N'<p>Với những vết xăm, theo thời gian ch&uacute;ng sẽ nh&ograve;a đi, biến dạng v&agrave; xấu x&iacute;, hơn nữa ở mỗi thời điểm suy nghĩ v&agrave; vị tr&iacute; x&atilde; hội của mỗi người thay đổi do đ&oacute; h&igrave;nh xăm cũng kh&ocirc;ng c&ograve;n ph&ugrave; hợp. Vậy c&oacute; thể x&oacute;a c&aacute;c h&igrave;nh xăm đ&atilde; ăn s&acirc;u v&agrave;o da thịt ch&uacute;ng ta hay kh&ocirc;ng?</p>

<p><img alt="" src="/images/images/3.jpg" style="width: 717px; height: 538px;" /></p>

<p>C&oacute; rất nhiều c&aacute;ch để x&oacute;a xăm, như:</p>

<p>1. Xăm chồng l&ecirc;n h&igrave;nh xăm cũ để lấp đi, hoặc xăm mới;</p>

<p>2. Cắt bỏ lớp da xăm v&agrave; may lại: Với phương ph&aacute;p n&agrave;y c&oacute; thể phải cắt l&agrave;m nhiều lần, nếu h&igrave;nh xăm lớn - tốn k&eacute;m;</p>

<p>3. Sử dụng axit ăn m&ograve;n, d&ugrave;ng nhiệt, d&ugrave;ng muối&hellip; để ph&aacute; lớp da c&oacute; mực xăm b&ecirc;n dưới&hellip;;</p>

<p>4. Sử dụng Laser CO2 đốt lột bỏ mực xăm kh&ocirc;ng chọn lọc.</p>

<p>C&aacute;c phương ph&aacute;p n&agrave;y sẽ để lại sẹo xấu, hoặc mất sắc tố... g&acirc;y hậu quả k&eacute;m thẩm mỹ cũng như g&acirc;y đau đớn cho bệnh nh&acirc;n.</p>

<p>C&ocirc;ng nghệ laser YAG thẩm mỹ l&agrave; phương ph&aacute;p x&oacute;a h&igrave;nh xăm hiện đại nhất đang được ứng dụng phổ biến tr&ecirc;n thế giới v&agrave; ở Việt Nam hiện nay. C&aacute;c sắc tố da bị nhiễm mực xăm hấp thụ năng lượng tia laser sẽ bị vỡ ra th&agrave;nh v&ocirc; số những hạt li ti. C&aacute;c hạt m&agrave;u n&agrave;y được hệ thống bạch huyết của cơ thể đ&agrave;o thải ra ngo&agrave;i, h&igrave;nh xăm sẽ mất m&agrave; kh&ocirc;ng g&acirc;y đau đớn, kh&aacute;ch h&agrave;ng hoạt động b&igrave;nh thường sau trị liệu.</p>

<p><img alt="" src="/images/images/4(1).JPG" style="width: 717px; height: 960px;" /></p>

<p>Nhờ &ldquo;C&aacute;c xung&rdquo; laser YAG tập trung năng lượng cao độ v&agrave; được chọn lọc để hấp thụ những sắc tố da c&oacute; m&agrave;u mực xăm (tức l&agrave; chỉ c&oacute; c&aacute;c tế b&agrave;o bị nhiễm mực xăm&nbsp; bị hấp thụ, do đ&oacute; kh&ocirc;ng g&acirc;y tổn thương tới c&aacute;c tế b&agrave;o v&agrave; m&ocirc; l&acirc;n cận). Tia laser YAG đi xuy&ecirc;n qua da chỉ t&aacute;c động ph&acirc;n hủy từng nh&oacute;m m&agrave;u mực xăm ph&ugrave; hợp với bước s&oacute;ng của tia. Laser với bước s&oacute;ng 1.064nm ph&ugrave; hợp với ph&acirc;n hủy m&agrave;u mực xăm đen, xanh đen, trong khi bước s&oacute;ng 532nm ph&ugrave; hợp với ph&acirc;n hủy m&agrave;u đỏ, 585nm ph&acirc;n hủy m&agrave;u xanh da trời, 650 nm ph&acirc;n hủy m&agrave;u xanh l&aacute; c&acirc;y&hellip; C&aacute;c m&agrave;u mực xăm đen, xanh đen, đỏ tương đối dễ ph&acirc;n hủy (dễ x&oacute;a) hơn c&aacute;c m&agrave;u xanh l&aacute;, v&agrave;ng, xanh da trời&hellip;.</p>

<p><img alt="" src="/images/images/Truoc-xoa-sam.jpg" style="width: 267px; height: 300px;" /><img alt="" src="/images/images/sau-xoa-xam.jpg" style="width: 450px; height: 300px;" /></p>

<p style="text-align: center;"><em>Trước v&agrave; sau x&oacute;a xăm tại Spa Linh linh</em></p>

<p>Việc x&oacute;a xăm được thực hiện ở hầu hết c&aacute;c cơ sở thẩm mỹ, tuy nhi&ecirc;n người ti&ecirc;u d&ugrave;ng th&ocirc;ng th&aacute;i n&ecirc;n chọn những cơ sở lớn, uy t&iacute;n l&acirc;u năm , với đội ngũ y b&aacute;c sỹ v&agrave; chuy&ecirc;n vi&ecirc;n c&oacute; tay nghề cao trong việc chăm s&oacute;c sắc đẹp để đạt được kết quả mong muốn</p>

<p><img alt="" src="/images/images/xoa-hinh-xam-1.jpg" style="width: 717px; height: 478px;" /></p>

<p style="text-align: center;"><i>Chuy&ecirc;n vi&ecirc;n kỹ thuật thực hiện x&oacute;a xăm bằng c&ocirc;ng nghệ Laser</i></p>

<p><i><img alt="" src="/images/images/xoa_xam.jpg" style="width: 432px; height: 163px;" /></i></p>

<p><i>Kết quả x&oacute;a xăm bằng c&ocirc;ng nghệ Laser Q-Switched</i><i>&nbsp;</i></p>

<p align="right">Tham khảo gi&aacute; c&aacute;c dịch vụ của Spa Linh Linh tại&nbsp;<a href="/#">đ&acirc;y</a></p>
', CAST(0x0000A64F00E264A9 AS DateTime), 0, N'vi', N'Ứng dụng công nghệ laser –YAG trong xóa xăm.', N'Ứng dụng công nghệ laser –YAG trong xóa xăm.', N'Ứng dụng công nghệ laser –YAG trong xóa xăm.', 1, 1, CAST(0x0000A64F00E187D4 AS DateTime))
INSERT [dbo].[_Post] ([PostID], [CatelogID], [PostName], [ImagePath], [Link], [Summary], [PostContent], [DateModified], [IsHot], [Lang], [Keyword], [Description], [Title], [OrderDisplay], [Approve], [CreateDate]) VALUES (34, 114, N'Giảm béo an toàn với Lipo X Cool', N'/images/newspost/2016/7/sc_small_2066_dayluicondaudau1.jpg', N'Giam-beo-an-toan-voi-Lipo-X-Cool', N'Spalinhlinh ơi, Em năm nay mới 24 tuổi nhưng đã có mỡ bụng.Có lẽ là do làm việc văn phòng ít vận động quá. Em rất ngại khi đi biển mặc bikini hoặc là mặc những bộ quần áo bó sát. Em cũng có tham gia một số lớp thể dục, dùng thuốc giảm cân nhưng chưa hiệu quả và lâu dài. Em có tìm hiểu được biết công nghệ Lipo X Cool của bên mình. Spalinhlinh có thể tư vấn giúp em về công nghệ này không ạ? (Thu Hằng, Hà Nội)', N'<p>Cảm ơn bạn Thu Hằng đ&atilde; gửi c&acirc;u hỏi đến Spalinhlinh. Hiện nay do c&ocirc;ng việc ngồi văn ph&ograve;ng &iacute;t hoạt động n&ecirc;n nhiều bạn g&aacute;i gặp lo lắng với v&ograve;ng 2 kh&ocirc;ng thon gọn.</p>

<p>Tr&ecirc;n thị trường c&oacute; rất nhiều loại thuốc giảm b&eacute;o nhưng l&acirc;u c&oacute; hiệu quả. Ngo&agrave;i ra nếu uống thuốc m&agrave; kh&ocirc;ng c&oacute; sự chỉ dẫn của b&aacute;c sĩ th&igrave; sẽ rất c&oacute; hại cho sức khỏe. Tuy nhi&ecirc;n, bạn Hằng kh&ocirc;ng n&ecirc;n qu&aacute; lo lắng v&igrave; với c&aacute;c c&ocirc;ng nghệ giảm b&eacute;o ti&ecirc;n tiến hiện nay th&igrave; việc giảm b&eacute;o an to&agrave;n v&agrave; hiệu quả l&acirc;u d&agrave;i l&agrave; trong tầm với.</p>

<p><img alt="" src="/images/images/cong-nghe-tri-lipo.jpg" style="width: 450px; height: 318px;" /></p>

<p>Đ&uacute;ng như bạn Hằng c&oacute; n&oacute;i, Spalinhlinh đang ứng dụng c&ocirc;ng nghệ Lipo X Cool v&agrave;o dịch vụ giảm b&eacute;o. Đ&acirc;y được đ&aacute;nh gi&aacute; l&agrave; c&ocirc;ng nghệ giảm b&eacute;o h&agrave;ng đầu tr&ecirc;n thế giới. Với c&ocirc;ng nghệ từ Hoa Kỳ, to&agrave;n bộ m&ocirc; mỡ thừa sẽ được h&oacute;a lỏng ho&agrave;n to&agrave;n dưới t&aacute;c động của s&oacute;ng si&ecirc;u &acirc;m hội tụ, c&aacute;c b&oacute; cơ v&agrave; da sẽ được k&eacute;o căng tối đa nhờ t&aacute;c động của hệ thống &aacute;nh s&aacute;ng hồng ngoại đa chiều sau 1 liệu tr&igrave;nh. Nhờ vậy, lượng mỡ thừa sẽ được đưa ra ngo&agrave;i m&agrave; da sẽ trở l&ecirc;n săn chắc hơn.</p>

<p><img alt="" src="/images/images/Hut-mo-dui-bang-cong-nghe-lipo-matic-2.jpg" style="width: 450px; height: 300px;" /></p>

<p>Bạn c&oacute; thể ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m rằng mọi rủi ro, nguy cơ gặp phải khi giảm b&eacute;o bằng c&aacute;c c&ocirc;ng nghệ kh&aacute;c sẽ kh&ocirc;ng xảy ra với Lipo X Cool. C&ocirc;ng nghệ n&agrave;y đ&atilde; được Bộ Y Tế, tổ chức FDA cấp chứng nhận về mức độ an to&agrave;n đối với người sử dụng. Rất nhiều kh&aacute;ch h&agrave;ng ở nhiều độ tuổi đ&atilde; trải nghiệm dịch vụ giảm b&eacute;o bằng Lipo X Cool tại Spalinhlinh v&agrave; ho&agrave;n to&agrave;n h&agrave;i l&ograve;ng về chất lượng.</p>

<p>Nếu c&ograve;n băn khoăn hay thắc mắc g&igrave;, bạn Thu Hằng c&oacute; thể qua trực tiếp Spalinhlinh để được tư vấn cụ thể v&agrave; chi tiết hơn. Hoặc bạn c&oacute; thể gọi điện đến<strong>&nbsp;</strong><strong>Hotline 0966 256 666&nbsp;</strong>để được giải đ&aacute;p chu đ&aacute;o hơn nh&eacute;.</p>

<p>Ch&uacute;c bạn sớm tự tin diện những bộ quần &aacute;o gợi cảm với th&acirc;n h&igrave;nh thon gọn.&nbsp;</p>
', CAST(0x0000A64F00E7CABC AS DateTime), 0, N'vi', N'Giảm béo an toàn với Lipo X Cool', N'Giảm béo an toàn với Lipo X Cool', N'Giảm béo an toàn với Lipo X Cool', 1, 1, CAST(0x0000A64F00E7CABC AS DateTime))
SET IDENTITY_INSERT [dbo].[_Post] OFF
/****** Object:  Table [dbo].[_Payment]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[Amount] [float] NULL,
	[CreateDate] [smalldatetime] NULL,
	[PaymentContent] [nvarchar](4000) NULL,
	[PaymentMenthod] [nvarchar](50) NULL,
	[TransactionInfor] [nvarchar](250) NULL,
	[TranscactionStatus] [varchar](10) NULL,
	[Payment_type] [int] NULL,
	[Net_amount] [float] NULL,
	[Fee_amount] [float] NULL,
	[Merchant_id] [int] NULL,
	[Customer_name] [nvarchar](150) NULL,
	[Customer_email] [varchar](50) NULL,
	[Customer_phone] [varchar](50) NULL,
 CONSTRAINT [PK__Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_Payment] ON
INSERT [dbo].[_Payment] ([id], [InvoiceID], [Amount], [CreateDate], [PaymentContent], [PaymentMenthod], [TransactionInfor], [TranscactionStatus], [Payment_type], [Net_amount], [Fee_amount], [Merchant_id], [Customer_name], [Customer_email], [Customer_phone]) VALUES (1, 3, 83600, CAST(0xA64202B7 AS SmallDateTime), NULL, N'', N'Admin approve: admin', N'1', 3, NULL, NULL, NULL, N'Kenvil', N'duynvtest@gmail.com', N'0988693490')
SET IDENTITY_INSERT [dbo].[_Payment] OFF
/****** Object:  Table [dbo].[_Pages]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](100) NOT NULL,
	[Link] [nvarchar](100) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Summary] [nvarchar](500) NULL,
	[PageContent] [ntext] NULL,
	[DateModified] [datetime] NULL,
	[Show] [bit] NULL,
	[Lang] [nvarchar](10) NULL,
	[Keyword] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[OrderDisplay] [int] NULL,
 CONSTRAINT [PK__Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Pages] ON
INSERT [dbo].[_Pages] ([PageID], [PageName], [Link], [ImagePath], [Summary], [PageContent], [DateModified], [Show], [Lang], [Keyword], [Description], [Title], [OrderDisplay]) VALUES (2, N'Tonymoly Việt Nam', N'Tonymoly-Viet-Nam', N'0', N'TONYMOLY - nơi ẩn chứa câu chuyện đẹp

Tonymoly là thương hiệu mỹ phẩm trang điểm tạo vẻ đẹp toàn diện với ý nghĩa là ‘chứa dựng vẻ đẹp’ được kết hợp từ từ tiếng Anh ‘Tony’ (vẻ đẹp quyến rũ, có đường nét) và từ tiếng Nhật ‘Moly’(ẩn chứa).', N'<p><strong>Kh&aacute;i niệm thương hiệu</strong></p>

<p><strong>Tonymoly</strong>&nbsp;ch&uacute; trọng đưa ra những b&iacute; quyết trang điểm gi&uacute;p chị em phụ nữ c&oacute; thể tự l&agrave;m đẹp cho bản th&acirc;n, c&oacute; c&aacute;ch trang điểm ph&ugrave; hợp với l&agrave;n da của m&igrave;nh hơn l&agrave; chỉ đưa ra c&aacute;c sản phẩm tốt.</p>

<p><strong>Tonymoly</strong>&nbsp;gi&uacute;p cho c&aacute;c c&ocirc; g&aacute;i- những người lu&ocirc;n mong muốn c&oacute; thể giữ cho l&agrave;n da mịn m&agrave;ng v&agrave; lu&ocirc;n được l&agrave;m mới m&igrave;nh, c&oacute; thể thực hiện được giấc mơ l&agrave;m đẹp đ&oacute;.</p>

<p><strong>Biểu tượng thương hiệu</strong></p>

<p>Biểu tượng của&nbsp;<strong>Tonymoly</strong>&nbsp;mang &yacute; nghĩa &ldquo; Nụ cười hạnh ph&uacute;c ẩn chứa một c&acirc;u chuyện đẹp&rdquo;.</p>

<p>Biểu tượng của&nbsp;<strong>Tonymoly</strong>&nbsp;được diễn tả một c&aacute;ch ngắn gọn, s&uacute;c t&iacute;ch, biểu trưng cho thương hiệu của&nbsp;<strong>Tonymoly</strong>&nbsp;: ng&agrave;y c&agrave;ng đẹp hơn.</p>

<p><strong>Tonymoly</strong>&nbsp;l&agrave; thương hiệu c&oacute; nhiều c&aacute;c mặt h&agrave;ng v&agrave; c&aacute;c mặt h&agrave;ng đều được chiết xuất từ những th&agrave;nh phần c&oacute; chất lượng cao.<strong>Tonymoly</strong>&nbsp;đang nỗ lực nhiều hơn nữa để bất cứ l&uacute;c n&agrave;o nơi đ&acirc;y cũng l&agrave; nơi tiềm ẩn những c&acirc;u chuyện đẹp.</p>

<p><strong>Tầm nh&igrave;n thương hiệu</strong></p>

<ul>
	<li><em>Chất lượng cao v&agrave; gi&aacute; cả hợp l&yacute;</em><br />
	&Aacute;p dụng những kĩ thuật ti&ecirc;n tiến,&nbsp;<strong>Tonymoly&nbsp;</strong>kh&ocirc;ng ngừng cung cấp những sản phẩm c&oacute; chất lượng cao, l&agrave; nơi chuy&ecirc;n cung cấp cho người ti&ecirc;u d&ugrave;ng những mặt h&agrave;ng c&oacute; chất lượng cao với gi&aacute; cả hợp l&iacute;.</li>
	<li><em>Sạch v&agrave; đơn giản</em><strong>Tonymoly</strong>&nbsp;ng&agrave;y c&agrave;ng đẹp hơn&nbsp;<br />
	Với những sản phẩm c&oacute; thiết kế đơn giản về mẫu m&atilde; v&agrave; c&oacute; khả năng bảo vệ da của phụ nữ,&nbsp;<strong>Tonymoly</strong>&nbsp;đang hết sức nỗ lực đem lại nhiều sản phẩm v&agrave; dịch vụ tốt hơn nữa để c&oacute; thể gi&uacute;p cho c&aacute;c kh&aacute;ch h&agrave;ng của m&igrave;nh &ndash; những người sử dụng sản phẩm của ch&uacute;ng t&ocirc;i.</li>
</ul>
', CAST(0x0000A635013692E3 AS DateTime), 1, N'vi', N'Tonymoly Việt Nam', N'Tonymoly Việt Nam', N'Tonymoly Việt Nam', 1)
INSERT [dbo].[_Pages] ([PageID], [PageName], [Link], [ImagePath], [Summary], [PageContent], [DateModified], [Show], [Lang], [Keyword], [Description], [Title], [OrderDisplay]) VALUES (8, N'The story of tonymoly', N'The-story-of-tonymoly', N'/images/static/2016/6/sc_small_2118_brandambassador_hyuna.jpg', N'TONYMMOLY is a global cosmetic brand that offers the ideal skin look

Urban Lifestyle Beauty Brand

TONY means charming, stylish in English.
MOLY means container in Japanese which carries all stylish things.

TonyMoly strives through research and ethical skin care principles to
offer the fountain of youth through careful selection of its products.', N'<p>TONYMMOLY is a global cosmetic brand that offers the ideal skin look</p>

<p>Urban Lifestyle Beauty Brand</p>

<p>TONY means charming, stylish in English.<br />
MOLY means container in Japanese which carries all stylish things.</p>

<p>TonyMoly strives through research and ethical skin care principles to<br />
offer the fountain of youth through careful selection of its products.</p>

<p>&nbsp;</p>

<p>HISTORY</p>

<p>2006 Launched over 1,000 basic beauty care products. Opened first store in Seomyeon, Busan.</p>

<p>2008 Nationwide branch stores reached 60 stores. Signed technical partnership with F.Beauty and concluded export contract into Japan.</p>

<p>2009 Expended to Thailand, Hong Kong, and Singapore. Opened TonyMoly&rsquo;s 100th store.</p>

<p>2010 Opened a store at the Shilla Duty Free. Entered Malaysia. Opened TonyMoly&rsquo;s 200th store.</p>

<p>2011 Opened TonyMoly&rsquo;s 250th store. Started business with QVC Home Shopping in Japan. Entered Vietnam (Tran Dang Ninh, Hanoi)</p>

<p>2012 Opened 350 stores in Korea, 80 stores overseas. Started business in Tokyo Japan, Hawaii, Jakarta Indonesia, Beverly Hills USA, Sydney Australia and Iran.</p>

<p>2013 Started business with Urban Outfitters in Canada and in U.S.A.</p>

<p>2014 Initiated business in Manhattan, New York. Began selling products at Sephora. TonyMoly members exceed 5 million.</p>

<p>2015 Annexed R&amp;I Center receives accrditation. Entered Spain in Europe and Mexico. Opened 200 stores and 2000 shop-in-shop overseas. Initiated business in Brazil, GCC, Saudi Arabia, Kuwait, Qatar, and California USA. Listed on the KOSPI in July 2015.</p>
', CAST(0x0000A6350135EDCE AS DateTime), 1, N'vi', N'the story of tonymoly', N'the story of tonymoly', N'the story of tonymoly', 2)
SET IDENTITY_INSERT [dbo].[_Pages] OFF
/****** Object:  Table [dbo].[_Link]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Summary] [nvarchar](500) NULL,
	[LinkContent] [ntext] NULL,
	[Link] [nvarchar](200) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Type] [nchar](2) NULL,
	[OrderDisplay] [int] NULL,
	[Lang] [nvarchar](10) NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Link] ON
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (4, N'Hàn Quốc', N'', N'', N'', N'', N'DT', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (5, N'so 1', N'', N'<p>&nbsp;</p>
', N'#', N'/images/link/2016/6/sc_original_2096_980975745_smuih1lk_028.jpg', N'AF', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (6, N'so 2', N'', N'<p>&nbsp;</p>
', N'#', N'/images/link/2016/6/sc_original_2096_980975745_mbqxydhv_027.jpg', N'AF', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (7, N'so 3', N'', N'<p>&nbsp;</p>
', N'#', N'/images/link/2016/6/sc_original_2097_980975745_jutobk2w_026.jpg', N'AF', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (20, N'background1', N'', N'', N'', N'/images/link/111120142148slive1.jpg', N'BG', 1, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (21, N'background2', N'', N'', N'', N'/images/link/111120142149slive3.jpg', N'BG', 3, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (22, N'background3', N'', N'', N'', N'/images/link/111120142148team.jpg', N'BG', 2, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (27, N'Việt Nam', N'', N'', N'', N'', N'DT', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (37, N'slide 2', N'', N'', N'', N'/images/link/sc_small_2066_banner54.jpg', N'SL', 2, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (38, N'slide 3', N'', N'', N'', N'/images/link/sc_small_2056_banner53.jpg', N'SL', 3, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (39, N'dự án vận chuyển mẫu', N'regular code_x', N'', N'', N'/images/link/11120141929portfolio3-1.png', N'PR', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (40, N'dự án giới thiệu 2', N'tall code_x', N'', N'', N'/images/link/11120141929portfolio3-2.png', N'PR', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (41, N'dự án mẫu 3', N'wide code_x', N'', N'', N'/images/link/11120141929portfolio3-3.png', N'PR', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (42, N'dự án mẫu 4', N'regular code_x', N'', N'', N'/images/link/11120141939portfolio3-4.png', N'PR', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (43, N'dự án mẫu 5', N'regular code_x', N'', N'', N'/images/link/11120141941portfolio3-5.png', N'PR', 5, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (44, N'dự án mẫu 6', N'regular code_y', N'', N'', N'/images/link/11120141943portfolio3-6.png', N'PR', 6, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (45, N'dự án mẫu 7', N'tall code_y', N'', N'', N'/images/link/11120141935portfolio3-7.png', N'PR', 7, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (46, N'dự án mẫu 8', N'regular code_y', N'', N'', N'/images/link/11120141825portfolio3-8.png', N'PR', 8, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (47, N'dự án mẫu 9', N'regular code_y', N'', N'', N'/images/link/11120141825portfolio3-9.png', N'PR', 9, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (48, N'dự án mẫu 10', N'regular code_z', N'', N'', N'/images/link/1112014193portfolio3-10.png', N'PR', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (49, N'dự án mẫu 11', N'regular code_z', N'', N'', N'/images/link/11120141826portfolio3-11.png', N'PR', 11, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (50, N'dự án mẫu 12', N'regular code_z', N'', N'', N'/images/link/11120141826portfolio3-12.png', N'PR', 12, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (51, N'dự án mẫu 13', N'regular code_z', N'', N'', N'/images/link/11120141822portfolio3-13.png', N'PR', 13, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (52, N'dự án mẫu 14', N'wide code_z', N'', N'', N'/images/link/11120141930portfolio3-14.png', N'PR', 14, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (53, N'dự án vận chuyển mẫu', N'regular code_x', N'', N'', N'/images/link/11120141929portfolio3-1.png', N'PR', 1, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (54, N'dự án giới thiệu 2', N'tall code_x', N'', N'', N'/images/link/11120141929portfolio3-2.png', N'PR', 2, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (55, N'dự án mẫu 3', N'wide code_x', N'', N'', N'/images/link/11120141929portfolio3-3.png', N'PR', 3, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (56, N'dự án mẫu 4', N'regular code_x', N'', N'', N'/images/link/11120141939portfolio3-4.png', N'PR', 4, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (57, N'dự án mẫu 5', N'regular code_x', N'', N'', N'/images/link/11120141941portfolio3-5.png', N'PR', 5, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (58, N'dự án mẫu 6', N'regular code_y', N'', N'', N'/images/link/11120141943portfolio3-6.png', N'PR', 6, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (59, N'dự án mẫu 7', N'tall code_y', N'', N'', N'/images/link/11120141935portfolio3-7.png', N'PR', 7, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (60, N'dự án mẫu 8', N'regular code_y', N'', N'', N'/images/link/11120141825portfolio3-8.png', N'PR', 8, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (61, N'dự án mẫu 9', N'regular code_y', N'', N'', N'/images/link/11120141825portfolio3-9.png', N'PR', 9, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (62, N'dự án mẫu 10', N'regular code_z', N'', N'', N'/images/link/1112014193portfolio3-10.png', N'PR', 10, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (63, N'dự án mẫu 11', N'regular code_z', N'', N'', N'/images/link/11120141826portfolio3-11.png', N'PR', 11, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (64, N'dự án mẫu 12', N'regular code_z', N'', N'', N'/images/link/11120141826portfolio3-12.png', N'PR', 12, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (65, N'dự án mẫu 13', N'regular code_z', N'', N'', N'/images/link/11120141822portfolio3-13.png', N'PR', 13, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (66, N'dự án mẫu 14', N'wide code_z', N'', N'', N'/images/link/11120141930portfolio3-14.png', N'PR', 14, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (67, N'banner 2', N'', N'<p>&nbsp;</p>
', N'', N'/images/link/2016/7/sc_original_2074_banner-2.jpg', N'SL', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (68, N'Robert Green', N'FPT', N'Voluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.Voluptatem accusantium doVoluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.lorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore', N'', N'/images/link/11120141930portfolio3-14.png', N'TE', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (69, N'Son Nguyen', N'SETA', N'Voluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.Voluptatem accusantium doVoluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.lorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore', N'', N'/images/link/11120141930portfolio3-14.png', N'TE', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (70, N'Hoang Duong', N'Orenj', N'Voluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.Voluptatem accusantium doVoluptatem accusantium dolorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.lorem laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore', N'', N'/images/link/11120141930portfolio3-14.png', N'TE', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (71, N'title 1', N'', N'', N'', N'/images/link/sc_small_2057_banner51.jpg', N'SL', 1, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (72, N'Nguyễn Văn B', N'Một trong 10 nhà tiếp thị Internet hàng đầu tại Mỹ, Alex Mandossian cũng là một diễn giả tràn đầy năng lượng, nhà đào tạo bán hàng và tác giả của nhiều cuốn sách. Ông hiện đang là Giám đốc điều hành của một công ty xuất bản và tiếp thị điện tử có tên là Heritage House Publishing, là người sáng lập ra Viện Tiếp thị điện tử (Electronic Marketing Institute).', N'<h3>Primary Skills</h3>

<ul>
	<li><a href="#">Web and graphich Design</a></li>
	<li><a href="#">Website development</a></li>
	<li><a href="#">Mobile game design</a></li>
	<li><a href="#">Mobile app developmemt</a></li>
	<li><a href="#">CMS integration</a></li>
	<li><a href="#">Mobile games</a></li>
	<li><a href="#">Software development</a></li>
</ul>
', N'Nguyen-Van-B', N'/images/link/sc_small_2077_2.jpg', N'SP', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (73, N'Nguyễn Văn C', N'Ông Nguyễn Văn C', N'<p>&Ocirc;ng Nguyễn Văn C</p>
', N'Nguyen-Van-C', N'/images/link/sc_small_2082_4.jpg', N'SP', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (74, N'Nguyễn Thị D', N'Bà Nguyễn Thị D', N'<p>&nbsp;B&agrave; Nguyễn Thị D</p>
', N'Nguyen-Thi-D', N'/images/link/sc_small_2081_5.jpg', N'SP', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (75, N'Nguyễn Anh T', N'Nguyễn Anh T', N'<p>&nbsp;Nguyễn Anh T</p>
', N'Nguyen-Anh-T', N'/images/link/sc_small_2077_1.jpg', N'SP', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (76, N'Nguyễn Tuấn G', N'Nguyễn Tuấn G', N'<p>Nguyễn Tuấn G</p>
', N'Nguyen-Tuan-G', N'/images/link/sc_small_2082_6.jpg', N'SP', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (77, N'Video 1', N'', N'<p><iframe allowfullscreen="" frameborder="0" height="280" src="https://www.youtube.com/embed/9xYVmpVms70" width="100%"></iframe></p>
', N'', N'0', N'VD', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (78, N'Video 2', N'', N'<iframe width="170" src="https://www.youtube.com/embed/3MWqCp01TcA" frameborder="0" allowfullscreen></iframe>', N'', N'0', N'VD', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (79, N'video 3', N'', N'<iframe width="170" src="https://www.youtube.com/embed/3MWqCp01TcA" frameborder="0" allowfullscreen></iframe>', N'', N'0', N'VD', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (80, N'banner 1', N'', N'<p>&nbsp;</p>
', N'/vi/news/posts', N'/images/link/2016/7/sc_original_2074_banner-1.jpg', N'SL', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (84, N'Tư vấn thiết kế', N'', N'', N'', N'/images/link/231220141524feature_1.png', N'SR', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (85, N'Xây dựng cơ bản', N'', N'', N'', N'/images/link/231220141525feature_2.png', N'SR', 10, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (86, N'Cầu đường', N'', N'', N'', N'/images/link/231220141525feature_3.png', N'SR', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (87, N'Xây dựng công nghiệp', N'', N'', N'', N'/images/link/231220141525feature_4.png', N'SR', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (89, N'background4', N'', N'', N'', N'/images/link/111120142149slive3.jpg', N'BG', 4, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (91, N'title 4', N'slide 4', N'', N'', N'/images/link/sc_small_2057_banner52.jpg', N'SL', 4, N'en')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (98, N'video 4', N'', N'<iframe width="170" src="https://www.youtube.com/embed/3MWqCp01TcA" frameborder="0" allowfullscreen></iframe>', N'', N'0', N'VD', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (99, N'Dưỡng da', N'', N'<p>&nbsp;</p>
', N'/vi/san-pham/Duong-da-39', N'/images/link/2016/6/sc_original_2098_button_slide.png', N'BG', 1, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (100, N'Làm sạch', N'', N'<p>&nbsp;</p>
', N'/vi/san-pham/Lam-sach-40', N'/images/link/2016/6/sc_original_2098_button_slide.png', N'BG', 2, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (101, N'Toàn thân', N'', N'<p>&nbsp;</p>
', N'/vi/san-pham/Toan-than-41', N'/images/link/2016/6/sc_original_2098_button_slide.png', N'BG', 3, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (102, N'Trang điểm', N'', N'<p>&nbsp;</p>
', N'/vi/san-pham/Trang-diem-43', N'/images/link/2016/6/sc_original_2099_button_slide.png', N'BG', 4, N'vi')
INSERT [dbo].[_Link] ([ID], [Title], [Summary], [LinkContent], [Link], [ImagePath], [Type], [OrderDisplay], [Lang]) VALUES (103, N'Phụ kiện', N'', N'<p>&nbsp;</p>
', N'/vi/san-pham/Phu-kien-81', N'/images/link/2016/6/sc_original_2099_button_slide.png', N'BG', 5, N'vi')
SET IDENTITY_INSERT [dbo].[_Link] OFF
/****** Object:  Table [dbo].[_Languages]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Languages](
	[LangKey] [nchar](4) NOT NULL,
	[LangValue] [nvarchar](50) NULL,
	[OrderDisplay] [int] NULL,
	[IsUser] [bit] NULL,
 CONSTRAINT [PK__Languages] PRIMARY KEY CLUSTERED 
(
	[LangKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[_Languages] ([LangKey], [LangValue], [OrderDisplay], [IsUser]) VALUES (N'en  ', N'English', 2, 1)
INSERT [dbo].[_Languages] ([LangKey], [LangValue], [OrderDisplay], [IsUser]) VALUES (N'vi  ', N'Tiếng việt', 1, 1)
/****** Object:  Table [dbo].[_Invoices]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_Invoices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [varchar](8) NULL,
	[CreateDate] [smalldatetime] NULL,
	[InvoiceContent] [nvarchar](4000) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__Invoices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_Invoices] ON
INSERT [dbo].[_Invoices] ([id], [OrderCode], [CreateDate], [InvoiceContent], [Status]) VALUES (1, N'AMJTFW9B', CAST(0xA586035C AS SmallDateTime), NULL, 1)
INSERT [dbo].[_Invoices] ([id], [OrderCode], [CreateDate], [InvoiceContent], [Status]) VALUES (2, N'GJ4Q5UMY', CAST(0xA6340266 AS SmallDateTime), NULL, 1)
INSERT [dbo].[_Invoices] ([id], [OrderCode], [CreateDate], [InvoiceContent], [Status]) VALUES (3, N'NRLE5UM0', CAST(0xA64202B7 AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[_Invoices] OFF
/****** Object:  Table [dbo].[_Statistic]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Statistic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NOT NULL,
	[SoTruyCap] [bigint] NOT NULL,
	[year] [int] NULL,
	[month] [int] NULL,
	[total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Statistic] ON
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (50, CAST(0x0000A511017E5701 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (51, CAST(0x0000A512012FB952 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (52, CAST(0x0000A5290093807D AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (53, CAST(0x0000A52A0121DF82 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (54, CAST(0x0000A587017927DE AS DateTime), 13, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (55, CAST(0x0000A58801722EBA AS DateTime), 15, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (56, CAST(0x0000A58900B13547 AS DateTime), 18, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (57, CAST(0x0000A58A01341B91 AS DateTime), 53, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (58, CAST(0x0000A58B008EE966 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (59, CAST(0x0000A58B012C2FA9 AS DateTime), 18, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (60, CAST(0x0000A58C00CB8D07 AS DateTime), 31, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (61, CAST(0x0000A58D014F5C41 AS DateTime), 4, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (62, CAST(0x0000A58E01756C06 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (63, CAST(0x0000A58F015A1C63 AS DateTime), 6, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (64, CAST(0x0000A59000A8EC0C AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (65, CAST(0x0000A5AB00ABF1B1 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (66, CAST(0x0000A5E90187904E AS DateTime), 34, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (67, CAST(0x0000A5EA01882EDB AS DateTime), 16, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (68, CAST(0x0000A5EB0187F47B AS DateTime), 22, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (69, CAST(0x0000A5EC0147C43E AS DateTime), 9, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (70, CAST(0x0000A5ED017E0E1D AS DateTime), 30, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (71, CAST(0x0000A5EE01825AD6 AS DateTime), 42, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (72, CAST(0x0000A5F80176DE66 AS DateTime), 13, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (73, CAST(0x0000A5F901885498 AS DateTime), 22, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (74, CAST(0x0000A5FA016A87A1 AS DateTime), 40, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (75, CAST(0x0000A5FB018192FD AS DateTime), 83, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (76, CAST(0x0000A5FC0165A52E AS DateTime), 31, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (77, CAST(0x0000A5FD018AAD35 AS DateTime), 76, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (78, CAST(0x0000A5FE0181B339 AS DateTime), 54, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (79, CAST(0x0000A5FF01783F5C AS DateTime), 58, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (80, CAST(0x0000A600017AE75D AS DateTime), 36, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (81, CAST(0x0000A6010177E43F AS DateTime), 96, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (82, CAST(0x0000A602016A556F AS DateTime), 113, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (83, CAST(0x0000A603015CE33A AS DateTime), 34, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (84, CAST(0x0000A6040185183D AS DateTime), 47, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (85, CAST(0x0000A60501858514 AS DateTime), 99, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (86, CAST(0x0000A6060185F2F5 AS DateTime), 67, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (87, CAST(0x0000A6070180D3D4 AS DateTime), 54, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (88, CAST(0x0000A6080174B1F8 AS DateTime), 82, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (89, CAST(0x0000A609016C8B8F AS DateTime), 56, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (90, CAST(0x0000A60A01874269 AS DateTime), 262, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (91, CAST(0x0000A60B01893586 AS DateTime), 108, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (92, CAST(0x0000A60C0155368C AS DateTime), 76, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (93, CAST(0x0000A60D01120446 AS DateTime), 308, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (94, CAST(0x0000A61200C9847C AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (95, CAST(0x0000A612012FFEFE AS DateTime), 29, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (96, CAST(0x0000A6130127CFF4 AS DateTime), 10, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (97, CAST(0x0000A614014664A0 AS DateTime), 18, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (98, CAST(0x0000A615016C750B AS DateTime), 30, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (99, CAST(0x0000A616013B30BB AS DateTime), 19, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (100, CAST(0x0000A61700C94527 AS DateTime), 9, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (101, CAST(0x0000A6180126B523 AS DateTime), 23, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (102, CAST(0x0000A61900DF19BA AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (103, CAST(0x0000A6190118CE7C AS DateTime), 14, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (104, CAST(0x0000A61A0119C1A5 AS DateTime), 8, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (105, CAST(0x0000A61D0134D3D6 AS DateTime), 7, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (106, CAST(0x0000A61E00C25DEE AS DateTime), 6, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (107, CAST(0x0000A61F011A37E1 AS DateTime), 7, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (108, CAST(0x0000A6200124946B AS DateTime), 12, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (109, CAST(0x0000A62101253134 AS DateTime), 30, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (110, CAST(0x0000A62400ABAA02 AS DateTime), 4, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (111, CAST(0x0000A62800B22D62 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (112, CAST(0x0000A62B012065EA AS DateTime), 20, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (113, CAST(0x0000A62C018AB150 AS DateTime), 52, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (114, CAST(0x0000A62D0177B8C9 AS DateTime), 19, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (115, CAST(0x0000A62E016C0B09 AS DateTime), 96, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (116, CAST(0x0000A62F018A796D AS DateTime), 181, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (117, CAST(0x0000A630015396C8 AS DateTime), 290, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (118, CAST(0x0000A631017FCE6E AS DateTime), 118, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (119, CAST(0x0000A6320170E7D3 AS DateTime), 86, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (120, CAST(0x0000A63300155315 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (121, CAST(0x0000A6330185DBF6 AS DateTime), 96, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (122, CAST(0x0000A634018ABDEA AS DateTime), 188, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (123, CAST(0x0000A63501792463 AS DateTime), 200, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (124, CAST(0x0000A636017535E3 AS DateTime), 326, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (125, CAST(0x0000A637016C0863 AS DateTime), 84, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (126, CAST(0x0000A638018AB069 AS DateTime), 617, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (127, CAST(0x0000A639017D15ED AS DateTime), 330, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (128, CAST(0x0000A63A018AB359 AS DateTime), 99, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (129, CAST(0x0000A63B018A90DB AS DateTime), 312, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (130, CAST(0x0000A63C01883FB3 AS DateTime), 129, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (131, CAST(0x0000A63D018AD8F0 AS DateTime), 120, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (132, CAST(0x0000A63E01832B46 AS DateTime), 319, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (133, CAST(0x0000A63F015EB098 AS DateTime), 427, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (134, CAST(0x0000A6400188D7F5 AS DateTime), 220, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (135, CAST(0x0000A641017B7B87 AS DateTime), 333, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (136, CAST(0x0000A64201866A6D AS DateTime), 207, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (137, CAST(0x0000A643018A2769 AS DateTime), 511, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (138, CAST(0x0000A6440189FE13 AS DateTime), 137, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (139, CAST(0x0000A645018964D4 AS DateTime), 286, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (140, CAST(0x0000A64601508E44 AS DateTime), 144, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (141, CAST(0x0000A647018A6980 AS DateTime), 452, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (142, CAST(0x0000A64801880D60 AS DateTime), 154, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (143, CAST(0x0000A64900F5C73F AS DateTime), 29, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (144, CAST(0x0000A64A0109A07E AS DateTime), 7, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (145, CAST(0x0000A64B00E3B7DD AS DateTime), 12, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (146, CAST(0x0000A64F008A74E0 AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (147, CAST(0x0000A64F011B9535 AS DateTime), 11, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (148, CAST(0x0000A65000E77054 AS DateTime), 7, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (149, CAST(0x0000A65100C08A97 AS DateTime), 8, NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (150, CAST(0x0000A65F00D986DC AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (151, CAST(0x0000A66A012EF26E AS DateTime), 12, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (152, CAST(0x0000A66B011006D7 AS DateTime), 5, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (153, CAST(0x0000A66C0129929F AS DateTime), 3, NULL, NULL, NULL)
INSERT [dbo].[_Statistic] ([ID], [ThoiGian], [SoTruyCap], [year], [month], [total]) VALUES (154, CAST(0x0000A67100B842BA AS DateTime), 29, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[_Statistic] OFF
/****** Object:  Table [dbo].[_Role]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
	[Des] [nvarchar](500) NOT NULL,
	[Role] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Role] ON
INSERT [dbo].[_Role] ([ID], [RoleName], [Des], [Role]) VALUES (1, N'Admin', N'Quản trị cao nhất', N'Admin')
INSERT [dbo].[_Role] ([ID], [RoleName], [Des], [Role]) VALUES (2, N'Client', N'Người dùng', N'Client')
SET IDENTITY_INSERT [dbo].[_Role] OFF
/****** Object:  Table [dbo].[_Rating]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NULL,
	[ip] [nvarchar](50) NULL,
	[name] [nvarchar](250) NULL,
	[email] [nvarchar](30) NULL,
	[contents] [nvarchar](250) NULL,
	[itemId] [int] NULL,
 CONSTRAINT [PK__Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Rating] ON
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (1, 3, N'127.0.0.1', N'a', N'abc@gmail.com', N'abc', 75)
INSERT [dbo].[_Rating] ([RatingId], [Rating], [ip], [name], [email], [contents], [itemId]) VALUES (2, 5, N'127.0.0.1', N'b', N'abc123@gmai.com', N'aaaa', 75)
SET IDENTITY_INSERT [dbo].[_Rating] OFF
/****** Object:  Table [dbo].[_ProductTag]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_ProductTag](
	[ProductTagID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Tag] [nvarchar](50) NULL,
	[Link] [varchar](50) NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ProductTagID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_ProductTag] ON
INSERT [dbo].[_ProductTag] ([ProductTagID], [ProductID], [Tag], [Link]) VALUES (3, 1, N'mạch nạp', N'mach-nap')
INSERT [dbo].[_ProductTag] ([ProductTagID], [ProductID], [Tag], [Link]) VALUES (4, 1, N'arm', N'arm')
SET IDENTITY_INSERT [dbo].[_ProductTag] OFF
/****** Object:  Table [dbo].[_ProductProperty]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_ProductProperty](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](500) NULL,
	[Type] [nvarchar](50) NULL,
	[ProID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__ProductProperty] PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_ProductProperty] ON
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'yellow', N'#eef206', N'COL', 2)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'blue', N'#2400ff', N'COL', 5)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'S', N'S', N'SIZ', 8)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'S', N'S', N'SIZ', 9)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'S', N'S', N'SIZ', 10)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'S', N'S', N'SIZ', 11)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'S', N'S', N'SIZ', 12)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'S', N'S', N'SIZ', 13)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'S', N'S', N'SIZ', 14)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'S', N'S', N'SIZ', 15)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'S', N'S', N'SIZ', 16)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'S', N'S', N'SIZ', 17)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'S', N'S', N'SIZ', 18)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'S', N'S', N'SIZ', 19)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'S', N'S', N'SIZ', 20)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'S', N'S', N'SIZ', 21)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'S', N'S', N'SIZ', 22)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'S', N'S', N'SIZ', 23)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'S', N'S', N'SIZ', 24)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'S', N'S', N'SIZ', 25)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'S', N'S', N'SIZ', 26)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'S', N'S', N'SIZ', 27)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'S', N'S', N'SIZ', 28)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'S', N'S', N'SIZ', 29)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'S', N'S', N'SIZ', 30)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'S', N'S', N'SIZ', 31)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'S', N'S', N'SIZ', 32)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'S', N'S', N'SIZ', 34)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'S', N'S', N'SIZ', 35)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'S', N'S', N'SIZ', 36)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'S', N'S', N'SIZ', 37)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'M', N'M', N'SIZ', 38)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'M', N'M', N'SIZ', 39)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'M', N'M', N'SIZ', 40)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'M', N'M', N'SIZ', 41)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'M', N'M', N'SIZ', 42)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'M', N'M', N'SIZ', 43)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'M', N'M', N'SIZ', 44)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'M', N'M', N'SIZ', 45)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'M', N'M', N'SIZ', 46)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'M', N'M', N'SIZ', 47)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'M', N'M', N'SIZ', 48)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'M', N'M', N'SIZ', 49)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'M', N'M', N'SIZ', 50)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'M', N'M', N'SIZ', 51)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'M', N'M', N'SIZ', 52)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'M', N'M', N'SIZ', 53)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'M', N'M', N'SIZ', 54)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'M', N'M', N'SIZ', 55)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'M', N'M', N'SIZ', 56)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'M', N'M', N'SIZ', 57)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'M', N'M', N'SIZ', 58)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'M', N'M', N'SIZ', 59)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'M', N'M', N'SIZ', 60)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'M', N'M', N'SIZ', 61)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'M', N'M', N'SIZ', 62)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'M', N'M', N'SIZ', 64)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'M', N'M', N'SIZ', 65)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'M', N'M', N'SIZ', 66)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'M', N'M', N'SIZ', 67)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'L', N'L', N'SIZ', 68)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'L', N'L', N'SIZ', 69)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'L', N'L', N'SIZ', 70)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'L', N'L', N'SIZ', 71)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'L', N'L', N'SIZ', 72)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'L', N'L', N'SIZ', 73)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'L', N'L', N'SIZ', 74)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'L', N'L', N'SIZ', 75)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'L', N'L', N'SIZ', 76)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'L', N'L', N'SIZ', 77)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'L', N'L', N'SIZ', 78)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'L', N'L', N'SIZ', 79)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'L', N'L', N'SIZ', 80)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'L', N'L', N'SIZ', 81)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'L', N'L', N'SIZ', 82)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'L', N'L', N'SIZ', 83)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'L', N'L', N'SIZ', 84)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'L', N'L', N'SIZ', 85)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'L', N'L', N'SIZ', 86)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'L', N'L', N'SIZ', 87)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'L', N'L', N'SIZ', 88)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'L', N'L', N'SIZ', 89)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'L', N'L', N'SIZ', 90)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'L', N'L', N'SIZ', 91)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'L', N'L', N'SIZ', 92)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'L', N'L', N'SIZ', 94)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'L', N'L', N'SIZ', 95)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'L', N'L', N'SIZ', 96)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'L', N'L', N'SIZ', 97)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'white', N'#ffffff', N'COL', 98)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'white', N'#ffffff', N'COL', 99)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'white', N'#ffffff', N'COL', 100)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'white', N'#ffffff', N'COL', 101)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'white', N'#ffffff', N'COL', 102)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'white', N'#ffffff', N'COL', 103)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'white', N'#ffffff', N'COL', 104)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'white', N'#ffffff', N'COL', 105)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'white', N'#ffffff', N'COL', 106)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'white', N'#ffffff', N'COL', 107)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'white', N'#ffffff', N'COL', 108)
GO
print 'Processed 100 total records'
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'white', N'#ffffff', N'COL', 109)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'white', N'#ffffff', N'COL', 110)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'white', N'#ffffff', N'COL', 111)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'white', N'#ffffff', N'COL', 112)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'white', N'#ffffff', N'COL', 113)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'white', N'#ffffff', N'COL', 114)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'white', N'#ffffff', N'COL', 115)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'white', N'#ffffff', N'COL', 116)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'white', N'#ffffff', N'COL', 117)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'white', N'#ffffff', N'COL', 118)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'white', N'#ffffff', N'COL', 119)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'white', N'#ffffff', N'COL', 120)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'white', N'#ffffff', N'COL', 121)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'white', N'#ffffff', N'COL', 122)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'white', N'#ffffff', N'COL', 124)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'white', N'#ffffff', N'COL', 125)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'white', N'#ffffff', N'COL', 126)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'white', N'#ffffff', N'COL', 127)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (33, N'red', N'#ff0000', N'COL', 128)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (35, N'red', N'#ff0000', N'COL', 129)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (37, N'red', N'#ff0000', N'COL', 130)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (38, N'red', N'#ff0000', N'COL', 131)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (42, N'red', N'#ff0000', N'COL', 132)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (43, N'red', N'#ff0000', N'COL', 133)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (47, N'red', N'#ff0000', N'COL', 134)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (52, N'red', N'#ff0000', N'COL', 135)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (56, N'red', N'#ff0000', N'COL', 136)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (57, N'red', N'#ff0000', N'COL', 137)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (58, N'red', N'#ff0000', N'COL', 138)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'red', N'#ff0000', N'COL', 139)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (60, N'red', N'#ff0000', N'COL', 140)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (61, N'red', N'#ff0000', N'COL', 141)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (62, N'red', N'#ff0000', N'COL', 142)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (63, N'red', N'#ff0000', N'COL', 143)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (64, N'red', N'#ff0000', N'COL', 144)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (65, N'red', N'#ff0000', N'COL', 145)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (66, N'red', N'#ff0000', N'COL', 146)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (67, N'red', N'#ff0000', N'COL', 147)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (68, N'red', N'#ff0000', N'COL', 148)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (69, N'red', N'#ff0000', N'COL', 149)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (70, N'red', N'#ff0000', N'COL', 150)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (71, N'red', N'#ff0000', N'COL', 151)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (72, N'red', N'#ff0000', N'COL', 152)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (74, N'red', N'#ff0000', N'COL', 154)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (75, N'red', N'#ff0000', N'COL', 155)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (76, N'red', N'#ff0000', N'COL', 156)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'red', N'#ff0000', N'COL', 157)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (0, N'red', N'#ff0000', N'COL', 166)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 182)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 183)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 184)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 185)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 186)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 187)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 188)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 189)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 190)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 191)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 192)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 193)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 194)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 195)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 196)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 197)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 198)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 199)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 200)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 201)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 202)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 203)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 204)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 205)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 206)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 207)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 208)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 209)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 210)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 211)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 212)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 213)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 214)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 215)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 216)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 217)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 218)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 219)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 220)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 221)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 222)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 223)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 224)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 225)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 226)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 227)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 228)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 229)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 230)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 231)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 232)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 233)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 234)
GO
print 'Processed 200 total records'
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 235)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 236)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 237)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 238)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 239)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 240)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 241)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 242)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 243)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 244)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 245)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 246)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 247)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 248)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 249)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 250)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 251)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 252)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 253)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 254)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 255)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 256)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 257)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 258)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 259)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 260)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 261)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 262)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 263)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 264)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 265)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 266)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 267)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 268)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 269)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 270)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 271)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 272)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 273)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 274)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 275)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 276)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 277)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 278)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 279)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 280)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 281)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 282)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 283)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 284)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 285)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 286)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 287)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 288)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 289)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 290)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 291)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 292)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 293)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 294)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 295)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 296)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 297)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 298)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 299)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 300)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 301)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 302)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 303)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 304)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 305)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 306)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 307)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 308)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 309)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 310)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 311)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 312)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 313)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 314)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 315)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 316)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 317)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 318)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 319)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 320)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 321)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 322)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 323)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 324)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 325)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 326)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 327)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 328)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 329)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 330)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 331)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 332)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 333)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 334)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 335)
GO
print 'Processed 300 total records'
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 336)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 337)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 338)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 339)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 340)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 341)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 342)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 343)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 344)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 345)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 346)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 347)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 348)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 349)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 350)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 351)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 352)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 353)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 354)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 355)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 356)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 357)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 358)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 359)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 360)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 361)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 362)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 363)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 364)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 365)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 366)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'white', N'#ffffff', N'COL', 367)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'black', N'#000000', N'COL', 368)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'S', N'S', N'SIZ', 369)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'M', N'M', N'SIZ', 370)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (1, N'L', N'L', N'SIZ', 371)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'tim', N'#ffad46', N'COL', 374)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (59, N'tim', N'#ffad46', N'COL', 375)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (77, N'Blue', N'#4986e7', N'COL', 378)
INSERT [dbo].[_ProductProperty] ([ProductID], [Name], [Value], [Type], [ProID]) VALUES (0, N'Nhỏ', N'S', N'SIZ', 380)
SET IDENTITY_INSERT [dbo].[_ProductProperty] OFF
/****** Object:  Table [dbo].[_UserInfo]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_UserInfo](
	[InforId] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
	[EventId] [int] NULL,
	[Birthday] [datetime] NULL,
	[Location] [nvarchar](50) NULL,
	[Note] [nvarchar](1000) NULL,
	[DateJoin] [datetime] NULL,
	[DateRegister] [datetime] NULL,
 CONSTRAINT [PK__UserInfo] PRIMARY KEY CLUSTERED 
(
	[InforId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_UserInfo] ON
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (1, N'a', N'a', N'04214213', N'adasd', N'aaaa@gmail.com', 41, CAST(0x0000A3E000000000 AS DateTime), N'Hà Nội', N'', NULL, CAST(0x0000A40500BEC875 AS DateTime))
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (2, N'coi', NULL, NULL, NULL, N'abc123@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (3, N'soncoi', NULL, NULL, NULL, N'abc1234@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (4, N'nguyen coi', NULL, NULL, NULL, N'coicoi0101@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (5, N'soncoi', NULL, N'0967962562', N'Son La', N'abc1234@gmail.com', NULL, CAST(0x00007AFA00000000 AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (6, N'Son ', NULL, NULL, NULL, N'nguyenson1303@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (7, N'Bình', NULL, NULL, NULL, N'sonnguyenvan1986@gmail.com', 0, NULL, NULL, N'Facebook login', NULL, CAST(0x0000A60D00C87F59 AS DateTime))
INSERT [dbo].[_UserInfo] ([InforId], [FName], [LName], [Phone], [Address], [Email], [EventId], [Birthday], [Location], [Note], [DateJoin], [DateRegister]) VALUES (8, N'Kenvil', NULL, NULL, NULL, N'duynvtest@gmail.com', 0, NULL, NULL, N'Facebook login', NULL, CAST(0x0000A64200B6E9E6 AS DateTime))
SET IDENTITY_INSERT [dbo].[_UserInfo] OFF
/****** Object:  Table [dbo].[_User]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_User](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Role] [int] NOT NULL,
	[Online] [bit] NULL,
	[LastLogin] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'abc123@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 0, CAST(0x0000A54B00A26A59 AS DateTime), N'not login')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'abc1234@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(0x0000A671009F8D52 AS DateTime), N'127.0.0.1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'Admin', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, CAST(0x0000A66A00DB6807 AS DateTime), N'127.0.0.1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'coicoi0101@gmail.com', N'25D55AD283AA400AF464C76D713C07AD', 2, 0, CAST(0x0000A56400F51388 AS DateTime), N'::1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'duynvtest@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(0x0000A64200BAA9B3 AS DateTime), N'122.216.10.180')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'nguyenson1303@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(0x0000A63F010ACF4A AS DateTime), N'1.52.126.129')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'soncoi', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 1, CAST(0x0000A64B00E23B8C AS DateTime), N'127.0.0.1')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'sonnguyenvan1986@gmail.com', N'E10ADC3949BA59ABBE56E057F20F883E', 2, 1, CAST(0x0000A60D00CE421E AS DateTime), N'113.160.57.22')
INSERT [dbo].[_User] ([Username], [Password], [Role], [Online], [LastLogin], [IP]) VALUES (N'Test', N'E10ADC3949BA59ABBE56E057F20F883E', 1, 0, CAST(0x0000A58C00CBCFE7 AS DateTime), N'::1')
/****** Object:  Table [dbo].[_WebInfo]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_WebInfo](
	[GeneralID] [int] IDENTITY(1,1) NOT NULL,
	[GeneralName] [nvarchar](100) NOT NULL,
	[GeneralContent] [nvarchar](max) NULL,
	[Datemodified] [smalldatetime] NULL,
 CONSTRAINT [PK__WebInfo] PRIMARY KEY CLUSTERED 
(
	[GeneralID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_WebInfo] ON
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (1, N'smtphost', N'smtp.gmail.com', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (2, N'smtpport', N'587', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (3, N'smtpuser', N'tempaids005@gmail.com', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (4, N'smtppass', N'Abc@123456', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (5, N'email', N'cskh.tonymolyvn@gmail.com', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (6, N'hotline', N'04.3795 7181', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (9, N'banner', N'<img width="760" height="221" src="/UserFiles/Image/slide.jpg" alt="" />', CAST(0x9E420577 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (10, N'newstop', N'TRANSMECO <a href="#">đạt giải thưởng &quot;SAO V&Agrave;NG ĐẤT VIỆT 2009&quot; </a>[11.11.2009]', CAST(0x9E420577 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (11, N'video', N'qG58VXLH9aA', CAST(0x9E420577 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (18, N'facebook', N'https://www.facebook.com/Belle-Hair-Salon-450987675084279/', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (20, N'price_min', N'0', CAST(0xA4A0037E AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (21, N'price_max', N'20', CAST(0xA4A0037E AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (22, N'latitude', N'21.015906', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (23, N'longitude', N'105.812098', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (24, N'google_analysis', NULL, CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (25, N'app_extend_one', NULL, CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (26, N'app_extend_two', NULL, CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (27, N'tax', N'0.1', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (28, N'fees', N'0', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (29, N'min_fees', N'0', CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (30, N'Skyper', NULL, CAST(0xA6360414 AS SmallDateTime))
INSERT [dbo].[_WebInfo] ([GeneralID], [GeneralName], [GeneralContent], [Datemodified]) VALUES (31, N'imgmap', N'0', CAST(0xA6360414 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[_WebInfo] OFF
/****** Object:  Table [dbo].[_UserPermission]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_UserPermission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_id] [int] NULL,
	[del] [bit] NULL,
	[edit] [bit] NULL,
	[add] [bit] NULL,
	[view] [bit] NULL,
	[user] [nvarchar](100) NULL,
 CONSTRAINT [PK__UserPermission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_UserPermission] ON
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (1, 1, 1, 1, 1, 1, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (2, 2, 0, 0, 0, 1, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (3, 3, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (4, 4, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (5, 5, 0, 0, 1, 1, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (6, 6, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (7, 7, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (8, 8, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (9, 9, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (10, 10, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (11, 11, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (12, 12, 0, 0, 0, 1, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (13, 13, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (14, 14, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (15, 15, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (16, 16, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (17, 17, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (18, 18, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (19, 19, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (20, 20, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (21, 21, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (22, 22, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (23, 23, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (24, 24, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (25, 25, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (26, 26, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (27, 27, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (28, 28, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (29, 29, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (30, 30, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (31, 31, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (32, 32, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (33, 33, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (34, 34, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (35, 35, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (36, 36, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (37, 37, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (38, 38, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (39, 39, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (40, 40, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (41, 41, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (42, 42, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (43, 43, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (44, 44, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (45, 45, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (46, 46, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (47, 47, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (48, 48, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (49, 49, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (50, 50, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (51, 51, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (52, 52, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (53, 53, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (54, 54, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (55, 1, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (56, 2, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (57, 3, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (58, 4, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (59, 5, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (60, 6, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (61, 7, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (62, 8, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (63, 9, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (64, 10, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (65, 11, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (66, 12, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (67, 13, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (68, 14, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (69, 15, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (70, 16, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (71, 17, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (72, 18, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (73, 19, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (74, 20, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (75, 21, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (76, 22, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (77, 23, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (78, 24, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (79, 25, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (80, 26, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (81, 27, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (82, 28, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (83, 29, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (84, 30, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (85, 31, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (86, 32, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (87, 33, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (88, 34, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (89, 35, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (90, 36, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (91, 37, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (92, 38, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (93, 39, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (94, 40, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (95, 41, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (96, 42, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (97, 43, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (98, 44, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (99, 45, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (100, 46, 1, 1, 1, 1, N'Admin')
GO
print 'Processed 100 total records'
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (101, 47, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (102, 48, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (103, 49, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (104, 50, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (105, 51, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (106, 52, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (107, 53, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (108, 54, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (109, 55, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (110, 55, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (111, 56, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (112, 56, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (113, 57, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (114, 57, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (115, 58, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (116, 58, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (117, 59, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (118, 59, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (119, 60, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (120, 60, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (121, 61, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (122, 61, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (123, 62, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (124, 62, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (125, 63, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (126, 63, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (127, 64, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (128, 65, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (129, 66, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (131, 68, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (132, 64, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (133, 65, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (134, 66, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (136, 68, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (137, 80, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (138, 81, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (139, 82, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (140, 83, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (141, 84, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (142, 85, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (143, 86, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (144, 87, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (145, 88, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (146, 89, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (147, 90, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (148, 91, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (149, 81, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (150, 80, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (151, 82, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (152, 83, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (153, 85, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (154, 84, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (155, 88, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (156, 86, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (157, 87, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (158, 90, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (159, 91, 0, 0, 0, 0, N'soncoi')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (160, 92, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (161, 93, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (162, 94, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (163, 95, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (164, 96, 1, 1, 1, 1, N'Admin')
INSERT [dbo].[_UserPermission] ([id], [page_id], [del], [edit], [add], [view], [user]) VALUES (165, 97, 1, 1, 1, 1, N'Admin')
SET IDENTITY_INSERT [dbo].[_UserPermission] OFF
/****** Object:  Table [dbo].[_UserPage]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_UserPage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[act] [varchar](50) NULL,
	[ctrl] [varchar](50) NULL,
	[Title] [nvarchar](100) NULL,
	[IsShow] [bit] NULL,
	[Tye] [varchar](50) NULL,
	[ParentId] [int] NULL,
	[OrderDisplay] [int] NULL,
	[Icon] [varchar](100) NULL,
	[TypeAction] [varchar](10) NULL,
 CONSTRAINT [PK__UserPage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[_UserPage] ON
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (1, N'list_catalog', N'adminCatalog', N'Danh mục sản phẩm', 1, N'SP', 69, 3, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (2, N'list_catalog', N'adminCatalog', N'Danh mục bài viết', 1, N'TT', 72, 3, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (3, N'list_catalog', N'adminCatalog', N'Danh mục Lookbook', 1, N'LB', 70, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (4, N'list_catalog', N'adminCatalog', N'Danh mục Gallery', 0, N'GL', 70, 5, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (5, N'change_catalog', N'adminCatalog', N'Thêm danh mục sản phẩm', 1, N'SP', 69, 4, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (6, N'change_catalog', N'adminCatalog', N'Thêm danh mục bài viết', 1, N'TT', 72, 4, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (7, N'change_catalog', N'adminCatalog', N'Thêm Album Lookbook', 1, N'LB', 70, 3, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (8, N'change_catalog', N'adminCatalog', N'Thêm Album Gallery', 0, N'GL', 70, 6, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (9, N'change_product', N'adminProduct', N'Thêm sản phẩm', 1, N'', 69, 1, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (10, N'image_product', N'adminProduct', N'Ảnh sản phẩm', 0, N'', 69, 7, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (11, N'property_product', N'adminProduct', N'Thuộc tính sản phẩm', 0, N'', 69, 9, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (12, N'list_product', N'adminProduct', N'Sản phẩm', 1, N'', 69, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (13, N'list_post', N'adminPost', N'Danh sách bài viết', 1, N'TT', 72, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (14, N'change_post', N'adminPost', N'Thêm bài viết', 1, N'TT', 72, 1, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (15, N'list_link', N'adminLink', N'Slide trang chủ', 1, N'SL', 76, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (16, N'list_link', N'adminLink', N'Button danh mục sản phẩm ', 1, N'BG', 76, 2, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (17, N'list_link', N'adminLink', N'Nơi sản xuất', 1, N'DT', 69, 10, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (18, N'list_link', N'adminLink', N'Danh sách dự án', 0, N'PR', 76, 8, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (19, N'list_link', N'adminLink', N'Danh sách Testimonials', 0, N'TE', 76, 6, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (20, N'list_link', N'adminLink', N'Danh sách Video', 1, N'VD', 76, 7, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (21, N'list_link', N'adminLink', N'Danh sách thành viên', 0, N'MB', 76, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (22, N'list_link', N'adminLink', N'Danh sách dịch vụ', 0, N'SR', 76, 5, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (23, N'list_link', N'adminLink', N'Slide trang sản phẩm', 1, N'AF', 76, 9, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (24, N'list_link', N'adminLink', N'Danh sách liên kết', 0, N'LK', 76, 10, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (25, N'change_link', N'adminLink', N'Thêm Slide', 0, N'SL', 76, 17, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (26, N'change_link', N'adminLink', N'Thêm Background Slide', 0, N'BG', 76, 16, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (27, N'change_link', N'adminLink', N'Thêm Brand', 0, N'DT', 69, 11, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (28, N'change_link', N'adminLink', N'Thêm project', 0, N'PR', 76, 19, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (29, N'change_link', N'adminLink', N'Thêm Testimonials', 0, N'TE', 76, 20, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (30, N'change_link', N'adminLink', N'Thêm Video', 0, N'VD', 76, 21, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (31, N'change_link', N'adminLink', N'Thêm thành viên', 0, N'MB', 76, 22, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (32, N'change_link', N'adminLink', N'Thêm service', 0, N'SR', 76, 23, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (33, N'change_link', N'adminLink', N'Thêm Silde sản phẩm ', 0, N'AF', 76, 24, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (34, N'change_link', N'adminLink', N'Thêm liên kết', 0, N'LK', 76, 25, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (35, N'list_album_images', N'adminLink', N'Ảnh Lookbook', 1, N'LB', 70, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (36, N'list_album_images', N'adminLink', N'Ảnh Gallery', 0, N'GL', 70, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (37, N'system_config', N'adminGeneral', N'Cấu hình chung', 1, N'', 75, 6, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (38, N'system_email', N'adminGeneral', N'Cấu hình email', 1, N'', 75, 7, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (39, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo trái', 1, N'advsleft', 76, 11, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (40, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo phải', 1, N'advsright', 76, 12, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (41, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo trên', 1, N'advstop', 76, 14, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (42, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo giữa', 1, N'advsmiddle', 76, 13, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (43, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo dưới phải', 1, N'advsbottom', 76, 15, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (44, N'change_general', N'adminGeneral', N'Nội dung Shipping', 1, N'content_shipping', 77, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (45, N'change_general', N'adminGeneral', N'Email xác nhận đơn hàng', 1, N'email_order_confirm', 79, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (46, N'change_general', N'adminGeneral', N'Email xác nhận quên mật khẩu', 1, N'email_confirm_forgot_password', 79, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (47, N'change_general', N'adminGeneral', N'Email thay đổi trạng thái thanh toán', 1, N'email_order_payment_change_status', 79, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (48, N'list_page_static', N'adminStatic', N'Danh sách trang tĩnh', 1, N'', 73, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (49, N'change_static', N'adminStatic', N'Thêm trang tĩnh', 1, N'', 73, 2, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (50, N'list_user', N'adminUser', N'Danh sách Admin', 1, N'Admin', 74, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (51, N'change_user', N'adminUser', N'Thêm Admin', 1, N'Admin', 74, 2, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (52, N'list_user_permission', N'adminUser', N'Phân quyền Admin', 0, N'Admin', 74, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (53, N'list_order', N'adminOrder', N'Danh sách đơn hàng', 1, N'', 71, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (54, N'change_order', N'adminOrder', N'Xử lý đơn hàng', 0, N'', 71, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (55, N'change_catalog', N'adminCatalog', N'Thêm danh mục Collection', 0, N'CL', 69, 6, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (56, N'change_general', N'adminGeneral', N'Giới thiệu ngắn', 1, N'aboutshort', 75, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (57, N'change_general', N'adminGeneral', N'Giới thiệu', 1, N'aboutcontent', 75, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (58, N'change_general', N'adminGeneral', N'Liên hệ', 1, N'contactdetail', 75, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (59, N'change_general', N'adminGeneral', N'Liên hệ ngắn', 1, N'contact', 75, 4, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (60, N'footer', N'adminGeneral', N'Footer', 1, N'', 75, 8, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (61, N'list_catalog', N'adminCatalog', N'Danh mục Collection', 0, N'CL', 69, 5, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (62, N'list_contact', N'adminGeneral', N'Ý kiến khách hàng', 1, N'', 78, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (63, N'list_Rating', N'adminProduct', N'Bình luận và đánh giá', 0, N'', 69, 8, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (69, N'', N'', N'Quản lý Sản phẩm ', 1, N'', 0, 1, N'<i class="icon-certificate"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (70, N'', N'', N'Quản lý Gallery ', 0, N'', 0, 2, N'<i class="icon-picture"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (71, N'', N'', N'Quản lý Đơn hàng ', 1, N'', 0, 3, N'<i class="icon-barcode"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (72, N'', N'', N' Tin tức & Bài viết', 1, N'', 0, 4, N'<i class="icon-text-width"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (73, N'', N'', N'Trang nội dung khác', 1, N'', 0, 5, N'<i class="icon-desktop"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (74, N'', N'', N'Quản lý Thành viên ', 1, N'', 0, 6, N'<i class="icon-user"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (75, N'', N'', N'Cấu hình Website ', 1, N'', 0, 7, N'<i class="icon-cogs"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (76, N'', N'', N'Quảng cáo ', 1, N'', 0, 8, N'<i class="icon-globe"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (77, N'', N'', N'Shipping ', 1, N'', 0, 9, N'<i class="icon-list-alt"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (78, N'', N'', N'Ý kiến khách hàng ', 1, N'', 0, 10, N'<i class="icon-comments"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (79, N'', N'', N'Email Template', 1, N'', 0, 11, N'<i class="icon-leaf"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (80, N'list_log', N'adminUser', N'Log system', 1, N'', 74, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (81, N'comment_facebook', N'adminProduct', N'Bình luận Facebook', 0, N'', 69, 9, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (82, N'list_user', N'adminUser', N'Danh sách Khách hàng', 1, N'Client', 74, 4, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (83, N'change_user', N'adminUser', N'Thông tin khách hàng', 0, N'Client', 74, 5, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (84, N'change_general', N'adminGeneral', N'Cập nhật quảng cáo dưới trái', 1, N'advsbottomleft', 76, 16, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (85, N'list_email', N'adminEmail', N'Email marketing', 1, N'Admin', 75, 8, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (86, N'list_emailtemplate', N'adminEmail', N'Danh sách email template', 1, N'Admin', 79, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (87, N'change_emailtemplate', N'adminEmail', N'Thêm email template', 1, N'Admin', 79, 3, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (88, N'change_general', N'adminGeneral', N'Hướng dẫn thanh toán', 1, N'payment_guide', 77, 2, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (89, N'', N'', N'Quản lý Showroom', 0, N'', 0, 12, N'<i class="icon-leaf"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (90, N'change_showroom', N'adminShowroom', N'Thêm Showroom', 1, N'Admin', 89, 1, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (91, N'list_showroom', N'adminShowroom', N'Danh sách Showroom', 1, N'Admin', 89, 1, N'<i class="icon-double-angle-right"></i>', N'edit')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (92, N'list_catalog', N'adminCatalog', N'Danh mục dịch vụ', 1, N'DV', 98, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (93, N'change_catalog', N'adminCatalog', N'Thêm danh mục dịch vụ', 1, N'DV', 98, 2, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (94, N'list_post', N'adminPost', N'Dịch vụ', 1, N'DV', 98, 3, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (95, N'change_post', N'adminPost', N'Thêm dịch vụ', 1, N'DV', 98, 4, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (96, N'list_post', N'adminPost', N'Khuyến mãi', 1, N'KM', 99, 1, N'<i class="icon-double-angle-right"></i>', N'view')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (97, N'change_post', N'adminPost', N'Thêm khuyến mãi', 1, N'KM', 99, 2, N'<i class="icon-double-angle-right"></i>', N'add')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (98, N'', N'', N'Dịch vụ', 1, N'', 0, 13, N'<i class="icon-double-angle-right"></i>', N'')
INSERT [dbo].[_UserPage] ([id], [act], [ctrl], [Title], [IsShow], [Tye], [ParentId], [OrderDisplay], [Icon], [TypeAction]) VALUES (99, N'', N'', N'Khuyến mãi', 1, N'', 0, 14, N'<i class="icon-double-angle-right"></i>', N'')
SET IDENTITY_INSERT [dbo].[_UserPage] OFF
/****** Object:  Table [dbo].[_Catalog]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[_Catalog](
	[CatalogID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[CategoryName] [nvarchar](100) NULL,
	[Link] [nvarchar](100) NULL,
	[ImagePath] [nvarchar](200) NULL,
	[Intro] [nvarchar](max) NULL,
	[MoreInfo] [nvarchar](max) NULL,
	[Lang] [nvarchar](10) NULL,
	[Show] [bit] NULL,
	[Keyword] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[Type] [nvarchar](50) NULL,
	[OrderDisplay] [int] NULL,
 CONSTRAINT [PK_CatalogProduct] PRIMARY KEY CLUSTERED 
(
	[CatalogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[_Catalog] ON
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (39, 0, N'Dưỡng da', N'Duong-da', N'/images/catalog/2016/5/sc_small_2058_shampoo.png', N'Dưỡng da', N'<p>Dưỡng da</p>
', N'vi', 1, N'Dưỡng da', N'Dưỡng da', N'Dưỡng da', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (40, 0, N'Làm sạch', N'Lam-sach', N'/images/catalog/2016/5/sc_small_2059_products_full.png', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Làm sạch', N'Làm sạch', N'Làm sạch', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (41, 0, N'Toàn thân', N'Toan-than', N'/images/catalog/2016/5/sc_small_2059_awarded_product.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Toàn thân', N'Toàn thân', N'Toàn thân', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (43, 0, N'Trang điểm', N'Trang-diem', N'/images/catalog/2016/5/sc_small_2059_shampoo.png', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trang điểm', N'Trang điểm', N'Trang điểm', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (46, 0, N'Sinh nhật 3s Belle salon', N'Sinh-nhat-3s-Belle-salon', N'/images/catalog/2016/4/sc_small_2129_img_8375.jpg', N'Sinh nhật 3s Belle salon', N'', N'vi', 1, N'Sinh nhật 3s Belle salon', N'Sinh nhật 3s Belle salon', N'Sinh nhật 3s Belle salon', N'LB', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (47, 0, N'Sinh nhật phần 2', N'Sinh-nhat-phan-2', N'/images/catalog/2016/5/sc_small_2085_img_8303.jpg', N'Sinh nhật', N'', N'vi', 1, N'Sinh nhật', N'Sinh nhật Belle', N'Sinh nhật', N'LB', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (48, 0, N'Nyala', N'Nyala', N'/images/catalog/4620151057tumblr_nml4t3mQTM1qbd81ro1_1280.jpg', N'<p>Nyala</p>
', N'', N'vi  ', 1, N'Nyala', N'Nyala', N'Nyala', N'GL', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (49, 0, N'Ly Nguyen', N'Ly-Nguyen', N'/images/catalog/4620151057tumblr_nlno9nzVjk1qbd81ro1_1280.jpg', N'<p>Ly Nguyen</p>
', N'', N'vi  ', 1, N'Ly Nguyen', N'Ly Nguyen', N'Ly Nguyen', N'GL', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (50, 0, N'lookbook Hà Nội', N'lookbook-Ha-Noi', N'/images/catalog/2016/5/sc_small_2070_img_8791.jpg', N'', N'', N'vi', 1, N'lookbook', N'lookbook', N'lookbook', N'LB', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (51, 0, N'lookbook Đà Nẵng', N'lookbook-Da-Nang', N'/images/catalog/2016/5/sc_small_2071_img_9094.jpg', N'', N'', N'vi', 1, N'lookbook Đà Nẵng', N'lookbook Đà Nẵng', N'lookbook Đà Nẵng', N'LB', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (52, 0, N'lookbook Sài Gòn', N'lookbook-Sai-Gon', N'/images/catalog/2016/5/sc_small_2072_img_8393.jpg', N'', N'', N'vi', 1, N'lookbook Sài Gòn', N'lookbook Sài Gòn', N'lookbook Sài Gòn', N'LB', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (53, 0, N'lookbook free style', N'lookbook-free-style', N'/images/catalog/2016/5/sc_small_2073_sile-3.jpg', N'', N'', N'vi', 1, N'lookbook free style', N'lookbook free style', N'lookbook free style', N'LB', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (54, 0, N'Trần Thu Lê', N'Tran-Thu-Le', N'/images/catalog/462015111tumblr_nlno94mQTl1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Trần Thu Lê', N'Trần Thu Lê', N'Trần Thu Lê', N'GL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (55, 0, N'Nataly', N'Nataly', N'/images/catalog/462015112tumblr_nmrx1feU5c1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Nataly', N'Nataly', N'Nataly', N'GL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (56, 0, N'Lan Anh', N'Lan-Anh', N'/images/catalog/462015112tumblr_nn3zpqYPc11qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Lan Anh', N'Lan Anh', N'Lan Anh', N'GL', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (57, 0, N'Như Mai', N'Nhu-Mai', N'/images/catalog/462015113tumblr_nlkky2w4tX1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Như Mai', N'Như Mai', N'Như Mai', N'GL', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (58, 0, N'Hoàng Anh', N'Hoang-Anh', N'/images/catalog/462015115tumblr_nlhshjUTOt1qbd81ro1_1280.jpg', N'', N'', N'vi  ', 1, N'Hoàng Anh', N'Hoàng Anh', N'Hoàng Anh', N'GL', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (59, 0, N'Áo dài', N'Ao-dai', N'/images/catalog/4620151343demo999 (45).jpg', N'', N'', N'vi  ', 1, N'Áo dài', N'Áo dài', N'Áo dài', N'GL', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (65, 0, N'Khuyến mại', N'Khuyen-mai', N'/images/catalog/2016/5/sc_small_2081_blog_bg8ad4.jpg', N'Tóc đẹp Belle hair salon, chia sẻ những bí quyết làm đẹp tóc, hình ảnh tóc đẹp, những kiểu tóc đẹp nhất năm 2016, tư vấn cách chọn kiểu tóc đẹp.', N'<p>&nbsp;</p>
', N'vi', 1, N'Khuyến mại', N'Khuyến mại', N'Khuyến mại', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (66, 0, N'blog', N'blog', N'0', N'', N'', N'en', 1, N'', N'', N'blog', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (76, 0, N'Sự kiện', N'su-kien', N'/images/catalog/2016/5/sc_small_2082_168703469.jpg', N'Hướng dẫn nhuộm tóc nam đẹp hoàn hảo, thời thượng. Nhuộm tóc không còn là việc quá xa lạ đối với đấng mày râu trong thời buổi hiện tại.', N'<p>&nbsp;</p>
', N'vi', 1, N'Sự kiện', N'Sự kiện', N'Sự kiện', N'TT', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (77, 0, N'Đào tạo', N'dao-tao', N'0', N'', N'', N'vi', 1, N'Tuyển dụng', N'Tuyển dụng', N'Tuyển dụng', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (78, 0, N'Education', N'education', N'0', N'', N'', N'en', 1, N'Recruitment', N'Recruitment', N'Recruitment', N'TT', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (79, 0, N'Tin nội bộ', N'tin-noi-bo', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tin nội bộ', N'Tin nội bộ', N'Tin nội bộ', N'TT', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (80, 0, N'Mẹo làm đẹp', N'meo-lam-dep', N'0', N'Mẹo làm đẹp', N'<p>Mẹo l&agrave;m đẹp</p>
', N'vi', 1, N'Mẹo làm đẹp', N'Mẹo làm đẹp', N'Mẹo làm đẹp', N'TT', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (81, 0, N'Phụ kiện', N'Phu-kien', N'0', N'Phụ kiện', N'<p>Phụ kiện</p>
', N'vi', 1, N'Phụ kiện', N'Phụ kiện', N'Phụ kiện', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (82, 39, N'Nước hoa hồng', N'Nuoc-hoa-hong', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Nước hoa hồng', N'Nước hoa hồng', N'Nước hoa hồng', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (83, 39, N'Sữa dưỡng', N'Sua-duong', N'0', N'', N'<p>Sữa dưỡng</p>
', N'vi', 1, N'Sữa dưỡng', N'Sữa dưỡng', N'Sữa dưỡng', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (84, 39, N'Tinh chất', N'Tinh-chat', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tinh chất', N'Tinh chất', N'Tinh chất', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (85, 39, N'Kem dưỡng da', N'Kem-duong-da', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Kem dưỡng da', N'Kem dưỡng da', N'Kem dưỡng da', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (86, 39, N'Kem dưỡng mắt', N'Kem-duong-mat', N'0', N'Kem dưỡng mắt', N'<p>Kem dưỡng mắt</p>
', N'vi', 1, N'Kem dưỡng mắt', N'Kem dưỡng mắt', N'Kem dưỡng mắt', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (87, 39, N'Xịt khoáng', N'Xit-khoang', N'0', N'Xịt khoáng', N'<p>Xịt kho&aacute;ng</p>
', N'vi', 1, N'Xịt khoáng', N'Xịt khoáng', N'Xịt khoáng', N'SP', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (88, 39, N'Skincare Set', N'Skincare-Set', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Skincare Set', N'Skincare Set', N'Skincare Set', N'SP', 7)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (89, 39, N'Chống nắng', N'Chong-nang', N'0', N'Chống nắng', N'<p>Chống nắng</p>
', N'vi', 1, N'Chống nắng', N'Chống nắng', N'Chống nắng', N'SP', 8)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (90, 39, N'Chăm sóc đặc biệt', N'Cham-soc-dac-biet', N'0', N'Chăm sóc đặc biệt', N'<p>Chăm s&oacute;c đặc biệt</p>
', N'vi', 1, N'Chăm sóc đặc biệt', N'Chăm sóc đặc biệt', N'Chăm sóc đặc biệt', N'SP', 9)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (91, 40, N'Sữa rửa mặt', N'Sua-rua-mat', N'0', N'Sữa rửa mặt', N'<p>Sữa rửa mặt</p>
', N'vi', 1, N'Sữa rửa mặt', N'Sữa rửa mặt', N'Sữa rửa mặt', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (92, 40, N'Mặt nạ ngủ', N'Mat-na-ngu', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Mặt nạ ngủ', N'Mặt nạ ngủ', N'Mặt nạ ngủ', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (93, 40, N'Tẩy trang', N'Tay-trang', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tẩy trang', N'Tẩy trang', N'Tẩy trang', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (94, 40, N'Tẩy tế bào chết', N'Tay-te-bao-chet', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tẩy tế bào chết', N'Tẩy tế bào chết', N'Tẩy tế bào chết', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (95, 40, N'Massage & đắp mặt', N'Massage--dap-mat', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage & đắp mặt', N'Massage & đắp mặt', N'Massage & đắp mặt', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (96, 40, N'Loại khác', N'Loai-khac', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Loại khác', N'Loại khác', N'Loại khác', N'SP', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (97, 41, N'Sữa tắm', N'Sua-tam', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Sữa tắm', N'Sữa tắm', N'Sữa tắm', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (98, 41, N'Dưỡng thể', N'Duong-the', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Dưỡng thể', N'Dưỡng thể', N'Dưỡng thể', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (99, 41, N'Chăm sóc da tay chân', N'Cham-soc-da-tay-chan', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc da tay chân', N'Chăm sóc da tay chân', N'Chăm sóc da tay chân', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (100, 43, N'Kem CC & BB', N'Kem-CC--BB', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Kem CC & BB', N'Kem CC & BB', N'Kem CC & BB', N'SP', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (101, 43, N'Phấn bột dạng nén và phấn phủ', N'Phan-bot-dang-nen-va-phan-phu', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Phấn bột dạng nén và phấn phủ', N'Phấn bột dạng nén và phấn phủ', N'Phấn bột dạng nén và phấn phủ', N'SP', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (102, 43, N'Che khuyết', N'Che-khuyet', N'0', N'Che khuyết', N'<p>Che khuyết</p>
', N'vi', 1, N'Che khuyết', N'Che khuyết', N'Che khuyết', N'SP', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (103, 43, N'Phấn má', N'Phan-ma', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Phấn má', N'Phấn má', N'Phấn má', N'SP', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (104, 43, N'Son môi', N'Son-moi', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Son môi', N'Son môi', N'Son môi', N'SP', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (105, 43, N'Trang điểm mày', N'Trang-diem-may', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trang điểm mày', N'Trang điểm mày', N'Trang điểm mày', N'SP', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (106, 43, N'Trang điểm mày', N'Trang-diem-may', NULL, N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trang điểm mày', N'Trang điểm mày', N'Trang điểm mày', N'SP', 7)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (107, 43, N'Chuốt mi', N'Chuot-mi', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chuốt mi', N'Chuốt mi', N'Chuốt mi', N'SP', 8)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (108, 43, N'Kẻ mắt', N'Ke-mat', N'0', N'Kẻ mắt', N'<p>Kẻ mắt</p>
', N'vi', 1, N'Kẻ mắt', N'Kẻ mắt', N'Kẻ mắt', N'SP', 9)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (109, 43, N'Sơn móng tay', N'Son-mong-tay', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Sơn móng tay', N'Sơn móng tay', N'Sơn móng tay', N'SP', 10)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (110, 0, N'Trị liệu công nghệ cao', N'Tri-lieu-cong-nghe-cao', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trị liệu công nghệ cao', N'Trị liệu công nghệ cao', N'Trị liệu công nghệ cao', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (111, 0, N'Spa thư giãn', N'Spa-thu-gian', N'0', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Spa thư giãn', N'Spa thư giãn', N'Spa thư giãn', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (112, 110, N'Triệt lông', N'Triet-long', N'/images/catalog/2016/7/sc_small_2088_1.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Triệt lông', N'Triệt lông', N'Triệt lông', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (113, 110, N'Xóa xăm bằng công nghệ Laser Q-Switch ND yag', N'Xoa-xam-bang-cong-nghe-Laser-Q-Switch-ND-yag', N'/images/catalog/2016/7/sc_small_2097_2.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Xóa xăm bằng công nghệ Laser Q-Switch ND yag', N'Xóa xăm bằng công nghệ Laser Q-Switch ND yag', N'Xóa xăm bằng công nghệ Laser Q-Switch ND yag', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (114, 110, N'Giảm béo không phẫu thuật', N'Giam-beo-khong-phau-thuat', N'/images/catalog/2016/7/sc_small_2104_3.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Giảm béo không phẫu thuật', N'Giảm béo không phẫu thuật', N'Giảm béo không phẫu thuật', N'DV', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (115, 110, N'Trẻ hóa da, nâng cơ mặt', N'Tre-hoa-da-nang-co-mat', N'/images/catalog/2016/7/sc_small_2108_4.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Trẻ hóa da, nâng cơ mặt', N'Trẻ hóa da, nâng cơ mặt', N'Trẻ hóa da, nâng cơ mặt', N'DV', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (116, 110, N'Điều trị sẹo lõm với kim lăn Dermaroller', N'Dieu-tri-seo-lom-voi-kim-lan-Dermaroller', N'/images/catalog/2016/7/sc_small_2109_5.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Điều trị sẹo lõm với kim lăn Dermaroller', N'Điều trị sẹo lõm với kim lăn Dermaroller', N'Điều trị sẹo lõm với kim lăn Dermaroller', N'DV', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (117, 111, N'Chăm sóc da mặt', N'Cham-soc-da-mat', N'/images/catalog/2016/7/sc_small_2111_6.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc da mặt', N'Chăm sóc da mặt', N'Chăm sóc da mặt', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (118, 111, N'Chăm sóc vùng mắt', N'Cham-soc-vung-mat', N'/images/catalog/2016/7/sc_small_2112_1.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc vùng mắt', N'Chăm sóc vùng mắt', N'Chăm sóc vùng mắt', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (119, 111, N'Tắm trắng', N'Tam-trang', N'/images/catalog/2016/7/sc_small_2112_2.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tắm trắng', N'Tắm trắng', N'Tắm trắng', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (120, 111, N'Massage body', N'Massage-body', N'/images/catalog/2016/7/sc_small_2113_3.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage body', N'Massage body', N'Massage body', N'DV', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (121, 111, N'Thông kinh lạc thu nhỏ eo, tạo đường cong chữ S', N'Thong-kinh-lac-thu-nho-eo-tao-duong-cong-chu-S', N'/images/catalog/2016/7/sc_small_2115_4.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Thông kinh lạc thu nhỏ eo, tạo đường cong chữ S', N'Thông kinh lạc thu nhỏ eo, tạo đường cong chữ S', N'Thông kinh lạc thu nhỏ eo, tạo đường cong chữ S', N'DV', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (122, 117, N'Chăm sóc da cơ bản', N'Cham-soc-da-co-ban', N'/images/catalog/2016/7/sc_small_2116_6.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc da cơ bản', N'Chăm sóc da cơ bản', N'Chăm sóc da cơ bản', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (123, 117, N'Thắp sáng làn da', N'Thap-sang-lan-da', N'/images/catalog/2016/7/sc_small_2116_2.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Thắp sáng làn da', N'Thắp sáng làn da', N'Thắp sáng làn da', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (124, 117, N'Chống lão hóa da', N'Chong-lao-hoa-da', N'/images/catalog/2016/7/sc_small_2059_3.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chống lão hóa da', N'Chống lão hóa da', N'Chống lão hóa da', N'DV', 3)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (125, 117, N'Điều trị mụn chuyên sau bằng hệ thống ', N'Dieu-tri-mun-chuyen-sau-bang-he-thong', N'/images/catalog/2016/7/sc_small_2060_5.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Điều trị mụn chuyên sau bằng hệ thống ', N'Điều trị mụn chuyên sau bằng hệ thống ', N'Điều trị mụn chuyên sau bằng hệ thống ', N'DV', 4)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (126, 117, N'Chăm sóc da mùa hanh khô', N'Cham-soc-da-mua-hanh-kho', N'/images/catalog/2016/7/sc_small_2061_6.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Chăm sóc da mùa hanh khô', N'Chăm sóc da mùa hanh khô', N'Chăm sóc da mùa hanh khô', N'DV', 5)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (127, 117, N'Tái tạo da sau 5 ngày', N'Tai-tao-da-sau-5-ngay', N'/images/catalog/2016/7/sc_small_2062_1.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Tái tạo da sau 5 ngày', N'Tái tạo da sau 5 ngày', N'Tái tạo da sau 5 ngày', N'DV', 6)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (128, 120, N'Massage đá nóng', N'Massage-da-nong', N'/images/catalog/2016/7/sc_small_2063_3.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage đá nóng', N'Massage đá nóng', N'Massage đá nóng', N'DV', 1)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (129, 120, N'Massage Thụy Điển', N'Massage-Thuy-Dien', N'/images/catalog/2016/7/sc_small_2064_4.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage Thụy Điển', N'Massage Thụy Điển', N'Massage Thụy Điển', N'DV', 2)
INSERT [dbo].[_Catalog] ([CatalogID], [ParentID], [CategoryName], [Link], [ImagePath], [Intro], [MoreInfo], [Lang], [Show], [Keyword], [Description], [Title], [Type], [OrderDisplay]) VALUES (130, 120, N'Massage thảo dược', N'Massage-thao-duoc', N'/images/catalog/2016/7/sc_small_2064_5.jpg', N'', N'<p>&nbsp;</p>
', N'vi', 1, N'Massage thảo dược', N'Massage thảo dược', N'Massage thảo dược', N'DV', 3)
SET IDENTITY_INSERT [dbo].[_Catalog] OFF
/****** Object:  Table [dbo].[Showroom]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showroom](
	[ShowroomID] [int] IDENTITY(1,1) NOT NULL,
	[DistrictID] [int] NOT NULL,
	[Latitude] [nvarchar](255) NOT NULL,
	[Longitude] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Image] [nvarchar](255) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Showroom] PRIMARY KEY CLUSTERED 
(
	[ShowroomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Showroom] ON
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (1, 1, N'21.039742', N'105.791078', N'Showroom 2', N'04.62811675', N'205 Trần Đăng Ninh, Cầu Giấy - Tel: 04.62811675', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (6, 1, N'21.031740', N'105.799533', N'Showroom 4', N'04.32535054', N'123 Cầu Giấy, Q. Cầu Giấy, Hà Nội - Tel: 04.32535054', N'/images/newspost/2016/6/sc_small_2115_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63500E43A96 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (13, 8, N'21.030292', N'105.813489', N'Showroom 1', N'04.37265438', N'216 Kim Mã, Ba Đình - Tel: 04.37265438', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (14, 3, N'21.009643', N'105.835245', N'Showroom 3', N'04.35773220', N'110 B6 Phạm Ngọc Thạch, Q. Đống Đa, Hà Nội - Tel: 04.35773220', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (15, 2, N'21.008155', N'105.851480', N'Showroom 5', N'04.66536940', N'39 Bạch Mai, Q. Hai Bà Trưng, Hà Nội – Tel: 04.66536940', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (16, 8, N'21.032170', N'105.812855', N'Showroom 6', N'04.32676001', N'F02-B19, TTTM Lotte Center Hanoi, 54 Liễu Giai, Q. Ba Đình, Hà Nội - Tel: 04.32676001', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (17, 3, N'21.028165', N'105.825522', N'Showroom 7', N'043.7368907', N'165 Giảng Võ - Q. Đống Đa - Hà Nội - Tel: 043.7368907', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (18, 7, N'20.992813', N'105.798179', N'Showroom 8', N'043.5526721', N'110B6 Nguyễn Quý Đức - Thanh Xuân Bắc - Hà Nội - Tel: 043.5526721', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (19, 5, N'21.015256', N'105.777308', N'Showroom 9', N'0432 123 265', N'Tầng 1, TTTM The Garden, Đường Mễ Trì, Phường Mỹ Đình 1, Quận Nam Từ Liêm - Hà Nội - Tel: 0432 123 265', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (20, 4, N'21.046493', N'105.870581', N'Showroom 10', N'04.3212.7852', N'217 Ngọc Lâm, Phường Ngọc Lâm, Quận Long Biên, Hà Nội - Tel: 04.3212.7852 ', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (21, 6, N'21.029745', N'105.846187', N'Showroom 11', N'04. 37171888', N'111 Hàng Bông, Quận Hoàn Kiếm, Hà Nội - Tel: 04. 37171888', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (22, 11, N'10.757369', N'106.678004', N'Showroom 1', N'08.39232833', N'156A Nguyễn Trãi, Phường 3, Quận 5 – Tel: 08.39232833', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (23, 12, N'10.740984', N'106.702079', N'Showroom 2', N'08.37752079', N'Tầng 1, TTTM Lotte Mart, Số 469 Nguyễn Hữu Thọ, P. Tân Hưng, Quận 7, TP. Hồ Chí Minh - Tel : 08.37752079', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (24, 13, N'10.774737', N'106.678994', N'Showroom 3', N'08.39258183', N'Số 67, Đường 3 tháng 2, Phường 11, Quận 10, TP. Hồ Chí Minh - Tel : 08.39258183', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (25, 14, N'10.824285', N'106.692137', N'Showroom 4', N'08.39871116', N'Tầng 1, TTTM Emart, 168 Phan Văn Trị, Phường 5, Quận Gò Vấp, TP. Hồ Chí Minh - Tel : 08.39871116', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (26, 15, N'16.034418', N'108.229079', N'Showroom', N'0511.362.4133', N'Tầng 2 -Lotte Mart, Hải Châu, Đà Nẵng – Tel: 0511.362.4133', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (27, 16, N'10.042247', N'105.766675', N'Showroom', N'0710.3696.889', N'Tầng 1 -Lotte Mart, 84 đường Mậu Thân, P. An Hòa, Q. Ninh Kiều, TP. Cần Thơ – Tel: 0710.3696.889', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (28, 17, N'20.432721', N'106.177865', N'Showroom', N'0912997989', N'30 Mạc Thị Bưởi, Nam Định – Tel: 0912997989', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (29, 18, N'20.852546', N'106.685236', N'Showroom', N'031.3843659', N'198 Cầu Đất, Hải Phòng – Tel: 031.3843659', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (30, 19, N'21.277088', N'106.194610', N'Showroom', N'024.06252288/ 0983.854.189', N'68 Ngô Gia Tự, TP Bắc Giang – Tel: 024.06252288/ 0983.854.189', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[Showroom] ([ShowroomID], [DistrictID], [Latitude], [Longitude], [Name], [Phone], [Address], [Image], [CreateDate]) VALUES (31, 20, N'21.341418', N'103.908408', N'Showroom', N'022.3855468', N'346 Đường Tô Hiệu (Bản Lầu), TP Sơn La - Tel: 022.3855468 ', N'/images/newspost/2016/6/sc_small_2086_1486819_184763865054787_193480789_n.jpg', CAST(0x0000A63400000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Showroom] OFF
/****** Object:  Table [dbo].[orders]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [nvarchar](50) NULL,
	[Name] [nvarchar](152) NULL,
	[LName] [nvarchar](512) NULL,
	[Gender] [nvarchar](50) NULL,
	[Phone] [nvarchar](512) NULL,
	[Fax] [nvarchar](542) NULL,
	[Email] [nvarchar](512) NULL,
	[City] [nvarchar](256) NULL,
	[Address] [nvarchar](1000) NULL,
	[Recive] [nvarchar](1000) NULL,
	[Payment] [nvarchar](500) NULL,
	[Shipping] [nvarchar](500) NULL,
	[Note] [ntext] NULL,
	[CreateDate] [smalldatetime] NULL,
	[Status] [bit] NULL,
	[Process] [int] NULL,
	[ShipDate] [smalldatetime] NULL,
	[UserCreate] [nvarchar](50) NULL,
	[Code] [varchar](8) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (1, N'691900', N'soncoi', NULL, N'Nam', N'0967962562', NULL, N'abc1234@gmail.com', N'', N'Hà Nội', N'', N'0', N'', NULL, CAST(0xA6150546 AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'MFTYBQN5')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (2, N'3003000', N'soncoi', NULL, N'Nam', N'0967962562', NULL, N'abc1234@gmail.com', N'', N'Hà Nội', N'', N'0', N'', NULL, CAST(0xA616022E AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'B1VAHD67')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (3, N'3031600', N'soncoi', NULL, N'Nam', N'0967677677', NULL, N'abc1234@gmail.com', N'', N'Hà nội', N'', N'0', N'', NULL, CAST(0xA6340263 AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'GJ4Q5UMY')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (4, N'899800', N'soncoi', NULL, N'Nam', N'0922222222222', NULL, N'abc1234@gmail.com', N'', N'aaa', N'', N'0', N'', NULL, CAST(0xA63C02D9 AS SmallDateTime), 1, 0, NULL, N'abc1234@gmail.com', N'JHXW6NBY')
INSERT [dbo].[orders] ([id], [Total], [Name], [LName], [Gender], [Phone], [Fax], [Email], [City], [Address], [Recive], [Payment], [Shipping], [Note], [CreateDate], [Status], [Process], [ShipDate], [UserCreate], [Code]) VALUES (5, N'83600', N'Kenvil', N'Admin approve', N'Nam', N'0988693490', NULL, N'duynvtest@gmail.com', N'', N'Hà Nọi', N'', N'1', N'', N'Mua hàng', CAST(0xA64202A8 AS SmallDateTime), 1, 2, NULL, N'duynvtest@gmail.com', N'NRLE5UM0')
SET IDENTITY_INSERT [dbo].[orders] OFF
/****** Object:  Table [dbo].[Logs]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventDateTime] [datetime] NOT NULL,
	[EventLevel] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[MachineName] [nvarchar](100) NOT NULL,
	[EventMessage] [nvarchar](max) NOT NULL,
	[ErrorSource] [nvarchar](100) NULL,
	[ErrorClass] [nvarchar](500) NULL,
	[ErrorMethod] [nvarchar](max) NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[InnerErrorMessage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Logs] ON
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (11, CAST(0x0000A63300F7BCB4 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= add,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (12, CAST(0x0000A63300F7C740 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= add,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (13, CAST(0x0000A63300FB8CE0 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= add,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (14, CAST(0x0000A63300FBDA38 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= edit,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (15, CAST(0x0000A63300FBE71C AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= edit,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (16, CAST(0x0000A63300FC2538 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= edit,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (17, CAST(0x0000A63300FC87A8 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = change_emailtemplate,ctrl = adminEmail,type_act= edit,type= ', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (18, CAST(0x0000A63301004190 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = list_emailtemplate,ctrl = adminEmail,type_act= view,type= TT', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (19, CAST(0x0000A63301004898 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = list_emailtemplate,ctrl = adminEmail,type_act= view,type= TT', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (20, CAST(0x0000A63301006E18 AS DateTime), N'Error', N'', N'LANNH6403-PC', N'admin đã truy cập khu vực không hợp lệ:act = list_emailtemplate,ctrl = adminEmail,type_act= view,type= TT', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (21, CAST(0x0000A63400A7EE3C AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com Tạo đơn hàng thành công order_code: GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (22, CAST(0x0000A63400A8A2B4 AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com sử dụng Bảo Kim payment.Date:29/06/2016 10:13:59 SA;order:GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (23, CAST(0x0000A63400A8A2B4 AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com đã tạo Invoice và gọi payment gate Bảo Kim.Date:29/06/2016 10:13:59 SA;order:GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (24, CAST(0x0000A63400A8B448 AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com sử dụng Ngân Lượng payment.Date:29/06/2016 10:14:14 SA;order:GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (25, CAST(0x0000A63400A8B448 AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com đã tạo Invoice và gọi payment gate Ngân Lượng.Date:29/06/2016 10:14:14 SA;order:GJ4Q5UMY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (26, CAST(0x0000A63C00C8490C AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com Tạo đơn hàng thành công order_code: JHXW6NBY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (27, CAST(0x0000A63C00C9543C AS DateTime), N'Info', N'', N'PC1408-0052', N'abc1234@gmail.com Đã tạo order và chưa thanh toán .Date:07/07/2016 12:13:01 CH;order:JHXW6NBY', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (28, CAST(0x0000A64200BAE1CC AS DateTime), N'Info', N'', N'WIN-WEB02', N'duynvtest@gmail.com Tạo đơn hàng thành công order_code: NRLE5UM0', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (29, CAST(0x0000A64200BAFDEC AS DateTime), N'Info', N'', N'WIN-WEB02', N'duynvtest@gmail.com Đã tạo order và chưa thanh toán .Date:13/07/2016 11:20:49 SA;order:NRLE5UM0', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (30, CAST(0x0000A64200BEC008 AS DateTime), N'Info', N'', N'WIN-WEB02', N'Admin chuyển trạng thái đơn hàng  .Date:13/07/2016 11:34:30 SA;order:NRLE5UM0', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (31, CAST(0x0000A64200BEC008 AS DateTime), N'Info', N'', N'WIN-WEB02', N'Đơn hàng đã được thanh toán thành công do Admin approve .Date:13/07/2016 11:34:30 SA;TRANSACTION_STATUS:1', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (32, CAST(0x0000A64B00E26B48 AS DateTime), N'Error', N'', N'PC1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = change_catalog,ctrl = adminCatalog,type_act= edit,type= SP', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (33, CAST(0x0000A64B00E318B8 AS DateTime), N'Error', N'', N'PC1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = list_catalog,ctrl = adminCatalog,type_act= 3123123,type= SP', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (34, CAST(0x0000A64B00E327F4 AS DateTime), N'Error', N'', N'PC1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = list_catalog,ctrl = adminCatalog,type_act= 3123123,type= SP', N'', N'', N'', N'', N'')
INSERT [dbo].[Logs] ([Id], [EventDateTime], [EventLevel], [UserName], [MachineName], [EventMessage], [ErrorSource], [ErrorClass], [ErrorMethod], [ErrorMessage], [InnerErrorMessage]) VALUES (35, CAST(0x0000A64B00E394F0 AS DateTime), N'Error', N'', N'PC1408-0052', N'soncoi đã truy cập khu vực không hợp lệ:act = list_catalog,ctrl = adminCatalog,type_act= view,type= tt4', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Logs] OFF
/****** Object:  Table [dbo].[ImageProducts]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[Images] [nvarchar](1000) NULL,
	[ImagesFull] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ImageProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ImageProducts] ON
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (5, 10, N'/images/product/2014/10/_thumb_10img-produce02-65x77.jpg', N'/images/product/2014/10/_large_10img-produce02-370x428.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (6, 10, N'/images/product/2014/10/_thumb_10img-produce01-80x93.jpg', N'/images/product/2014/10/_large_10img-produce01-350x405.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (7, 10, N'/images/product/2014/10/_thumb_10img-produce03-80x93.jpg', N'/images/product/2014/10/_large_10img-produce03-350x405.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (8, 10, N'/images/product/2014/10/_thumb_10img-produce05-65x77.jpg', N'/images/product/2014/10/_large_10img-produce05-350x405.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (154, 0, N'/images/photoproduct/2015/5/sc_small_2072_4.jpg', N'/images/photoproduct/2015/5/sc_full_2072_4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (155, 0, N'/images/photoproduct/2015/5/sc_small_2074_4.jpg', N'/images/photoproduct/2015/5/sc_full_2074_4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (188, 68, N'/images/photoproduct/2015/6/sc_small_2078_26.jpg', N'/images/photoproduct/2015/6/sc_full_2078_26.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (189, 68, N'/images/photoproduct/2015/6/sc_small_2078_27.jpg', N'/images/photoproduct/2015/6/sc_full_2078_27.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (194, 69, N'/images/photoproduct/2015/6/sc_small_2082_1-29.jpg', N'/images/photoproduct/2015/6/sc_full_2082_1-29.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (195, 69, N'/images/photoproduct/2015/6/sc_small_2082_15-1.jpg', N'/images/photoproduct/2015/6/sc_full_2082_15-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (208, 70, N'/images/photoproduct/2015/6/sc_small_2052_IMG_46211.jpg', N'/images/photoproduct/2015/6/sc_full_2052_IMG_46211.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (241, 103, N'/images/photoproduct/2016/5/sc_small_635990142107419613_good-vibes-–-copper2.jpg', N'/images/photoproduct/2016/5/sc_full_635990142107419613_good-vibes-–-copper2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (242, 104, N'/images/photoproduct/2016/5/sc_small_635990142606638354_good-vibes-–-blonde2.jpg', N'/images/photoproduct/2016/5/sc_full_635990142606638354_good-vibes-–-blonde2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (243, 105, N'/images/photoproduct/2016/5/sc_small_635990143182575912_good-vibes-–-brunette2.jpg', N'/images/photoproduct/2016/5/sc_full_635990143182575912_good-vibes-–-brunette2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (244, 110, N'/images/photoproduct/2016/5/sc_small_635990146307732120_metamorphosis-–-blonde2.jpg', N'/images/photoproduct/2016/5/sc_full_635990146307732120_metamorphosis-–-blonde2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (245, 111, N'/images/photoproduct/2016/5/sc_small_635990147234294654_metamorphosis-–-brunette2.jpg', N'/images/photoproduct/2016/5/sc_full_635990147234294654_metamorphosis-–-brunette2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (246, 112, N'/images/photoproduct/2016/5/sc_small_635990147834763405_metamorphosis-–-red2.jpg', N'/images/photoproduct/2016/5/sc_full_635990147834763405_metamorphosis-–-red2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (247, 113, N'/images/photoproduct/2016/5/sc_small_635990149379607073_revolution-teal2.jpg', N'/images/photoproduct/2016/5/sc_full_635990149379607073_revolution-teal2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (248, 114, N'/images/photoproduct/2016/5/sc_small_635990153428513315_revolution-yellow2.jpg', N'/images/photoproduct/2016/5/sc_full_635990153428513315_revolution-yellow2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (263, 100, N'/images/photoproduct/2016/5/sc_small_635991783125388340_shampoo_1.jpg', N'/images/photoproduct/2016/5/sc_full_635991783125388340_shampoo_1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (270, 43, N'/images/photoproduct/2016/6/sc_small_636028036914649772_timeless-ferment-snail-eye-cream2.jpg', N'/images/photoproduct/2016/6/sc_full_636028036914649772_timeless-ferment-snail-eye-cream2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (271, 43, N'/images/photoproduct/2016/6/sc_small_636028036915779900_timeless-ferment-snail-eye-cream3.jpg', N'/images/photoproduct/2016/6/sc_full_636028036915779900_timeless-ferment-snail-eye-cream3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (272, 43, N'/images/photoproduct/2016/6/sc_small_636028036916530027_timeless-ferment-snail-eye-cream4.jpg', N'/images/photoproduct/2016/6/sc_full_636028036916530027_timeless-ferment-snail-eye-cream4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (273, 42, N'/images/photoproduct/2016/6/sc_small_636028038930996245_timeless-ferment-snail-cream2.jpg', N'/images/photoproduct/2016/6/sc_full_636028038930996245_timeless-ferment-snail-cream2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (274, 42, N'/images/photoproduct/2016/6/sc_small_636028038931691353_timeless-ferment-snail-cream3.jpg', N'/images/photoproduct/2016/6/sc_full_636028038931691353_timeless-ferment-snail-cream3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (275, 62, N'/images/photoproduct/2016/6/sc_small_636028040564141825_timeless-ferment-snail-essence2.jpg', N'/images/photoproduct/2016/6/sc_full_636028040564141825_timeless-ferment-snail-essence2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (276, 62, N'/images/photoproduct/2016/6/sc_small_636028040564726864_timeless-ferment-snail-essence3.jpg', N'/images/photoproduct/2016/6/sc_full_636028040564726864_timeless-ferment-snail-essence3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (277, 62, N'/images/photoproduct/2016/6/sc_small_636028040565442806_timeless-ferment-snail-essence4.jpg', N'/images/photoproduct/2016/6/sc_full_636028040565442806_timeless-ferment-snail-essence4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (278, 83, N'/images/photoproduct/2016/6/sc_small_636028042992845705_timeless-ferment-snail-emulsion3.jpg', N'/images/photoproduct/2016/6/sc_full_636028042992845705_timeless-ferment-snail-emulsion3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (279, 83, N'/images/photoproduct/2016/6/sc_small_636028042993445692_timeless-ferment-snail-emulsion2.jpg', N'/images/photoproduct/2016/6/sc_full_636028042993445692_timeless-ferment-snail-emulsion2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (280, 59, N'/images/photoproduct/2016/6/sc_small_636028074431171236_ferment-snail-toner3.jpg', N'/images/photoproduct/2016/6/sc_full_636028074431171236_ferment-snail-toner3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (281, 59, N'/images/photoproduct/2016/6/sc_small_636028074440692491_ferment-snail-toner2.jpg', N'/images/photoproduct/2016/6/sc_full_636028074440692491_ferment-snail-toner2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (282, 94, N'/images/photoproduct/2016/6/sc_small_636028082404337093_naturalth-goat-milk-premium-cream.jpg', N'/images/photoproduct/2016/6/sc_full_636028082404337093_naturalth-goat-milk-premium-cream.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (283, 64, N'/images/photoproduct/2016/6/sc_small_636028097582027182_naturalth-goat-milk-whitening-essence.jpg', N'/images/photoproduct/2016/6/sc_full_636028097582027182_naturalth-goat-milk-whitening-essence.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (284, 64, N'/images/photoproduct/2016/6/sc_small_636028097583042700_naturalth-goat-milk-whitening-essence-1.jpg', N'/images/photoproduct/2016/6/sc_full_636028097583042700_naturalth-goat-milk-whitening-essence-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (285, 67, N'/images/photoproduct/2016/6/sc_small_636028099409658572_naturalth-goat-milk-whitening-emulsion.jpg', N'/images/photoproduct/2016/6/sc_full_636028099409658572_naturalth-goat-milk-whitening-emulsion.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (286, 67, N'/images/photoproduct/2016/6/sc_small_636028099410294272_naturalth-goat-milk-whitening-emulsion-1.jpg', N'/images/photoproduct/2016/6/sc_full_636028099410294272_naturalth-goat-milk-whitening-emulsion-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (287, 65, N'/images/photoproduct/2016/6/sc_small_636028102003341918_naturalth-goat-milk-whitening-toner.jpg', N'/images/photoproduct/2016/6/sc_full_636028102003341918_naturalth-goat-milk-whitening-toner.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (288, 65, N'/images/photoproduct/2016/6/sc_small_636028102004122266_naturalth-goat-milk-whitening-toner-2.jpg', N'/images/photoproduct/2016/6/sc_full_636028102004122266_naturalth-goat-milk-whitening-toner-2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (289, 84, N'/images/photoproduct/2016/6/sc_small_636028103334282596_aquaporin-moisture-cream3.jpg', N'/images/photoproduct/2016/6/sc_full_636028103334282596_aquaporin-moisture-cream3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (290, 84, N'/images/photoproduct/2016/6/sc_small_636028103335248647_aquaporin-moisture-cream2.jpg', N'/images/photoproduct/2016/6/sc_full_636028103335248647_aquaporin-moisture-cream2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (291, 89, N'/images/photoproduct/2016/6/sc_small_636028112817133427_aquaporin-skincare-set3.jpg', N'/images/photoproduct/2016/6/sc_full_636028112817133427_aquaporin-skincare-set3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (292, 89, N'/images/photoproduct/2016/6/sc_small_636028112818155873_aquaporin-skincare-set2.jpg', N'/images/photoproduct/2016/6/sc_full_636028112818155873_aquaporin-skincare-set2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (293, 91, N'/images/photoproduct/2016/6/sc_small_636028115385805020_aquaporin-waterful-emulsion3.jpg', N'/images/photoproduct/2016/6/sc_full_636028115385805020_aquaporin-waterful-emulsion3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (294, 91, N'/images/photoproduct/2016/6/sc_small_636028115386986038_aquaporin-waterful-emulsion1.jpg', N'/images/photoproduct/2016/6/sc_full_636028115386986038_aquaporin-waterful-emulsion1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (295, 93, N'/images/photoproduct/2016/6/sc_small_636028117412243956_aquaporin-rich-cream2.jpg', N'/images/photoproduct/2016/6/sc_full_636028117412243956_aquaporin-rich-cream2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (296, 93, N'/images/photoproduct/2016/6/sc_small_636028117413044481_aquaporin-rich-cream1.jpg', N'/images/photoproduct/2016/6/sc_full_636028117413044481_aquaporin-rich-cream1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (297, 92, N'/images/photoproduct/2016/6/sc_small_636028121857946761_timeless-ferment-snail-suncream1--.jpg', N'/images/photoproduct/2016/6/sc_full_636028121857946761_timeless-ferment-snail-suncream1--.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (298, 119, N'/images/photoproduct/2016/6/sc_small_636028123106452473_my-sunny-perfecting-sun-block2.jpg', N'/images/photoproduct/2016/6/sc_full_636028123106452473_my-sunny-perfecting-sun-block2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (299, 102, N'/images/photoproduct/2016/6/sc_small_636028124353425019_tony-lab-ac-control-whitening-after-spot3.jpg', N'/images/photoproduct/2016/6/sc_full_636028124353425019_tony-lab-ac-control-whitening-after-spot3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (300, 102, N'/images/photoproduct/2016/6/sc_small_636028124354049286_tony-lab-ac-control-whitening-after-spot.jpg', N'/images/photoproduct/2016/6/sc_full_636028124354049286_tony-lab-ac-control-whitening-after-spot.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (301, 72, N'/images/photoproduct/2016/6/sc_small_636028127244717849_aquaporin-water-volume-eye-gel3.jpg', N'/images/photoproduct/2016/6/sc_full_636028127244717849_aquaporin-water-volume-eye-gel3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (302, 72, N'/images/photoproduct/2016/6/sc_small_636028127245404933_aquaporin-water-volume-eye-gel.jpg', N'/images/photoproduct/2016/6/sc_full_636028127245404933_aquaporin-water-volume-eye-gel.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (303, 71, N'/images/photoproduct/2016/6/sc_small_636028128489200086_aquaporin-watery-essence4.jpg', N'/images/photoproduct/2016/6/sc_full_636028128489200086_aquaporin-watery-essence4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (304, 71, N'/images/photoproduct/2016/6/sc_small_636028128490137562_aquaporin-watery-essence3.jpg', N'/images/photoproduct/2016/6/sc_full_636028128490137562_aquaporin-watery-essence3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (305, 71, N'/images/photoproduct/2016/6/sc_small_636028128491074941_aquaporin-watery-essence.jpg', N'/images/photoproduct/2016/6/sc_full_636028128491074941_aquaporin-watery-essence.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (306, 87, N'/images/photoproduct/2016/6/sc_small_636028130225975206_aquaporin-opening-toner2.jpg', N'/images/photoproduct/2016/6/sc_full_636028130225975206_aquaporin-opening-toner2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (307, 87, N'/images/photoproduct/2016/6/sc_small_636028130226556564_aquaporin-opening-toner.jpg', N'/images/photoproduct/2016/6/sc_full_636028130226556564_aquaporin-opening-toner.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (308, 123, N'/images/photoproduct/2016/6/sc_small_636028830178219278_aloe-fresh-mask-sheet1.jpg', N'/images/photoproduct/2016/6/sc_full_636028830178219278_aloe-fresh-mask-sheet1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (309, 125, N'/images/photoproduct/2016/6/sc_small_636028832318436298_luxury-gem-gold-24k-mask4.jpg', N'/images/photoproduct/2016/6/sc_full_636028832318436298_luxury-gem-gold-24k-mask4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (310, 125, N'/images/photoproduct/2016/6/sc_small_636028832318998663_luxury-gem-gold-24k-mask3.jpg', N'/images/photoproduct/2016/6/sc_full_636028832318998663_luxury-gem-gold-24k-mask3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (311, 125, N'/images/photoproduct/2016/6/sc_small_636028832319555247_luxury-gem-gold-24k-mask2.jpg', N'/images/photoproduct/2016/6/sc_full_636028832319555247_luxury-gem-gold-24k-mask2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (312, 127, N'/images/photoproduct/2016/6/sc_small_636028839165612354_pureness-100-mask-sheet7.jpg', N'/images/photoproduct/2016/6/sc_full_636028839165612354_pureness-100-mask-sheet7.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (313, 127, N'/images/photoproduct/2016/6/sc_small_636028839166316759_pureness-100-mask-sheet6.jpg', N'/images/photoproduct/2016/6/sc_full_636028839166316759_pureness-100-mask-sheet6.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (314, 127, N'/images/photoproduct/2016/6/sc_small_636028839171096259_pureness-100-mask-sheet5.jpg', N'/images/photoproduct/2016/6/sc_full_636028839171096259_pureness-100-mask-sheet5.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (315, 127, N'/images/photoproduct/2016/6/sc_small_636028839172263994_pureness-100-mask-sheet4.jpg', N'/images/photoproduct/2016/6/sc_full_636028839172263994_pureness-100-mask-sheet4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (316, 127, N'/images/photoproduct/2016/6/sc_small_636028839173054426_pureness-100-mask-sheet3.jpg', N'/images/photoproduct/2016/6/sc_full_636028839173054426_pureness-100-mask-sheet3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (317, 127, N'/images/photoproduct/2016/6/sc_small_636028839173719633_pureness-100-mask-sheet2.jpg', N'/images/photoproduct/2016/6/sc_full_636028839173719633_pureness-100-mask-sheet2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (318, 127, N'/images/photoproduct/2016/6/sc_small_636028839174279599_pureness-100-mask-sheet1.jpg', N'/images/photoproduct/2016/6/sc_full_636028839174279599_pureness-100-mask-sheet1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (319, 127, N'/images/photoproduct/2016/6/sc_small_636028839174890004_pureness-100-mask-sheet9.jpg', N'/images/photoproduct/2016/6/sc_full_636028839174890004_pureness-100-mask-sheet9.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (320, 127, N'/images/photoproduct/2016/6/sc_small_636028839175515798_pureness-100-mask-sheet8.jpg', N'/images/photoproduct/2016/6/sc_full_636028839175515798_pureness-100-mask-sheet8.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (321, 128, N'/images/photoproduct/2016/6/sc_small_636028849387338402_im-real-mask-sheet7.jpg', N'/images/photoproduct/2016/6/sc_full_636028849387338402_im-real-mask-sheet7.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (322, 128, N'/images/photoproduct/2016/6/sc_small_636028849388424133_im-real-mask-sheet6.jpg', N'/images/photoproduct/2016/6/sc_full_636028849388424133_im-real-mask-sheet6.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (323, 128, N'/images/photoproduct/2016/6/sc_small_636028849389359033_im-real-mask-sheet5.jpg', N'/images/photoproduct/2016/6/sc_full_636028849389359033_im-real-mask-sheet5.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (324, 128, N'/images/photoproduct/2016/6/sc_small_636028849390075535_im-real-mask-sheet4.jpg', N'/images/photoproduct/2016/6/sc_full_636028849390075535_im-real-mask-sheet4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (325, 128, N'/images/photoproduct/2016/6/sc_small_636028849391155313_im-real-mask-sheet3.jpg', N'/images/photoproduct/2016/6/sc_full_636028849391155313_im-real-mask-sheet3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (326, 128, N'/images/photoproduct/2016/6/sc_small_636028849392126197_im-real-mask-sheet2.jpg', N'/images/photoproduct/2016/6/sc_full_636028849392126197_im-real-mask-sheet2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (327, 128, N'/images/photoproduct/2016/6/sc_small_636028849393106348_im-real-mask-sheet1.jpg', N'/images/photoproduct/2016/6/sc_full_636028849393106348_im-real-mask-sheet1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (328, 128, N'/images/photoproduct/2016/6/sc_small_636028849394206952_im-real-mask-sheet.jpg', N'/images/photoproduct/2016/6/sc_full_636028849394206952_im-real-mask-sheet.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (329, 129, N'/images/photoproduct/2016/6/sc_small_636028852888015912_nose-pack34.jpg', N'/images/photoproduct/2016/6/sc_full_636028852888015912_nose-pack34.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (330, 129, N'/images/photoproduct/2016/6/sc_small_636028852890281155_nose-pack2.jpg', N'/images/photoproduct/2016/6/sc_full_636028852890281155_nose-pack2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (331, 134, N'/images/photoproduct/2016/6/sc_small_636028860824837420_timeless-ferment-snail-cleanser1.jpg', N'/images/photoproduct/2016/6/sc_full_636028860824837420_timeless-ferment-snail-cleanser1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (332, 134, N'/images/photoproduct/2016/6/sc_small_636028861024096904_timeless-ferment-snail-cleanser2.jpg', N'/images/photoproduct/2016/6/sc_full_636028861024096904_timeless-ferment-snail-cleanser2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (333, 137, N'/images/photoproduct/2016/6/sc_small_636028997652005021_moisture-foam-cleanser2.jpg', N'/images/photoproduct/2016/6/sc_full_636028997652005021_moisture-foam-cleanser2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (334, 138, N'/images/photoproduct/2016/6/sc_small_636028998822725337_tony-lab-ac-control-acne-foam2.jpg', N'/images/photoproduct/2016/6/sc_full_636028998822725337_tony-lab-ac-control-acne-foam2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (335, 139, N'/images/photoproduct/2016/6/sc_small_636028999992152511_img_0581-1.jpg', N'/images/photoproduct/2016/6/sc_full_636028999992152511_img_0581-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (336, 141, N'/images/photoproduct/2016/6/sc_small_636029001219662462_img_0571-1.jpg', N'/images/photoproduct/2016/6/sc_full_636029001219662462_img_0571-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (337, 143, N'/images/photoproduct/2016/6/sc_small_636029002240624507_img_0578-1.jpg', N'/images/photoproduct/2016/6/sc_full_636029002240624507_img_0578-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (338, 144, N'/images/photoproduct/2016/6/sc_small_636029005886622335_img_0580-1.jpg', N'/images/photoproduct/2016/6/sc_full_636029005886622335_img_0580-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (339, 145, N'/images/photoproduct/2016/6/sc_small_636029007953329473_img_0579-1.jpg', N'/images/photoproduct/2016/6/sc_full_636029007953329473_img_0579-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (340, 146, N'/images/photoproduct/2016/6/sc_small_636029011205355056_srm-trung2.jpg', N'/images/photoproduct/2016/6/sc_full_636029011205355056_srm-trung2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (342, 146, N'/images/photoproduct/2016/6/sc_small_636029011206954034_srm-trung.jpg', N'/images/photoproduct/2016/6/sc_full_636029011206954034_srm-trung.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (343, 148, N'/images/photoproduct/2016/6/sc_small_636029018787710982_magic-foot-banana-sleeping-pack3.jpg', N'/images/photoproduct/2016/6/sc_full_636029018787710982_magic-foot-banana-sleeping-pack3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (344, 148, N'/images/photoproduct/2016/6/sc_small_636029018788791177_magic-foot-banana-sleeping-pack2.jpg', N'/images/photoproduct/2016/6/sc_full_636029018788791177_magic-foot-banana-sleeping-pack2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (345, 149, N'/images/photoproduct/2016/6/sc_small_636029019686754180_aquaporine-water-bomb-sleeping-pack2.jpg', N'/images/photoproduct/2016/6/sc_full_636029019686754180_aquaporine-water-bomb-sleeping-pack2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (346, 151, N'/images/photoproduct/2016/6/sc_small_636029022299617080_blast--perfect-lip-eye-remover1.jpg', N'/images/photoproduct/2016/6/sc_full_636029022299617080_blast--perfect-lip-eye-remover1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (347, 152, N'/images/photoproduct/2016/6/sc_small_636029024626253280_clean-dew-apple-mint-cleansing-oil.jpg', N'/images/photoproduct/2016/6/sc_full_636029024626253280_clean-dew-apple-mint-cleansing-oil.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (348, 153, N'/images/photoproduct/2016/6/sc_small_636029025974240349_fresh-lip-eye-remover2.jpg', N'/images/photoproduct/2016/6/sc_full_636029025974240349_fresh-lip-eye-remover2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (349, 154, N'/images/photoproduct/2016/6/sc_small_636029026972329059_clean-dew-avocado-cleansing-cream4.jpg', N'/images/photoproduct/2016/6/sc_full_636029026972329059_clean-dew-avocado-cleansing-cream4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (350, 154, N'/images/photoproduct/2016/6/sc_small_636029026973124974_201329458788915.jpg', N'/images/photoproduct/2016/6/sc_full_636029026973124974_201329458788915.jpg')
GO
print 'Processed 100 total records'
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (351, 158, N'/images/photoproduct/2016/7/sc_small_636029620780194054_floria-essence-body-mist2.jpg', N'/images/photoproduct/2016/7/sc_full_636029620780194054_floria-essence-body-mist2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (352, 159, N'/images/photoproduct/2016/7/sc_small_636029629167062923_blooming-days-shower-cologne-6.jpg', N'/images/photoproduct/2016/7/sc_full_636029629167062923_blooming-days-shower-cologne-6.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (353, 159, N'/images/photoproduct/2016/7/sc_small_636029629167889378_blooming-days-shower-cologne-3.jpg', N'/images/photoproduct/2016/7/sc_full_636029629167889378_blooming-days-shower-cologne-3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (354, 159, N'/images/photoproduct/2016/7/sc_small_636029629168715073_blooming-days-shower-cologne-4.jpg', N'/images/photoproduct/2016/7/sc_full_636029629168715073_blooming-days-shower-cologne-4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (355, 159, N'/images/photoproduct/2016/7/sc_small_636029629169514034_blooming-days-shower-cologne-5.jpg', N'/images/photoproduct/2016/7/sc_full_636029629169514034_blooming-days-shower-cologne-5.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (356, 159, N'/images/photoproduct/2016/7/sc_small_636029629170094141_blooming-days-shower-cologne-1.jpg', N'/images/photoproduct/2016/7/sc_full_636029629170094141_blooming-days-shower-cologne-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (357, 159, N'/images/photoproduct/2016/7/sc_small_636029629170664243_blooming-days-shower-cologne-2.jpg', N'/images/photoproduct/2016/7/sc_full_636029629170664243_blooming-days-shower-cologne-2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (358, 160, N'/images/photoproduct/2016/7/sc_small_636029681073473211_blooming-days-perfum-body-lotion3.jpg', N'/images/photoproduct/2016/7/sc_full_636029681073473211_blooming-days-perfum-body-lotion3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (359, 160, N'/images/photoproduct/2016/7/sc_small_636029681074098876_blooming-days-perfum-body-lotion2.jpg', N'/images/photoproduct/2016/7/sc_full_636029681074098876_blooming-days-perfum-body-lotion2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (360, 162, N'/images/photoproduct/2016/7/sc_small_636029683335450535_aloegel2.jpg', N'/images/photoproduct/2016/7/sc_full_636029683335450535_aloegel2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (361, 165, N'/images/photoproduct/2016/7/sc_small_636029687500919702_blooming-days-perfume-body-cleanser2.jpg', N'/images/photoproduct/2016/7/sc_full_636029687500919702_blooming-days-perfume-body-cleanser2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (362, 165, N'/images/photoproduct/2016/7/sc_small_636029687501650032_blooming-days-perfume-body-cleanser3.jpg', N'/images/photoproduct/2016/7/sc_full_636029687501650032_blooming-days-perfume-body-cleanser3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (363, 166, N'/images/photoproduct/2016/7/sc_small_636029689834554677_naturath-green-food-moisture-hand-cream---shea-butter.jpg', N'/images/photoproduct/2016/7/sc_full_636029689834554677_naturath-green-food-moisture-hand-cream---shea-butter.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (364, 166, N'/images/photoproduct/2016/7/sc_small_636029689835422042_naturath-green-food-moisture-hand-cream---avocado.jpg', N'/images/photoproduct/2016/7/sc_full_636029689835422042_naturath-green-food-moisture-hand-cream---avocado.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (365, 167, N'/images/photoproduct/2016/7/sc_small_636029693213984784_naturath-green-flower-moisture-hand-cream---acacia.jpg', N'/images/photoproduct/2016/7/sc_full_636029693213984784_naturath-green-flower-moisture-hand-cream---acacia.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (366, 168, N'/images/photoproduct/2016/7/sc_small_636029695471574772_magic-foot-banana-hand-milk3.jpg', N'/images/photoproduct/2016/7/sc_full_636029695471574772_magic-foot-banana-hand-milk3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (367, 168, N'/images/photoproduct/2016/7/sc_small_636029695472226425_magic-foot-banana-hand-milk2.jpg', N'/images/photoproduct/2016/7/sc_full_636029695472226425_magic-foot-banana-hand-milk2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (368, 169, N'/images/photoproduct/2016/7/sc_small_636029698765420711_im-real-milk2.jpg', N'/images/photoproduct/2016/7/sc_full_636029698765420711_im-real-milk2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (369, 172, N'/images/photoproduct/2016/7/sc_small_636029701484534290_peach-anti-aging-handcream2.jpg', N'/images/photoproduct/2016/7/sc_full_636029701484534290_peach-anti-aging-handcream2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (370, 177, N'/images/photoproduct/2016/7/sc_small_636029761595569338_ac-control-bb-cream.jpg', N'/images/photoproduct/2016/7/sc_full_636029761595569338_ac-control-bb-cream.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (371, 177, N'/images/photoproduct/2016/7/sc_small_636029761596159819_ac-control-bb3.jpg', N'/images/photoproduct/2016/7/sc_full_636029761596159819_ac-control-bb3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (372, 177, N'/images/photoproduct/2016/7/sc_small_636029761596832277_ac-control-bb4.jpg', N'/images/photoproduct/2016/7/sc_full_636029761596832277_ac-control-bb4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (373, 179, N'/images/photoproduct/2016/7/sc_small_636029763467790501_bc-dation5.jpg', N'/images/photoproduct/2016/7/sc_full_636029763467790501_bc-dation5.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (374, 179, N'/images/photoproduct/2016/7/sc_small_636029763468400803_bc-dation1.jpg', N'/images/photoproduct/2016/7/sc_full_636029763468400803_bc-dation1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (375, 180, N'/images/photoproduct/2016/7/sc_small_636029765244133325_cc-cream-4.jpg', N'/images/photoproduct/2016/7/sc_full_636029765244133325_cc-cream-4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (376, 180, N'/images/photoproduct/2016/7/sc_small_636029765244775230_cc-cream-3.jpg', N'/images/photoproduct/2016/7/sc_full_636029765244775230_cc-cream-3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (377, 181, N'/images/photoproduct/2016/7/sc_small_636032294151410515_bc-dation-cushion-plus2.jpg', N'/images/photoproduct/2016/7/sc_full_636032294151410515_bc-dation-cushion-plus2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (378, 181, N'/images/photoproduct/2016/7/sc_small_636032294152360569_bc-dation-cushion-plus3.jpg', N'/images/photoproduct/2016/7/sc_full_636032294152360569_bc-dation-cushion-plus3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (379, 181, N'/images/photoproduct/2016/7/sc_small_636032294153200617_bc-dation-cushion-plus2.jpg', N'/images/photoproduct/2016/7/sc_full_636032294153200617_bc-dation-cushion-plus2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (380, 182, N'/images/photoproduct/2016/7/sc_small_636032344966186902_bc-dation-water-pack.jpg', N'/images/photoproduct/2016/7/sc_full_636032344966186902_bc-dation-water-pack.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (381, 183, N'/images/photoproduct/2016/7/sc_small_636032347251157588_aqua-aura-uv-moist-cushion3.jpg', N'/images/photoproduct/2016/7/sc_full_636032347251157588_aqua-aura-uv-moist-cushion3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (382, 183, N'/images/photoproduct/2016/7/sc_small_636032347252487664_aqua-aura-uv-moist-cushion4.jpg', N'/images/photoproduct/2016/7/sc_full_636032347252487664_aqua-aura-uv-moist-cushion4.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (383, 184, N'/images/photoproduct/2016/7/sc_small_636032348426634820_aqua-aura-jelly-cushion2.jpg', N'/images/photoproduct/2016/7/sc_full_636032348426634820_aqua-aura-jelly-cushion2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (384, 184, N'/images/photoproduct/2016/7/sc_small_636032348427864891_aqua-aura-jelly-cushion3.jpg', N'/images/photoproduct/2016/7/sc_full_636032348427864891_aqua-aura-jelly-cushion3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (385, 185, N'/images/photoproduct/2016/7/sc_small_636032349462334104_timeless-carat-moisture-soft-powder-pact1.jpg', N'/images/photoproduct/2016/7/sc_full_636032349462334104_timeless-carat-moisture-soft-powder-pact1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (386, 185, N'/images/photoproduct/2016/7/sc_small_636032349463624178_timeless-carat-moisture-soft-powder-pact3.jpg', N'/images/photoproduct/2016/7/sc_full_636032349463624178_timeless-carat-moisture-soft-powder-pact3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (387, 186, N'/images/photoproduct/2016/7/sc_small_636032350608639665_face-mix-mineral-powder-pact1.jpg', N'/images/photoproduct/2016/7/sc_full_636032350608639665_face-mix-mineral-powder-pact1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (388, 186, N'/images/photoproduct/2016/7/sc_small_636032350609629722_face-mix-mineral-powder-pact2.jpg', N'/images/photoproduct/2016/7/sc_full_636032350609629722_face-mix-mineral-powder-pact2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (389, 186, N'/images/photoproduct/2016/7/sc_small_636032350610599778_face-mix-mineral-powder-pact3.jpg', N'/images/photoproduct/2016/7/sc_full_636032350610599778_face-mix-mineral-powder-pact3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (390, 187, N'/images/photoproduct/2016/7/sc_small_636032351547833360_face-mix-oil-paper-powder-1.jpg', N'/images/photoproduct/2016/7/sc_full_636032351547833360_face-mix-oil-paper-powder-1.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (391, 187, N'/images/photoproduct/2016/7/sc_small_636032351548813416_face-mix-oil-paper-powder-2.jpg', N'/images/photoproduct/2016/7/sc_full_636032351548813416_face-mix-oil-paper-powder-2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (392, 187, N'/images/photoproduct/2016/7/sc_small_636032351549793472_face-mix-oil-paper-powder-3.jpg', N'/images/photoproduct/2016/7/sc_full_636032351549793472_face-mix-oil-paper-powder-3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (393, 188, N'/images/photoproduct/2016/7/sc_small_636032470858607559_timeless-carat-dual-concenaler2.jpg', N'/images/photoproduct/2016/7/sc_full_636032470858607559_timeless-carat-dual-concenaler2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (394, 189, N'/images/photoproduct/2016/7/sc_small_636032477584762297_primer-lip-concealer-2.jpg', N'/images/photoproduct/2016/7/sc_full_636032477584762297_primer-lip-concealer-2.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (395, 189, N'/images/photoproduct/2016/7/sc_small_636032477585752353_primer-lip-concealer-3.jpg', N'/images/photoproduct/2016/7/sc_full_636032477585752353_primer-lip-concealer-3.jpg')
INSERT [dbo].[ImageProducts] ([ID], [MaSP], [Images], [ImagesFull]) VALUES (396, 189, N'/images/photoproduct/2016/7/sc_small_636032477592832759_primer-lip-concealer.jpg', N'/images/photoproduct/2016/7/sc_full_636032477592832759_primer-lip-concealer.jpg')
SET IDENTITY_INSERT [dbo].[ImageProducts] OFF
/****** Object:  Table [dbo].[ImageAlbums]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageAlbums](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CatalogID] [int] NULL,
	[Images] [nvarchar](1000) NULL,
	[ImagesFull] [nvarchar](1000) NULL,
	[ImagesName] [nvarchar](250) NULL,
	[ImagesDes] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ImageAlbums] ON
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (30, 48, N'/images/photogallery/2015/6/sc_small_2094_tumblr_nm0jchnbof1qbd81ro1_1280.png', N'/images/photogallery/2015/6/sc_full_2094_tumblr_nm0jchnbof1qbd81ro1_1280.png', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (31, 48, N'/images/photogallery/2015/6/sc_small_2094_tumblr_nmg5tjGV4n1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2094_tumblr_nmg5tjGV4n1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (32, 48, N'/images/photogallery/2015/6/sc_small_2094_tumblr_no8dy49Rpp1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2094_tumblr_no8dy49Rpp1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (33, 48, N'/images/photogallery/2015/6/sc_small_2094_tumblr_np1x8aUHJY1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2094_tumblr_np1x8aUHJY1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (34, 48, N'/images/photogallery/2015/6/sc_small_2036_tumblr_nobxnafijq1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2036_tumblr_nobxnafijq1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (35, 49, N'/images/photogallery/2015/6/sc_small_2036_tumblr_nmrx58Px3o1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2036_tumblr_nmrx58Px3o1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (36, 49, N'/images/photogallery/2015/6/sc_small_2036_tumblr_nlrwpyPRI81qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2036_tumblr_nlrwpyPRI81qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (37, 49, N'/images/photogallery/2015/6/sc_small_2036_tumblr_nmrx1feU5c1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2036_tumblr_nmrx1feU5c1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (38, 55, N'/images/photogallery/2015/6/sc_small_2041_tumblr_nlg5mfwvsT1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2041_tumblr_nlg5mfwvsT1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (39, 55, N'/images/photogallery/2015/6/sc_small_2041_tumblr_nlht8zyVgs1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2041_tumblr_nlht8zyVgs1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (40, 56, N'/images/photogallery/2015/6/sc_small_2041_tumblr_nlc4lg1cHf1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2041_tumblr_nlc4lg1cHf1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (41, 56, N'/images/photogallery/2015/6/sc_small_2041_tumblr_np9airfzlj1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2041_tumblr_np9airfzlj1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (42, 57, N'/images/photogallery/2015/6/sc_small_2042_tumblr_now0kaHKzo1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2042_tumblr_now0kaHKzo1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (43, 57, N'/images/photogallery/2015/6/sc_small_2042_tumblr_no8dxy81m81qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2042_tumblr_no8dxy81m81qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (44, 57, N'/images/photogallery/2015/6/sc_small_2042_tumblr_nlno94mQTl1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2042_tumblr_nlno94mQTl1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (46, 58, N'/images/photogallery/2015/6/sc_small_2042_tumblr_nozq7eHAK31qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2042_tumblr_nozq7eHAK31qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (47, 58, N'/images/photogallery/2015/6/sc_small_2043_tumblr_np1x8aUHJY1qbd81ro1_1280.jpg', N'/images/photogallery/2015/6/sc_full_2043_tumblr_np1x8aUHJY1qbd81ro1_1280.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (48, 54, N'/images/photogallery/2015/6/sc_small_2079_demo999-35.jpg', N'/images/photogallery/2015/6/sc_full_2079_demo999-35.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (49, 54, N'/images/photogallery/2015/6/sc_small_2080_MG_1234.jpg', N'/images/photogallery/2015/6/sc_full_2080_MG_1234.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (50, 54, N'/images/photogallery/2015/6/sc_small_2080_MG_1448.jpg', N'/images/photogallery/2015/6/sc_full_2080_MG_1448.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (51, 54, N'/images/photogallery/2015/6/sc_small_2080_demo999-43.jpg', N'/images/photogallery/2015/6/sc_full_2080_demo999-43.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (52, 59, N'/images/photogallery/2015/6/sc_small_2081_demo999-44.jpg', N'/images/photogallery/2015/6/sc_full_2081_demo999-44.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (53, 59, N'/images/photogallery/2015/6/sc_small_2081_demo999-43.jpg', N'/images/photogallery/2015/6/sc_full_2081_demo999-43.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (54, 59, N'/images/photogallery/2015/6/sc_small_2081_demo999-42.jpg', N'/images/photogallery/2015/6/sc_full_2081_demo999-42.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (55, 59, N'/images/photogallery/2015/6/sc_small_2082_demo999-41.jpg', N'/images/photogallery/2015/6/sc_full_2082_demo999-41.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (56, 59, N'/images/photogallery/2015/6/sc_small_2082_demo999-29.jpg', N'/images/photogallery/2015/6/sc_full_2082_demo999-29.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (57, 59, N'/images/photogallery/2015/6/sc_small_2082_demo999-46.jpg', N'/images/photogallery/2015/6/sc_full_2082_demo999-46.jpg', N'', N'')
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (58, 0, N'/images/photogallery/2015/12/sc_small_2147_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', N'/images/photogallery/2015/12/sc_full_2147_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (59, 0, N'/images/photogallery/2015/12/sc_small_2110_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', N'/images/photogallery/2015/12/sc_full_2110_462015115tumblr_nlhshjutot1qbd81ro1_1280.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (60, 46, N'/images/photogallery/2016/4/sc_small_2095_img_8160.jpg', N'/images/photogallery/2016/4/sc_full_2095_img_8160.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (61, 46, N'/images/photogallery/2016/4/sc_small_2130_img_8164.jpg', N'/images/photogallery/2016/4/sc_full_2130_img_8164.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (62, 46, N'/images/photogallery/2016/5/sc_small_2044_img_8169.jpg', N'/images/photogallery/2016/5/sc_full_2044_img_8169.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (63, 46, N'/images/photogallery/2016/5/sc_small_2060_img_8174.jpg', N'/images/photogallery/2016/5/sc_full_2060_img_8174.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (64, 46, N'/images/photogallery/2016/5/sc_small_2071_img_8177.jpg', N'/images/photogallery/2016/5/sc_full_2071_img_8177.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (65, 46, N'/images/photogallery/2016/5/sc_small_2081_img_8178.jpg', N'/images/photogallery/2016/5/sc_full_2081_img_8178.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (66, 46, N'/images/photogallery/2016/5/sc_small_2092_img_8180.jpg', N'/images/photogallery/2016/5/sc_full_2092_img_8180.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (67, 46, N'/images/photogallery/2016/5/sc_small_2042_img_8181.jpg', N'/images/photogallery/2016/5/sc_full_2042_img_8181.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (68, 46, N'/images/photogallery/2016/5/sc_small_2053_img_8183.jpg', N'/images/photogallery/2016/5/sc_full_2053_img_8183.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (69, 46, N'/images/photogallery/2016/5/sc_small_2065_img_8185.jpg', N'/images/photogallery/2016/5/sc_full_2065_img_8185.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (70, 46, N'/images/photogallery/2016/5/sc_small_2075_img_8187.jpg', N'/images/photogallery/2016/5/sc_full_2075_img_8187.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (71, 46, N'/images/photogallery/2016/5/sc_small_2041_img_8190.jpg', N'/images/photogallery/2016/5/sc_full_2041_img_8190.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (72, 46, N'/images/photogallery/2016/5/sc_small_2042_img_8191.jpg', N'/images/photogallery/2016/5/sc_full_2042_img_8191.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (73, 46, N'/images/photogallery/2016/5/sc_small_2058_img_8193.jpg', N'/images/photogallery/2016/5/sc_full_2058_img_8193.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (74, 46, N'/images/photogallery/2016/5/sc_small_2094_img_8194.jpg', N'/images/photogallery/2016/5/sc_full_2094_img_8194.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (75, 46, N'/images/photogallery/2016/5/sc_small_2090_img_8195.jpg', N'/images/photogallery/2016/5/sc_full_2090_img_8195.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (85, 46, N'/images/photogallery/2016/5/sc_small_635980380430158368_img_8198.jpg', N'/images/photogallery/2016/5/sc_full_635980380430158368_img_8198.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (86, 46, N'/images/photogallery/2016/5/sc_small_635980380435939618_img_8199.jpg', N'/images/photogallery/2016/5/sc_full_635980380435939618_img_8199.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (87, 46, N'/images/photogallery/2016/5/sc_small_635980380439533368_img_8202.jpg', N'/images/photogallery/2016/5/sc_full_635980380439533368_img_8202.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (88, 46, N'/images/photogallery/2016/5/sc_small_635980380753127091_img_8206.jpg', N'/images/photogallery/2016/5/sc_full_635980380753127091_img_8206.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (89, 46, N'/images/photogallery/2016/5/sc_small_635980380757970841_img_8209.jpg', N'/images/photogallery/2016/5/sc_full_635980380757970841_img_8209.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (90, 46, N'/images/photogallery/2016/5/sc_small_635980380763439592_img_8212.jpg', N'/images/photogallery/2016/5/sc_full_635980380763439592_img_8212.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (91, 46, N'/images/photogallery/2016/5/sc_small_635980381493752106_img_8226.jpg', N'/images/photogallery/2016/5/sc_full_635980381493752106_img_8226.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (92, 46, N'/images/photogallery/2016/5/sc_small_635980381498439606_img_8235.jpg', N'/images/photogallery/2016/5/sc_full_635980381498439606_img_8235.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (93, 46, N'/images/photogallery/2016/5/sc_small_635980381502970857_img_8237.jpg', N'/images/photogallery/2016/5/sc_full_635980381502970857_img_8237.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (94, 47, N'/images/photogallery/2016/5/sc_small_635980463852502141_img_8223.jpg', N'/images/photogallery/2016/5/sc_full_635980463852502141_img_8223.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (95, 47, N'/images/photogallery/2016/5/sc_small_635980463857189641_img_8238.jpg', N'/images/photogallery/2016/5/sc_full_635980463857189641_img_8238.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (96, 47, N'/images/photogallery/2016/5/sc_small_635980464404533328_img_8266.jpg', N'/images/photogallery/2016/5/sc_full_635980464404533328_img_8266.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (97, 47, N'/images/photogallery/2016/5/sc_small_635980464410627079_img_8272.jpg', N'/images/photogallery/2016/5/sc_full_635980464410627079_img_8272.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (98, 47, N'/images/photogallery/2016/5/sc_small_635980465069689585_img_8273.jpg', N'/images/photogallery/2016/5/sc_full_635980465069689585_img_8273.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (99, 47, N'/images/photogallery/2016/5/sc_small_635980465083595837_img_8276.jpg', N'/images/photogallery/2016/5/sc_full_635980465083595837_img_8276.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (100, 47, N'/images/photogallery/2016/5/sc_small_635980465429689562_img_8350.jpg', N'/images/photogallery/2016/5/sc_full_635980465429689562_img_8350.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (101, 47, N'/images/photogallery/2016/5/sc_small_635980465433908313_img_8351.jpg', N'/images/photogallery/2016/5/sc_full_635980465433908313_img_8351.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (102, 47, N'/images/photogallery/2016/5/sc_small_635980465440470814_img_8353.jpg', N'/images/photogallery/2016/5/sc_full_635980465440470814_img_8353.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (103, 47, N'/images/photogallery/2016/5/sc_small_635980466219533332_img_8301.jpg', N'/images/photogallery/2016/5/sc_full_635980466219533332_img_8301.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (104, 47, N'/images/photogallery/2016/5/sc_small_635980466223752083_img_8305.jpg', N'/images/photogallery/2016/5/sc_full_635980466223752083_img_8305.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (105, 47, N'/images/photogallery/2016/5/sc_small_635980466229220833_img_8312.jpg', N'/images/photogallery/2016/5/sc_full_635980466229220833_img_8312.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (106, 47, N'/images/photogallery/2016/5/sc_small_635980475012814577_img_8372.jpg', N'/images/photogallery/2016/5/sc_full_635980475012814577_img_8372.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (107, 47, N'/images/photogallery/2016/5/sc_small_635980475019377077_img_8379.jpg', N'/images/photogallery/2016/5/sc_full_635980475019377077_img_8379.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (108, 47, N'/images/photogallery/2016/5/sc_small_635980475024220828_img_8380.jpg', N'/images/photogallery/2016/5/sc_full_635980475024220828_img_8380.jpg', NULL, NULL)
INSERT [dbo].[ImageAlbums] ([ID], [CatalogID], [Images], [ImagesFull], [ImagesName], [ImagesDes]) VALUES (109, 47, N'/images/photogallery/2016/5/sc_small_635980475362814612_img_8385.jpg', N'/images/photogallery/2016/5/sc_full_635980475362814612_img_8385.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[ImageAlbums] OFF
/****** Object:  Table [dbo].[District]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictID] [int] IDENTITY(1,1) NOT NULL,
	[CityID] [int] NOT NULL,
	[DistrictName] [nvarchar](255) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[District] ON
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (1, 2, N'Cầu Giấy', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (2, 2, N'Hai Bà Trưng', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (3, 2, N'Đống Đa', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (4, 2, N'Long Biên', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (5, 2, N'Nam Từ Liêm', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (6, 2, N'Hoàn Kiếm', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (7, 2, N'Thanh Xuân', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (8, 2, N'Ba Đình', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (11, 6, N'Quận 5', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (12, 6, N'Quận 7', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (13, 6, N'Quận 10', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (14, 6, N'Quận Gò Vấp', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (15, 7, N'Quận Hải Châu', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (16, 7, N'Quận Ninh Kiều', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (17, 10, N'Nam Định', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (18, 9, N'Hải Phòng', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (19, 11, N'Bắc Giang', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[District] ([DistrictID], [CityID], [DistrictName], [CreateDate]) VALUES (20, 12, N'Sơn La', CAST(0x0000A63400000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[District] OFF
/****** Object:  Table [dbo].[DetailOrder]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [ntext] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[TotalPrice] [float] NULL,
	[Propertices] [varchar](50) NULL,
	[Code] [varchar](8) NULL,
 CONSTRAINT [PK_DetailOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DetailOrder] ON
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (1, 0, 97, N'Dầu gội dưỡng phục hồi Nashi Argan Shampoo 500 ml', 1, 629000, 629000, N'', N'MFTYBQN5')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (2, 0, 42, N'Dầu hấp chăm sóc tóc hư tổn L''Oreal Serie Expert Absolut Repair Lipidium Masque 500ml', 1, 910000, 910000, N'white,S', N'B1VAHD67')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (3, 0, 62, N'Kem hấp chăm sóc và bảo vệ màu tóc nhuộm L''Oreal Vitamino Color A-OX 500ml', 2, 910000, 1820000, N',', N'B1VAHD67')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (4, 0, 58, N' Dầu gội ngăn ngừa rụng tóc Alfaparf Scalp Care 1000ml', 4, 689000, 2756000, N'', N'GJ4Q5UMY')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (5, 0, 117, N'The Chok Chok Green Tea Watery Mist 50ml', 1, 302000, 302000, N'', N'JHXW6NBY')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (6, 0, 97, N'The Chok Chok Green Tea Watery Mist 150ml', 1, 516000, 516000, N'', N'JHXW6NBY')
INSERT [dbo].[DetailOrder] ([id], [OrderID], [ProductID], [ProductName], [Quantity], [Price], [TotalPrice], [Propertices], [Code]) VALUES (7, 0, 120, N'Master Lab Hyaluronic Acid Mask', 1, 76000, 76000, N'', N'NRLE5UM0')
SET IDENTITY_INSERT [dbo].[DetailOrder] OFF
/****** Object:  StoredProcedure [dbo].[create_order_code]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[create_order_code]
as
begin
	Declare @r varchar(8);
	set @r = '';
	select @r = coalesce(@r, '') + n FROM (SELECT top 8 CHAR(number) n FROM master..spt_values
	WHERE type = 'P' 
	AND (number between ascii(0) and ascii(9)
	or number between ascii('A') and ascii('Z'))
	--or number between ascii('a') and ascii('z'))
	ORDER BY newid()) a
	select @r AS order_code
end

exec create_order_code
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertDelimitedListIntoTable]    Script Date: 08/29/2016 11:29:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertDelimitedListIntoTable] (
     @list NVARCHAR(MAX) ,
     @delimiter CHAR(1) )
RETURNS @table TABLE (item VARCHAR(255) NOT NULL )
AS 
    BEGIN
        DECLARE @pos INT ,@nextpos INT ,@valuelen INT

        SELECT  @pos = 0 ,@nextpos = 1

        WHILE @nextpos > 0 
            BEGIN
                SELECT  @nextpos = CHARINDEX(@delimiter,@list,@pos + 1)
                SELECT  @valuelen = CASE WHEN @nextpos > 0 THEN @nextpos
                                         ELSE LEN(@list) + 1
                                    END - @pos - 1
                INSERT  @table ( item )
                VALUES  (CONVERT(INT,SUBSTRING(@list,@pos + 1,@valuelen)) )
                SELECT  @pos = @nextpos

            END

        DELETE  FROM @table
        WHERE   item = ''

        RETURN 
    END
GO
/****** Object:  Table [dbo].[City]    Script Date: 08/29/2016 11:29:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (2, N'Hà Nội', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (6, N'Hồ Chí Minh', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (7, N'Đà Nẵng', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (8, N'Cần Thơ', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (9, N'Hải Phòng', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (10, N'Nam Định', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (11, N'Bắc Giang', CAST(0x0000A63400000000 AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CreateDate]) VALUES (12, N'Sơn La', CAST(0x0000A63400000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[City] OFF
/****** Object:  StoredProcedure [dbo].[_WebInfo_Update]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_WebInfo_Update]
	@GeneralName      nvarchar(100)
	,@GeneralContent      nvarchar(MAX)
	,@Datemodified      smalldatetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @count int
	SET @count = (select count(GeneralName) from dbo._WebInfo 
					where GeneralName=@GeneralName)
	if (@count = 0)
		begin
			INSERT INTO _WebInfo
			   ([GeneralName]
			   ,[GeneralContent]
			   ,[Datemodified]
				)
		 VALUES
			   (@GeneralName
				,@GeneralContent
				,@Datemodified
				)
		end
	else
		begin
			UPDATE _WebInfo
			   SET GeneralContent  =  @GeneralContent
					,Datemodified  =  @Datemodified
			 WHERE GeneralName  =  @GeneralName
		end
	
END
GO
/****** Object:  StoredProcedure [dbo].[_UserInfor_Statistic]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_UserInfor_Statistic]
AS
BEGIN
	SELECT DATEPART(Year, DateRegister) Year, 
	DATEPART(Month, DateRegister) Month, 
	Count(InforId) [Total] 
	FROM _UserInfo 
	GROUP BY DATEPART(Year, DateRegister), 
	DATEPART(Month, DateRegister) 
	ORDER BY Year, Month 
END
GO
/****** Object:  StoredProcedure [dbo].[_ThongKe_Edit]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[_ThongKe_Edit]
AS
BEGIN
-- delete all record year-1
delete _Statistic
where ThoiGian <= DATEADD(yyyy, -1, GETDATE())
-- select analysis 
 DECLARE @SoTruyCapGanNhat bigint
 DECLARE @Count int
 SELECT @Count=Count(*) FROM _Statistic ttk
 IF @Count IS NULL SET @Count=0
 IF @Count=0
  INSERT INTO _Statistic(ThoiGian, SoTruyCap)
  VALUES (GetDate(),1)
 ELSE
  BEGIN
   
   DECLARE @ThoiGianGanNhat datetime
   SELECT @SoTruyCapGanNhat=ttk.SoTruyCap, @ThoiGianGanNhat=ttk.ThoiGian
     FROM _Statistic ttk WHERE ttk.ID=(SELECT Max(ttk2.ID) FROM _Statistic ttk2)
   IF @SoTruyCapGanNhat IS NULL SET @SoTruyCapGanNhat=0
   IF @ThoiGianGanNhat IS NULL SET @ThoiGianGanNhat=getdate()
   -- Kiểm tra xem lần truy cập này có phải đã sang ngày mới không (Qua thời điểm 12h00)
   -- Nếu chưa sang ngày mới thì cập nhật lại SoTruyCap
   IF Day(@ThoiGianGanNhat)=Day(GETDATE())
    BEGIN
     UPDATE _Statistic
     SET
      SoTruyCap = @SoTruyCapGanNhat+1,
      ThoiGian = GetDate()
      
     WHERE ID=(SELECT Max(ttk2.ID) FROM _Statistic ttk2)
    END
    -- Nếu đã sang ngày mới thì thêm mới bản ghi, SoTruyCap bắt đầu lại là 1
   ELSE
    BEGIN
     INSERT INTO _Statistic(ThoiGian, SoTruyCap)
     VALUES (GetDate(),1)
    END
  END
 
  -- Thống kê Hom nay, Hom qua, Tuan nay, Tuan Truoc, Thang nay, Thang Truoc
  DECLARE @HomNay INT
  SET @HomNay = datepart(dw, GetDate())
  SELECT @SoTruyCapGanNhat=ttk.SoTruyCap, @ThoiGianGanNhat=ttk.ThoiGian
     FROM _Statistic ttk WHERE ttk.ID=(SELECT Max(ttk2.ID) FROM _Statistic ttk2)
  --Tính SoTruyCapHomQua
  DECLARE @SoTruyCapHomQua bigint
  SELECT @SoTruyCapHomQua=isnull(SoTruyCap,0) FROM _Statistic  
   WHERE CONVERT(nvarchar(20),ThoiGian,103)=CONVERT(nvarchar(20),GETDATE()-1,103)
  IF @SoTruyCapHomQua IS null SET @SoTruyCapHomQua=0
  -- Tính Ngày đầu tuần này
  DECLARE @DauTuanNay datetime
  SET @DauTuanNay= DATEADD(wk, DATEDIFF(wk, 6, GetDate()), 6)
  -- Tính Ngày đầu của tuần trước Tính từ thời điểm 00:00:))
  DECLARE @NgayDauTuanTruoc datetime
  SET @NgayDauTuanTruoc = Cast(CONVERT(nvarchar(30),DATEADD(dd, -(@HomNay+6), GetDate()),101) AS datetime)
  -- Tính ngày cuối tuần trước tính đến 24h ngày cuối tuần 
  DECLARE @NgayCuoiTuanTruoc datetime
  SET @NgayCuoiTuanTruoc = Cast(CONVERT(nvarchar(30),DATEADD(dd, -@HomNay, GetDate()),101) +' 23:59:59' AS datetime)
  
  -- Tính số truy cập tuần này
  DECLARE @SoTruyCapTuanNay bigint
  SELECT @SoTruyCapTuanNay=isnull(Sum(SoTruyCap),0) FROM _Statistic ttk 
   WHERE ttk.ThoiGian BETWEEN @DauTuanNay AND getdate()
   
  -- Tính số truy cập tuần trước
  DECLARE @SoLanTruyCapTuanTruoc bigint
  SELECT @SoLanTruyCapTuanTruoc=isnull(sum(SoTruyCap),0)  FROM _Statistic ttk 
   WHERE ttk.ThoiGian BETWEEN @NgayDauTuanTruoc AND @NgayCuoiTuanTruoc
  
  -- Tính số truy cập tháng này
  DECLARE @SoTruyCapThangNay bigint 
  SELECT @SoTruyCapThangNay=isnull(Sum(SoTruyCap),0)
   FROM _Statistic ttk WHERE MONTH(ttk.ThoiGian)=MONTH(GETDATE())
  
  -- Tính số truy cập tháng trước
  DECLARE @SoTruyCapThangTruoc bigint 
  SELECT @SoTruyCapThangTruoc=isnull(Sum(SoTruyCap),0)
   FROM _Statistic ttk WHERE MONTH(ttk.ThoiGian)=MONTH(GETDATE())-1
  
  -- Tính tổng số
  DECLARE @TongSo bigint
  SELECT  @TongSo=isnull(Sum(SoTruyCap),0) FROM _Statistic ttk
  
  SELECT @SoTruyCapGanNhat AS HomNay, 
  @SoTruyCapHomQua AS HomQua,
  @SoTruyCapTuanNay AS TuanNay, 
  @SoLanTruyCapTuanTruoc AS TuanTruoc, 
  @SoTruyCapThangNay AS ThangNay, 
  @SoTruyCapThangTruoc AS ThangTruoc,
  @TongSo AS TatCa
END
GO
/****** Object:  StoredProcedure [dbo].[_Statistic_All]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_Statistic_All]
AS
BEGIN
	--SELECT CONVERT(NVARCHAR(10), ThoiGian, 120) [date], 
	--SUM(SoTruyCap) [Total] 
	--FROM _Statistic 
	--GROUP BY CONVERT(NVARCHAR(10), ThoiGian, 120) 
	--ORDER BY [date]
	SELECT 
	cast(datepart(year, ThoiGian) as varchar(4)) as [year],
	cast(datepart(MONTH, ThoiGian) as varchar(2)) as [month], 
	SUM(SoTruyCap) [Total] 
	FROM _Statistic 
	group by cast(datepart(year, ThoiGian) as varchar(4)) , cast(datepart(MONTH, ThoiGian) as varchar(2)) 
	order by cast(datepart(year, ThoiGian) as varchar(4)) , cast(datepart(MONTH, ThoiGian) as varchar(2)) 
END
GO
/****** Object:  StoredProcedure [dbo].[_Product_GetByCatalogType]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_Product_GetByCatalogType]
	@Type nvarchar(50)
AS
BEGIN
	if(@Type <> '')
	begin
		select * from(
			select 
			ProductID,ProductName,ProductCode,CatalogID,Summary,Content,ImagePath,ImageBigPath,DateModify,Store,
			Promotion,Warranty,Manufacture,PriceOld,PriceNew,Views,OrderDisplay,Lang,IsShow,IsHot,
			IsPromotion,Link,Approve,StartDate,EndDate,Rating,ROW_NUMBER() OVER (PARTITION BY CatalogID ORDER BY OrderDisplay DESC) as pos
			from _Product p 
			where p.ProductID in (
			select DISTINCT p.ProductID from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop 
			inner join _Catalog c on prop.item = c.CatalogID 
			where c.Type = @Type )
			--Order by p.CatalogID,p.OrderDisplay Asc
		)as all_table Order by pos asc
		--Order by CatalogID,OrderDisplay Asc
	end
	else
	begin 
		select * from(
		select 
		ProductID,ProductName,ProductCode,CatalogID,Summary,Content,ImagePath,ImageBigPath,DateModify,Store,
		Promotion,Warranty,Manufacture,PriceOld,PriceNew,Views,OrderDisplay,Lang,IsShow,IsHot,
		IsPromotion,Link,Approve,StartDate,EndDate,Rating,ROW_NUMBER() OVER (PARTITION BY CatalogID ORDER BY OrderDisplay DESC) as pos
		from _Product p 
		where p.ProductID in (
		select DISTINCT p.ProductID from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop 
		inner join _Catalog c on prop.item = c.CatalogID 
		where c.Type in ('SP','CL'))
		--Order by p.CatalogID,p.OrderDisplay Asc
		)as all_table Order by pos asc
		--Order by CatalogID,OrderDisplay Asc
	end
END

--exec [_Product_GetByCatalogType] 'SP'
GO
/****** Object:  StoredProcedure [dbo].[_General_Update]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_General_Update]
	@GeneralName      nvarchar(100)
	,@GeneralContent      nvarchar(MAX)
	,@Datemodified      smalldatetime
	,@Show      bit
	,@Lang      nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @count int
	SET @count = (select count(GeneralName) from dbo._General 
					where GeneralName=@GeneralName and Lang = @Lang)
	if (@count = 0)
		begin
			INSERT INTO [dbo].[_General]
			   ([GeneralName]
			   ,[GeneralContent]
			   ,[Datemodified]
			   ,[Show]
			   ,[Lang])
		 VALUES
			   (@GeneralName
				,@GeneralContent
				,@Datemodified
				,@Show
				,@Lang
				)
		end
	else
		begin
			UPDATE [dbo].[_General]
			   SET GeneralContent  =  @GeneralContent
					,Datemodified  =  @Datemodified
					,Show  =  @Show
					,Lang  =  @Lang
			 WHERE GeneralName  =  @GeneralName
					and Lang = @Lang
		end
	
END
GO
/****** Object:  StoredProcedure [dbo].[_Catalog_GetByProductHot]    Script Date: 08/29/2016 11:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_Catalog_GetByProductHot]
	@Lang nvarchar(10)
AS
BEGIN
	select DISTINCT c.* from _Product p CROSS APPLY [dbo].ConvertDelimitedListIntoTable(p.CatalogID,',') prop 
	inner join _Catalog c on prop.item = c.CatalogID Where p.IsHot = 'true' 
	AND LTRIM(RTRIM(c.Lang)) = LTRIM(RTRIM(@Lang))
END
GO
/****** Object:  Default [DF__Contact_createdate]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Contact] ADD  CONSTRAINT [DF__Contact_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
/****** Object:  Default [DF_Product_Store]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_Store]  DEFAULT ((0)) FOR [Store]
GO
/****** Object:  Default [DF_Product_PriceOld]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_PriceOld]  DEFAULT ((0)) FOR [PriceOld]
GO
/****** Object:  Default [DF_Product_Views]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_Views]  DEFAULT ((1)) FOR [Views]
GO
/****** Object:  Default [DF_Product_OrderDisplay]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_OrderDisplay]  DEFAULT ((1)) FOR [OrderDisplay]
GO
/****** Object:  Default [DF_Product_Lang]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_Lang]  DEFAULT (N'vn') FOR [Lang]
GO
/****** Object:  Default [DF_Product_IsShow]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_IsShow]  DEFAULT ((1)) FOR [IsShow]
GO
/****** Object:  Default [DF_Product_IsHot]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_IsHot]  DEFAULT ((0)) FOR [IsHot]
GO
/****** Object:  Default [DF_Product_IsPromotion]    Script Date: 08/29/2016 11:29:55 ******/
ALTER TABLE [dbo].[_Product] ADD  CONSTRAINT [DF_Product_IsPromotion]  DEFAULT ((0)) FOR [IsPromotion]
GO
