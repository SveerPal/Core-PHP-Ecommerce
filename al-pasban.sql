-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2023 at 09:09 PM
-- Server version: 5.7.39-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `al-pasban`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@alpasban.com', '$2y$10$wZAQF7JQJiHjsUjNhXhAMOVphYEBhSJWy9.yDXSu5b3HYWPWtvwfa', 1, 'Al', 'Pasban', '', '', 'images.jpg', 1, '', '', '2022-10-11'),
(9, 'harry@den.com', '$2y$10$Oongyx.Rv0Y/vbHGOxywl.qf18bXFiZOcEaI4ZpRRLzFNGKAhObSC', 0, 'Harry', 'Den', 'Silay City, Negros Occidental', '09092735719', 'male2.png', 1, 'k8FBpynQfqsv', 'wzPGkX5IODlTYHg', '2018-05-09'),
(12, 'christine@gmail.com', '$2y$10$ozW4c8r313YiBsf7HD7m6egZwpvoE983IHfZsPRxrO1hWXfPRpxHO', 0, 'Christine', 'becker', 'demo', '7542214500', 'female3.jpg', 1, '', '', '2018-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL,
  `name` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `breadcrumb` text,
  `description` text,
  `additional_description` text,
  `photo` varchar(200) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `counter` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `tag_id`, `name`, `slug`, `breadcrumb`, `description`, `additional_description`, `photo`, `alt`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(1, '', '', 'Meet the Woman Behind Cool Ethical Label Reformation', 'meet-the-woman-behind-cool-ethical-label-reformation', '', '', '', '12165f1a2a15c9303f31915a2365bd1b.png', '', 0, '0', '', '', ' ', '2022-11-11 12:55:06', '2022-11-11 17:25:06'),
(2, '', '', 'Lauryn Hill Could Make Tulle Skirt and Cowboy', 'lauryn-hill-could-make-tulle-skirt-and-cowboy', '', '', '', '420c067f8b0e7ef5e13096dbef89707f.png', '', 0, '0', '', '', ' ', '2022-11-11 12:55:37', '2022-11-11 17:25:37'),
(3, '', '', 'Fashion Trends In 2021 Styles, Colors, Accessories', 'fashion-trends-in-2021-styles-colors-accessories', '', '', '', '101182746208ead83157e393ab9393ee.png', '', 0, '0', '', '', ' ', '2022-11-11 12:55:59', '2022-11-11 17:25:59'),
(4, '', '', 'Lauryn Hill Could Make Tulle Skirt and Cowboy 2', 'lauryn-hill-could-make-tulle-skirt-and-cowboy-2', '', '', '', '0e4fe4760bdd84a8c8e39109ece5ceef.png', '', 0, '0', '', '', ' ', '2022-11-11 12:56:40', '2022-11-11 17:26:40'),
(5, '4,2', '4,3,2', 'Essential guidelines to consider while we buy Hijab Online', 'essential-guidelines-to-consider-while-we-buy-hijab-online', '', '<p>A hijab is a piece of clothing that women use for covering themselves. Even though it symbolized a particular culture in the past, at present, it is used to showcase one&rsquo;s style and fashion in the best possible way. Hijab has become quite popular amongst Muslim women these days and it will help to enhance the personality of the ladies to a great extent. Women like to wear a hijab along with an abaya for enhancing their charm and elegance. Many fashion designers also endorse hijab as one of the most sophisticated fashion garments right now. Below, we have presented some guidelines that will help you to get hold of a hijab in case you want to buy hijab online.</p>\r\n\r\n<p><strong>1. Consider the size</strong><br />\r\nIt is possible to put on a hijab in various sizes according to the choice of the user. These are available in rectangular or even triangular shapes right now. How you wear a hijab will showcase your sense of fashion and culture. Therefore, you should consider the size when purchasing this piece of garment online.</p>\r\n\r\n<p><strong>2. Focus on comfort</strong><br />\r\nIt is essential to buy a hijab that will fit your face so that you feel comfortable while wearing it. It must not be so tight that you feel uncomfortable in the long run. For example, it will be a sensible idea to purchase a cotton hijab if you are residing in an area that is usually hot during summer.</p>\r\n\r\n<p><strong>3. Take care of the fabric</strong><br />\r\nIt is a no-brainer that the fabric that you choose for any garment including a hijab will depend on your sense of fashion. A hijab is available in various types of fabrics such as cotton, silk, and rayon for you to choose from. However, you need to make sure that you are feeling comfortable while wearing these garments. When you buy hijab online then you should make sure that the fabric is ideal for the climatic conditions where you are staying.</p>\r\n\r\n<p><strong>4. Consider the accessories</strong><br />\r\nIt is a fact that hijab is available at present with plenty of accessories that you should consider while purchasing it. You will be able to enhance your personality by wearing a hijab along with some appropriate accessories that go with it. Intricate jewelry items are available for putting on along with the hijab for emphasizing your sense of fashion in the best possible way. Make sure that the printing of the hijab is of good quality and that the embroidery on the garment is also top-notch.</p>\r\n\r\n<p><strong>Conclusion</strong><br />\r\nThese are some essential guidelines that you should follow while purchasing an abaya dress online. Make it a point to buy the garment from a reliable outlet online that should come within your budget as well.</p>\r\n', '', '2feaaa7eedb24bb382dc0cda4c784594.jpg', '', 0, '1', '', '', ' ', '2023-02-24 08:06:50', '2023-02-24 01:06:50'),
(6, '', '', 'Why is it essential to buy prayer rugs online?', 'why-is-it-essential-to-buy-prayer-rugs-online', '', '<p>Muslim culture is not complete without prayer rugs because they give believers a neat, private environment in which to pray. They have diverse designs, sizes, and shapes, and they are built of various materials. Online prayer rug purchases have gotten simpler since the internet&#39;s invention. We&#39;ll go through the benefits of ordering prayer rugs online in this article.</p>\r\n\r\n<p><strong>Convenience</strong><br />\r\nIt&#39;s really convenient to purchase prayer rugs online. From the convenience of your home, you can browse a variety of prayer rugs. You can shop whenever is most convenient with online retailers because they are open 24/7. A prayer mat can be purchased without leaving your home or standing in a long line.</p>\r\n\r\n<p><strong>Wide Range of Options</strong><br />\r\nInternet retailers offer a large selection of prayer rugs in both conventional and contemporary styles. Wool, silk, cotton, and synthetic materials are just a few of the options you have. For your prayer space, you can select from a variety of sizes and shapes. You can discover a prayer rug that matches your individual preferences and style thanks to the wide variety of options available.</p>\r\n\r\n<p><strong>Competitive Prices</strong><br />\r\nPrayer rugs are offered by online merchants at reasonable costs. Because there are so many variations available, you can select a prayer rug that fits your budget by comparing the prices of several choices. By taking advantage of the discounts and special offers provided by online shops, you can save money.</p>\r\n\r\n<p><strong>Quality</strong><br />\r\nPrayer rugs of excellent quality are sold online. Before making a purchase, you can check out user reviews and ratings to gauge the prayer rug&#39;s quality. Internet retailers also provide thorough product information and pictures, enabling you to examine the prayer rug&#39;s quality before making a purchase.</p>\r\n\r\n<p><strong>Easy Payment Options</strong><br />\r\nPayPal, debit cards, and credit cards are among the simple payment methods available at online retailers. You won&#39;t need to worry about carrying cash or standing in long checkout lines. Also, online retailers provide secure payment methods that protect the privacy of your financial and personal data.</p>\r\n\r\n<p><strong>Delivery</strong><br />\r\nYou can order prayer rugs online and have them delivered to your house. There is no problem transporting the prayer mat from the store to your home. Because internet vendors provide swift and dependable shipping, you will receive the prayer rug on time. You can follow the delivery of the prayer rug to stay up to date on the progress of your order.</p>\r\n\r\n<p><strong>Parting Words</strong><br />\r\nAs a result, purchasing namaz mat online is crucial due to its simplicity, abundance of alternatives, affordable costs, high quality, simple payment methods, and delivery. You can shop for a high-quality prayer rug that matches your preferences and personal style online from the convenience of your home. You can shop without fuss at online retailers, and they&#39;ll send your prayer rug promptly.</p>\r\n', '', '45d3d42e0d06220813a3b5f88f3e0738.jpg', '', 0, '1', '', '', ' ', '2023-02-24 08:20:00', '2023-02-24 01:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `blogs_categories`
--

CREATE TABLE `blogs_categories` (
  `id` int(11) NOT NULL,
  `parent_category` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(150) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs_categories`
--

INSERT INTO `blogs_categories` (`id`, `parent_category`, `name`, `description`, `slug`, `status`, `meta_title`, `meta_description`, `meta_keyword`, `createDate`, `UpdateDate`) VALUES
(1, 0, 'Company', '', 'company', '1', '', '', '', '2023-02-28 02:35:10', '2023-02-28 02:35:10'),
(2, 0, 'Image', '', 'image', '1', '', '', '', '2023-02-28 02:41:22', '2023-02-28 02:41:22'),
(3, 0, 'Travel', '', 'travel', '1', '', '', '', '2023-02-28 02:41:34', '2023-02-28 02:41:34'),
(4, 0, 'Hijab', '', 'hijab', '1', '', '', '', '2023-02-28 02:42:07', '2023-02-28 02:42:07');

-- --------------------------------------------------------

--
-- Table structure for table `blogs_tags`
--

CREATE TABLE `blogs_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(150) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs_tags`
--

INSERT INTO `blogs_tags` (`id`, `name`, `description`, `slug`, `status`, `meta_title`, `meta_description`, `meta_keyword`, `createDate`, `UpdateDate`) VALUES
(1, 'Service', '', 'service', '1', '', '', '', '2023-02-28 02:35:20', '2023-02-28 02:35:20'),
(2, 'Popular', '', 'popular', '1', '', '', '', '2023-02-28 02:35:47', '2023-02-28 02:35:47'),
(3, 'Desgin', '', 'desgin', '1', '', '', '', '2023-02-28 02:36:08', '2023-02-28 02:36:08'),
(4, 'Bussiness', '', 'bussiness', '1', '', '', '', '2023-02-28 02:39:33', '2023-02-28 02:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `description`, `status`, `updateDate`, `createDate`) VALUES
(1, 'How to place an order on the website?', '<p>Simply choose the item that you want to purchase. Follow these steps after creating a login or using<br />\r\na guest login:<br />\r\n1. Place the item in your shopping cart and select &amp;quot;Buy Now.&amp;quot;<br />\r\n2. Add a delivery address next. You can choose an address you&amp;#39;ve already added before moving to the<br />\r\nnext step.<br />\r\n3. Enter your selected phone number and email.<br />\r\n4. After you&amp;#39;ve confirmed your order and chosen a payment method, pay.</p>\r\n', '1', '2022-10-20 12:21:56', '2022-10-20 12:21:56'),
(3, 'How can I track my order?', '<p>It&rsquo;s easy to track your orders on our website:<br />\r\n&bull; Enter your order number on the order tracking page.<br />\r\n&bull; Select Track.<br />\r\nYou will now be redirected to the status page:<br />\r\nThe definitions for your order status are as follows:<br />\r\n1. New &ndash; Your order is not processed.<br />\r\n2. Pending &ndash; Your order is accepted and is waiting to be dispatched.<br />\r\n3. Dispatch &ndash; Your order got dispatched and you should receive an email with all the tracking<br />\r\ninformation.<br />\r\n4. Order Completed &ndash; A this point, you may have received your order, and your order will be<br />\r\nmarked completed. Contact us immediately if you haven&rsquo;t received your order by then.</p>\r\n', '1', '2022-10-20 12:25:42', '2022-10-20 12:25:42'),
(4, 'What are the various ways through which I can contact your business?', '<p>If you wish to reach out to us, you can write us an email at <a href=\\\"mailto:support@alpasban.com\\\">support@alpasban.com</a>. Or you can call,<br />\r\ntext, or Whatsapp us at +91-9311-503538.</p>\r\n', '1', '2022-12-23 02:59:10', '2022-12-23 02:59:10'),
(5, 'How can I update my account details?', '<p>To check your account details, just click &amp;quot;My Account.&amp;quot; You may access, update, and edit your<br />\r\naccount information there, including your address, phone number, email address, passwords, and more.</p>\r\n', '1', '2022-12-23 03:00:40', '2022-12-23 03:00:40'),
(6, 'Can I order something thatâ€™s out of stock?', '<p>A product marked as &amp;quot;Out of Stock&amp;quot; is not available and therefore cannot be purchased. However,<br />\r\nyou can use our website&amp;#39;s &amp;quot;Notify Me&amp;quot; function to be notified whenever an item becomes available.</p>\r\n', '1', '2022-12-23 03:01:13', '2022-12-23 03:01:13'),
(7, 'Do you guys deliver internationally?', '<p>Currently, we don&rsquo;t accept international orders. Still, if you&rsquo;re willing to buy any product, you can<br />\r\nemail us at <a href=\\\"mailto:support@alpasban.com\\\">support@alpasban.com</a>.</p>\r\n', '1', '2022-12-23 03:01:46', '2022-12-23 03:01:46'),
(8, 'What if my order gets delayed on an occasion?', '<p>Please check your email or messages for any updates you might have missed if, in rare<br />\r\ncircumstances, your order is delayed. A delivery timeframe will be shared with you and you can even<br />\r\ntrack your orders with <strong>AL PASBAN</strong>. If the problem persists, kindly contact us at <a href=\\\"mailto:support@alpasban.com\\\">support@alpasban.com</a>.</p>\r\n', '1', '2022-12-23 03:02:26', '2022-12-23 03:02:26'),
(9, 'Is it possible to accept the package after verifying the contents?', '<p>A package cannot be opened before delivery is accepted, as per company policy. You can accept<br />\r\nthe package and later contact us if you find any faults within your package.</p>\r\n', '1', '2022-12-23 03:03:32', '2022-12-23 03:03:32'),
(10, 'Will you reconsider an order if itâ€™s not collected the first time?', '<p>Yes, we do re-attempt order deliveries. If the package is not collected the first time, we retry the<br />\r\ndelivery the very next day.</p>\r\n', '1', '2022-12-23 03:03:46', '2022-12-23 03:03:46'),
(11, 'I received an order and the package wasnâ€™t in place. What can I do now?', '<p>As our dear customer, you have the option of replacing or returning the product. You can use the<br />\r\nwebsite Return option on the order and fill out the details as to what&rsquo;s the exact issue.</p>\r\n', '1', '2022-12-23 03:04:05', '2022-12-23 03:04:05'),
(12, 'What if the order is not getting dispatched for a long time?', '<p>Right away contact our Customer Support so that we can look into the matter.</p>\r\n', '1', '2022-12-23 03:04:18', '2022-12-23 03:04:18'),
(13, 'Do you send a confirmation update on your orders?', '<p>When you successfully place an order with AL PASBAN, we do indeed send you an email and SMS.<br />\r\nAt each stage of the order process, we&amp;#39;ll let you know where your order is. With the aid of a tracking<br />\r\nnumber for your shipping, you can even follow the progress of your order.</p>\r\n', '1', '2022-12-23 03:04:33', '2022-12-23 03:04:33'),
(14, 'Is it possible to change the delivery date of the order?', '<p>Unfortunately, the delivery date cannot be altered. You can be confident that we will deliver your<br />\r\norder by the schedule.</p>\r\n', '1', '2022-12-23 03:04:52', '2022-12-23 03:04:52'),
(15, 'Iâ€™m facing an issue in tracking my order. What could be the reason?', '<p>Sometimes, the tracking ID can take some time to activate. Check after a while and then you should<br />\r\nhave no problem tracking your order.</p>\r\n', '1', '2022-12-23 03:05:09', '2022-12-23 03:05:09'),
(16, 'I have not received the invoice for my order. What should I do?', '<p>Don&rsquo;t worry as the hard copy of the invoice is always sent with the order. If you have not received<br />\r\nthe hard copy then you can request a soft copy for your order at <a href=\\\"mailto:support@alpasban.com\\\">support@alpasban.com</a>.</p>\r\n', '1', '2022-12-23 03:06:37', '2022-12-23 03:06:37');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `alt` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `title`, `alt`, `description`, `photo`, `status`, `updateDate`, `createDate`) VALUES
(2, 'Test', 'wretere', 'lorem 2', '', '1', '2022-10-20 16:13:14', '2022-10-20 16:13:14'),
(3, 'Testeeee', 'wretereeee', 'lorem 2eeee', 'a9961bcbc76b26340504882a7ddc2a22.png', '1', '2022-10-20 16:14:21', '2022-10-20 16:14:21');

-- --------------------------------------------------------

--
-- Table structure for table `mail_data`
--

CREATE TABLE `mail_data` (
  `fld_id` int(11) NOT NULL,
  `fld_name` varchar(100) NOT NULL,
  `fld_lname` varchar(100) NOT NULL,
  `fld_email` varchar(200) NOT NULL,
  `fld_phone` varchar(50) NOT NULL,
  `fld_subject` varchar(255) NOT NULL,
  `fld_body` text NOT NULL,
  `fld_send_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `link_type` varchar(20) NOT NULL,
  `menu_type` varchar(20) NOT NULL,
  `item_id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `item_target` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `menu_order` int(5) NOT NULL DEFAULT '0',
  `photo` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `parent_id`, `link_type`, `menu_type`, `item_id`, `name`, `slug`, `item_target`, `class`, `menu_order`, `photo`, `status`, `createDate`, `updateDate`) VALUES
(2, 'Header Menu', 0, 'Internal', 'Category', 2, 'WOMEN', '', '', '', 19, '', '1', '2022-11-10 11:22:33', '2022-11-10 15:52:33'),
(6, 'Header Menu', 2, 'Internal', 'Category', 6, 'BOTTOM WEAR', '', '', '', 0, 'w8.webp', '1', '2022-11-10 11:26:44', '2022-11-10 15:56:44'),
(8, 'Header Menu', 0, 'Internal', 'Category', 28, 'PRAYER RUGS', '', '', '', 16, '', '1', '2022-11-10 11:27:43', '2022-11-10 15:57:43'),
(9, 'Header Menu', 8, 'Internal', 'Category', 9, 'PREMIUM VELVET RUG', '', '', '', 0, '', '1', '2022-11-10 11:28:09', '2022-11-10 15:58:09'),
(11, 'Header Menu', 8, 'Internal', 'Category', 11, 'LUX EXTRA', '', '', '', 0, '', '1', '2022-11-10 11:30:13', '2022-11-10 16:00:13'),
(12, 'Header Menu', 0, 'Internal', 'Category', 12, 'ABAYAS', '', '', '', 18, '', '1', '2022-11-10 11:30:50', '2022-11-10 16:00:50'),
(16, 'My Account', 0, 'Internal', 'Page', 1, 'My Account', '', '', '', 0, '', '1', '2022-11-10 11:38:12', '2022-11-10 16:08:12'),
(17, 'My Account', 0, 'Internal', 'Page', 2, 'Cart', '', '', '', 0, '', '1', '2022-11-10 11:39:04', '2022-11-10 16:09:04'),
(20, 'My Account', 0, 'Internal', 'Page', 5, 'Checkout', '', '', '', 0, '', '1', '2022-11-10 11:39:54', '2022-11-10 16:09:54'),
(21, 'My Account', 0, 'Internal', 'Page', 6, 'Wishlist', '', '', '', 0, '', '1', '2022-11-10 11:40:21', '2022-11-10 16:10:21'),
(22, 'Useful Links', 0, 'Internal', 'Page', 7, 'About Us', '', '', '', 0, '', '1', '2022-11-10 11:41:06', '2022-11-10 16:11:06'),
(23, 'Useful Links', 0, 'Internal', 'Page', 8, 'Contact Us', '', '', '', 0, '', '1', '2022-11-10 11:41:31', '2022-11-10 16:11:31'),
(24, 'Useful Links', 0, 'Internal', 'Page', 9, 'Customer Support', '', '', '', 0, '', '1', '2022-11-10 11:41:46', '2022-11-10 16:11:46'),
(25, 'Useful Links', 0, 'Internal', 'Page', 10, 'Privacy Policy', '', '', '', 0, '', '1', '2022-11-10 11:42:03', '2022-11-10 16:12:03'),
(26, 'Useful Links', 0, 'Internal', 'Page', 11, 'Shipping / Returnpolicy', '', '', '', 0, '', '1', '2022-11-10 11:42:31', '2022-11-10 16:12:31'),
(27, 'Useful Links', 0, 'Internal', 'Page', 12, 'Terms of Use', '', '', '', 0, '', '1', '2022-11-10 11:42:51', '2022-11-10 16:12:51'),
(28, 'Useful Links', 0, 'Internal', 'Page', 13, 'Payment Method', '', '', '', 0, '', '1', '2022-11-10 11:43:05', '2022-11-10 16:13:05'),
(30, 'My Account', 0, 'Internal', 'Page', 14, 'Shop', '', '', '', 0, '', '1', '2022-11-14 10:15:05', '2022-11-14 14:45:05'),
(32, 'Header Menu', 0, 'Internal', 'Category', 19, 'HIJABS', '', '', '', 17, '', '1', '2022-11-18 02:06:49', '2022-11-18 18:36:49'),
(33, 'Header Menu', 2, 'Internal', 'Category', 21, 'SETS & DRESSES', '', '', '', 2, '', '1', '2022-12-02 12:39:39', '2022-12-02 17:09:39'),
(34, 'Header Menu', 2, 'Internal', 'Category', 20, 'TOP WEAR', '', '', '', 3, '', '1', '2022-12-02 12:40:46', '2022-12-02 17:10:46'),
(36, 'Header Menu', 12, 'Internal', 'Category', 22, 'NIQABS', '', '', '', 2, '', '1', '2022-12-02 12:46:55', '2022-12-02 17:16:55'),
(37, 'Header Menu', 0, 'Internal', 'Category', 1, 'NEW ARRIVALS', '', '', '', 20, '', '1', '2022-12-02 01:24:17', '2022-12-02 17:54:17'),
(41, 'Header Menu', 32, 'Internal', 'Category', 23, 'PARTY WEAR HIJAB', '', '', '', 2, '', '1', '2022-12-02 01:40:15', '2022-12-02 18:10:15'),
(42, 'Header Menu', 32, 'Internal', 'Category', 24, 'DAILY WEAR HIJAB', '', '', 'megamenu', 0, '', '1', '2022-12-02 01:40:39', '2022-12-02 18:10:39'),
(47, 'Header Menu', 12, 'Internal', 'Category', 12, 'ABAYAS', '', '', '', 1, '', '1', '2022-12-08 01:08:21', '2022-12-08 17:38:21'),
(48, 'Header Menu', 0, 'Internal', 'Page', 24, 'MEN', '', '', '', 15, '', '1', '2022-12-09 07:47:27', '2022-12-09 12:17:27'),
(49, 'Header Menu', 0, 'Internal', 'Page', 25, 'PERFUMES', '', '', '', 15, '', '1', '2022-12-09 07:48:27', '2022-12-09 12:18:27'),
(50, 'Useful Links', 0, 'Internal', 'Page', 16, 'Refund Policy', '', '', '', 0, '', '1', '2022-12-23 10:34:59', '2022-12-23 03:34:59'),
(51, 'Header Menu', 8, 'Internal', 'Category', 29, 'TURKISH CARAVANSARY RUGS', '', '', '', 0, '', '1', '2023-01-27 11:35:28', '2023-01-27 04:35:28'),
(52, 'Header Menu', 8, 'Internal', 'Category', 30, 'DODIYA RUGS', '', '', '', 0, '', '1', '2023-02-08 06:31:11', '2023-02-07 23:31:11'),
(53, 'Header Menu', 8, 'Internal', 'Category', 31, 'ELEGANCE CHENNILE RUGS', '', '', '', 0, '', '1', '2023-02-08 06:36:09', '2023-02-07 23:36:09'),
(54, 'Header Menu', 8, 'Internal', 'Category', 32, 'SUPERIOR MULTICOLOUR RUGS', '', '', '', 0, '', '1', '2023-02-16 05:33:42', '2023-02-15 22:33:42'),
(55, 'Header Menu', 33, 'Internal', 'Category', 33, 'PAKISTANI SUITS', '', '', '', 0, '', '1', '2023-02-24 06:52:12', '2023-02-23 23:52:12'),
(56, 'Header Menu', 6, 'Internal', 'Category', 34, 'LEGGINGS', '', '', '', 0, '', '1', '2023-02-24 06:53:56', '2023-02-23 23:53:56'),
(57, 'Header Menu', 34, 'Internal', 'Category', 35, 'KURTIS', '', '', '', 0, '', '1', '2023-02-24 06:54:40', '2023-02-23 23:54:40'),
(58, 'Header Menu', 12, 'Internal', 'Category', 36, 'DUBAI ABAYAS', '', '', '', 0, '', '1', '2023-02-24 07:03:26', '2023-02-24 00:03:26'),
(59, 'Header Menu', 6, 'Internal', 'Category', 38, 'PALAZZO', '', '', '', 0, '', '1', '2023-02-24 07:06:38', '2023-02-24 00:06:38'),
(60, 'Header Menu', 12, 'Internal', 'Category', 37, 'FRONT OPEN ABAYAS', '', '', '', 0, '', '1', '2023-02-24 07:16:56', '2023-02-24 00:16:56'),
(61, 'Useful Links', 0, 'Internal', 'Page', 29, 'Blogs', '', '', '', 0, '', '1', '2023-02-28 07:52:41', '2023-02-28 00:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_detials`
--

CREATE TABLE `order_detials` (
  `fld_id` bigint(20) NOT NULL,
  `fld_transaction_id` text COLLATE utf8_unicode_ci NOT NULL,
  `razorpay_order_id` text COLLATE utf8_unicode_ci NOT NULL,
  `fld_order_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_user_id` int(11) NOT NULL,
  `fld_payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_currency` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fld_amount` float NOT NULL,
  `fld_first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_email_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_phone_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fld_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fld_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fld_zip_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fld_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_first_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_last_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_email_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_phone_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_address2` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_zip_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fld_shipping_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fld_status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `fld_comments` text COLLATE utf8_unicode_ci NOT NULL,
  `fld_payment_status` enum('pending','confirmed','cancel','failed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `fld_payment_date` datetime NOT NULL,
  `discount_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `fld_upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fld_modified_date` datetime NOT NULL,
  `fld_card_last_four` int(11) NOT NULL,
  `fld_card_exp_month` int(11) NOT NULL,
  `fld_card_exp_year` int(11) NOT NULL,
  `fld_card_brand` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_detials`
--

INSERT INTO `order_detials` (`fld_id`, `fld_transaction_id`, `razorpay_order_id`, `fld_order_id`, `fld_user_id`, `fld_payment_type`, `fld_currency`, `fld_amount`, `fld_first_name`, `fld_last_name`, `fld_email_id`, `fld_phone_no`, `fld_address`, `fld_address2`, `fld_city`, `fld_state`, `fld_zip_code`, `fld_country`, `fld_shipping_first_name`, `fld_shipping_last_name`, `fld_shipping_email_id`, `fld_shipping_phone_no`, `fld_shipping_address`, `fld_shipping_address2`, `fld_shipping_city`, `fld_shipping_state`, `fld_shipping_zip_code`, `fld_shipping_country`, `fld_status`, `fld_comments`, `fld_payment_status`, `fld_payment_date`, `discount_code`, `discount_amount`, `fld_upload_date`, `fld_modified_date`, `fld_card_last_four`, `fld_card_exp_month`, `fld_card_exp_year`, `fld_card_brand`) VALUES
(2, 'pay_Ks8cvqYXsrGaF7', 'order_Ks8cG7HDxoupaL', '928532', 7, 'Online', 'INR', 1, 'Mohd ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3rd floor yamuna vihar', '', 'delhi', '', '110053', 'India', 'Mohd ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3rd floor yamuna vihar', '', 'delhi', '', '110053', 'India', 'active', '', 'confirmed', '2022-12-15 09:34:01', '', 0, '2022-12-15 23:34:01', '2022-12-15 09:34:01', 0, 0, 0, ''),
(3, '', '', '183047', 10, 'Online', 'INR', 5995, 'Farha', 'Saifi', 'farhasaifi103@gmail.com', '9717355161', 'C-12/115', 'Yamuna Vihar', 'New Delhi', '', '110053', 'India', 'Farha', 'Saifi', 'farhasaifi103@gmail.com', '9717355161', 'C-12/115', 'Yamuna Vihar', 'New Delhi', '', '110053', 'India', 'active', '', 'cancel', '2022-12-15 14:56:19', '', 0, '2022-12-16 04:56:19', '2022-12-15 14:56:19', 0, 0, 0, ''),
(4, '', '', '613817', 7, 'Online', 'INR', 499, 'Mohd ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3rd floor yamuna vihar', '', 'delhi', '', '110053', 'India', 'Mohd ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3rd floor yamuna vihar', '', 'delhi', '', '110053', 'India', 'active', '', 'cancel', '2022-12-15 15:00:21', '', 0, '2022-12-16 05:00:21', '2022-12-15 15:00:21', 0, 0, 0, ''),
(5, 'pay_KsEKzPmCMmESlS', 'order_KsEKXFs9KoZZrW', '155427', 11, 'Online', 'INR', 599, 'Tabassum ', 'Taj', 'tabassumtaj507@gmail.com', '9650980815', 'D-133 street no - 7', 'Dayal pur', 'Delhi', '', '110094', 'India', 'Tabassum ', 'Taj', 'tabassumtaj507@gmail.com', '9650980815', 'D-133 street no - 7', 'Dayal pur', 'Delhi', '', '110094', 'India', 'active', '', 'confirmed', '2022-12-15 15:09:24', '', 0, '2022-12-16 05:09:24', '2022-12-15 15:09:24', 0, 0, 0, ''),
(6, '', '', '420949', 7, 'Online', 'INR', 2650, 'Mohd ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3rd floor yamuna vihar', '', 'delhi', '', '110053', 'India', 'Mohd ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3rd floor yamuna vihar', '', 'delhi', '', '110053', 'India', 'active', '', 'cancel', '2022-12-16 09:52:04', '', 0, '2022-12-16 23:52:04', '2022-12-16 09:52:04', 0, 0, 0, ''),
(9, '', '', '542806', 10, 'Online', 'INR', 1199, 'Farha', 'Saifi', 'farhasaifi103@gmail.com', '9717355161', 'C-12/115', 'Yamuna Vihar', 'New Delhi', '', '110053', 'India', 'Farha', 'Saifi', 'farhasaifi103@gmail.com', '9717355161', 'C-12/115', 'Yamuna Vihar', 'New Delhi', '', '110053', 'India', 'active', '', 'cancel', '2022-12-17 19:28:05', '', 0, '2022-12-18 09:28:05', '2022-12-17 19:28:05', 0, 0, 0, ''),
(10, 'pay_Kt6SpDSS9amnAb', 'order_Kt6NztSGRYyng2', '693329', 10, 'Online', 'INR', 1099, 'Farha', 'Saifi', 'farhasaifi103@gmail.com', '9717355161', 'C-12/115', 'Yamuna Vihar', 'New Delhi', '', '110053', 'India', 'Farha', 'Saifi', 'farhasaifi103@gmail.com', '9717355161', 'C-12/115', 'Yamuna Vihar', 'New Delhi', '', '110053', 'India', 'active', '', 'confirmed', '2022-12-17 20:02:08', '', 0, '2022-12-18 10:02:08', '2022-12-17 20:02:08', 0, 0, 0, ''),
(15, '', '', '445956', 7, '', 'INR', 5152, 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'active', '', 'cancel', '2022-12-22 10:35:09', '', 0, '2022-12-22 17:35:09', '2022-12-22 10:35:09', 0, 0, 0, ''),
(16, '', '', '858657', 7, '', 'INR', 1400, 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'active', '', 'cancel', '2023-01-02 12:02:05', '', 0, '2023-01-02 19:02:05', '2023-01-02 12:02:05', 0, 0, 0, ''),
(17, '', '', '643203', 7, '', 'INR', 1400, 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'active', '', 'cancel', '2023-01-02 12:16:36', '', 0, '2023-01-02 19:16:36', '2023-01-02 12:16:36', 0, 0, 0, ''),
(18, '', '', '108472', 7, '', 'INR', 1400, 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'active', '', 'cancel', '2023-01-02 12:24:18', '', 0, '2023-01-02 19:24:18', '2023-01-02 12:24:18', 0, 0, 0, ''),
(22, 'pay_KzdM6PWaY2ZMeg', 'order_KzdL0Kr25sWgu0', '120696', 7, 'Online', 'INR', 1199, 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'active', '', 'confirmed', '2023-01-03 08:10:07', '', 0, '2023-01-03 15:10:07', '2023-01-03 08:10:07', 0, 0, 0, ''),
(23, '', '', '362299', 15, '', 'INR', 1025, 'Siya', 'Khan', 'siya.ngel4@gmail.com', '8800627220', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', 'New Delhi', '', '110092', 'India', 'Siya', 'Khan', 'siya.ngel4@gmail.com', '8800627220', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', 'New Delhi', '', '110092', 'India', 'active', '', 'cancel', '2023-01-06 11:07:55', '', 0, '2023-01-06 18:07:55', '2023-01-06 11:07:55', 0, 0, 0, ''),
(24, '', '', '186642', 15, 'COD', 'INR', 1025, 'Siya', 'Khan', 'siya.ngel4@gmail.com', '8800627220', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', 'New Delhi', '', '110092', 'India', 'Siya', 'Khan', 'siya.ngel4@gmail.com', '8800627220', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', 'New Delhi', '', '110092', 'India', 'active', '', 'cancel', '2023-01-06 11:08:12', '', 0, '2023-01-06 18:08:12', '2023-01-06 11:08:12', 0, 0, 0, ''),
(25, '', '', '568850', 15, 'COD', 'INR', 1025, 'Siya', 'Khan', 'siya.ngel4@gmail.com', '8800627220', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', 'New Delhi', '', '110092', 'India', 'Siya', 'Khan', 'siya.ngel4@gmail.com', '8800627220', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', 'New Delhi', '', '110092', 'India', 'active', '', 'confirmed', '2023-01-06 15:32:51', '', 0, '2023-01-06 22:32:51', '2023-01-06 15:32:51', 0, 0, 0, ''),
(26, '', '', '454859', 25, 'COD', 'INR', 2299, 'Rahat', 'Jahan', 'rahatjahan@gmail.com', '9210160691', 'Cr-233 lalita park, laxmi nagar, mera laxmi nagar metro station gate no1', '', 'New delhi', '', '110092', 'India', 'Rahat', 'Jahan', 'rahatjahan@gmail.com', '9210160691', 'Cr-233 lalita park, laxmi nagar, mera laxmi nagar metro station gate no1', '', 'New delhi', '', '110092', 'India', 'active', '', 'confirmed', '2023-01-07 06:09:43', '', 0, '2023-01-07 13:09:43', '2023-01-07 06:09:43', 0, 0, 0, ''),
(27, '', '', '265931', 7, 'COD', 'INR', 1150, 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'active', '', 'cancel', '2023-01-07 08:20:54', '', 0, '2023-01-07 15:20:54', '2023-01-07 08:20:54', 0, 0, 0, ''),
(28, '', '', '910475', 10, '', 'INR', 450, 'Farha', 'Saifi', 'farhasaifi103@gmail.com', '9717355161', 'Cr-233,3rd floor Lalita park ', 'Laxmi Nagar near Laxmi Nagar metro station gate no 1', 'New Delhi', '', '110092', 'India', 'Farha', 'Saifi', 'farhasaifi103@gmail.com', '9717355161', 'Cr-233,3rd floor Lalita park ', 'Laxmi Nagar near Laxmi Nagar metro station gate no 1', 'New Delhi', '', '110092', 'India', 'active', '', 'pending', '2023-01-29 10:41:50', '', 0, '2023-01-29 17:41:50', '2023-01-29 10:41:50', 0, 0, 0, ''),
(29, '', '', '992635', 0, '', 'INR', 450, 'Rahat', 'Jahan', 'rahatjahan@gmail.com', '9210160691', 'Cr-233 lalita park, laxmi nagar, mera laxmi nagar metro station gate no1', '', 'New delhi', '', '110092', 'India', 'Rahat', 'Jahan', 'rahatjahan@gmail.com', '9210160691', 'Cr-233 lalita park, laxmi nagar, mera laxmi nagar metro station gate no1', '', 'New delhi', '', '110092', 'India', 'active', '', 'pending', '2023-01-29 11:16:15', '', 0, '2023-01-29 18:16:15', '2023-01-29 11:16:15', 0, 0, 0, ''),
(30, '', '', '190438', 1, 'COD', 'INR', 600, 'Yash', 'Pal', 'yashvir.ezrankings01@gmail.com', '1234567890', 'A-744', 'Sec 11', 'Noidaa', '', '123456', 'India', 'Yash', 'Pal', 'yashvir.ezrankings01@gmail.com', '1234567890', 'A-744', 'Sec 11', 'Noidaa', '', '123456', 'India', 'active', '', 'confirmed', '2023-01-30 11:56:35', '', 0, '2023-01-30 18:56:35', '2023-01-30 11:56:35', 0, 0, 0, ''),
(31, '', '', '281614', 27, 'COD', 'INR', 5777, 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'Cr-233,Lalita park Laxmi nagar', 'Near Laxmi nagar metro station gate no 1', 'New delhi ', '', '110092', 'India', 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'Cr-233,Lalita park Laxmi nagar', 'Near Laxmi nagar metro station gate no 1', 'New delhi ', '', '110092', 'India', 'active', '', 'cancel', '2023-02-18 18:36:52', '', 0, '2023-02-19 01:36:52', '2023-02-18 18:36:52', 0, 0, 0, ''),
(32, '', '', '781144', 27, '', 'INR', 5777, 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'Cr-233,Lalita park Laxmi nagar', 'Near Laxmi nagar metro station gate no 1', 'New delhi ', '', '110092', 'India', 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'Cr-233,Lalita park Laxmi nagar', 'Near Laxmi nagar metro station gate no 1', 'New delhi ', '', '110092', 'India', 'active', '', 'cancel', '2023-02-18 18:39:25', '', 0, '2023-02-19 01:39:25', '2023-02-18 18:39:25', 0, 0, 0, ''),
(33, 'pay_LI0liPlQA4fSoj', 'order_LI0kzsjiLPJxNi', '806671', 27, 'Online', 'INR', 5777, 'munna', 'Misba', 'Munnamisba@gmail.com', '8800627220', 'Cr-233,Lalita park Laxmi nagar', 'Near Laxmi nagar metro station gate no 1', 'New delhi ', '', '110092', 'India', 'munna', 'Misba', 'Munnamisba@gmail.com', '8800627220', 'Cr-233,Lalita park Laxmi nagar', 'Near Laxmi nagar metro station gate no 1', 'New delhi ', '', '110092', 'India', 'active', '', 'confirmed', '2023-02-18 18:46:40', '', 0, '2023-02-19 01:46:40', '2023-02-18 18:46:40', 0, 0, 0, ''),
(34, '', '', '141053', 27, 'COD', 'INR', 1150, 'munna', 'Misba', 'Munnamisba@gmail.com', '8800627220', 'Cr-233,Lalita park Laxmi nagar', 'Near Laxmi nagar metro station gate no 1', 'New delhi ', '', '110092', 'India', 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'Nehal yarn Traders ', 'A 30/29 k Hanuman fatak ', 'Varanasi', '', '221001', 'India', 'active', '', 'cancel', '2023-02-20 18:45:33', '', 0, '2023-02-21 01:45:33', '2023-02-20 18:45:33', 0, 0, 0, ''),
(35, '', '', '948916', 27, 'COD', 'INR', 1150, 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'A 30/29 k Hanuman fatak ', '', 'Varanasi ', '', '221001', 'India', 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'A 30/29 k Hanuman fatak ', '', 'Varanasi ', '', '221001', 'India', 'active', '', 'confirmed', '2023-02-20 18:51:00', '', 0, '2023-02-21 01:51:00', '2023-02-20 18:51:00', 0, 0, 0, ''),
(36, '', '', '736390', 27, '', 'INR', 3150, 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'A 30/29 k Hanuman fatak ', '', 'Varanasi ', '', '221001', 'India', 'munna', 'Misba', 'Munnamisba@gmail.com', '7007368980', 'A 30/29 k Hanuman fatak ', '', 'Varanasi ', '', '221001', 'India', 'active', '', 'cancel', '2023-02-20 18:54:10', '', 0, '2023-02-21 01:54:10', '2023-02-20 18:54:10', 0, 0, 0, ''),
(37, '', '', '753199', 31, 'COD', 'INR', 2050, 'Sumaiya', 'Abdul salam', 'Sumaiyaabdulsalam6@gmail.com', '9311808028', 'O-68,2nd floor,hari masjid', 'Nafis road Batla house jamia nagar ', 'New Delhi ', '', '110025', 'India', 'Sumaiya', 'Abdul salam', 'Sumaiyaabdulsalam6@gmail.com', '9311808028', 'O-68,2nd floor,hari masjid', 'Nafis road Batla house jamia nagar ', 'New Delhi ', '', '110025', 'India', 'active', '', 'confirmed', '2023-02-21 14:59:49', '', 0, '2023-02-21 21:59:49', '2023-02-21 14:59:49', 0, 0, 0, ''),
(38, '', '', '752784', 32, '', 'INR', 450, 'Fiza', 'Yaqoob', 'fizayaqoob2121@gmail.com', '83828 12386', '1 Near Nakash Chowk Gorakhpur', '1', 'Gorakhpur ', '', '273001', 'India', 'Fiza', 'Yaqoob', 'fizayaqoob2121@gmail.com', '83828 12386', '1 Near Nakash Chowk Gorakhpur', '1', 'Gorakhpur ', '', '273001', 'India', 'active', '', 'pending', '2023-02-24 09:57:33', '', 0, '2023-02-24 16:57:33', '2023-02-24 09:57:33', 0, 0, 0, ''),
(39, '', '', '464315', 32, 'COD', 'INR', 450, 'Fiza', 'Yaqoob', 'fizayaqoob2121@gmail.com', '83828 12386', '1 Near Nakash Chowk Gorakhpur', '1', 'Gorakhpur ', '', '273001', 'India', 'Fiza', 'Yaqoob', 'fizayaqoob2121@gmail.com', '83828 12386', '1 Near Nakash Chowk Gorakhpur', '1', 'Gorakhpur ', '', '273001', 'India', 'active', '', 'confirmed', '2023-02-24 09:58:23', '', 0, '2023-02-24 16:58:23', '2023-02-24 09:58:23', 0, 0, 0, ''),
(40, '', '', '437124', 34, 'COD', 'INR', 450, 'Maahi', 'Khan', 'khanbesma06@gmail.com', '7006011980', 'Jamai masjid nowhatta', 'Jamai masjid ', 'Srinagar', '', '190002', 'India', 'Maahi', 'Khan', 'khanbesma06@gmail.com', '7006011980', 'Jamai masjid nowhatta', 'Jamai masjid ', 'Srinagar', '', '190002', 'India', 'active', '', 'confirmed', '2023-02-24 13:54:39', '', 0, '2023-02-24 20:54:39', '2023-02-24 13:54:39', 0, 0, 0, ''),
(41, '', '', '533574', 7, '', 'INR', 1599, 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'MOHD ', 'Danish', 'saifidanish295@gmail.com', '9958684597', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 'active', '', 'cancel', '2023-02-25 08:16:38', '', 0, '2023-02-25 15:16:38', '2023-02-25 08:16:38', 0, 0, 0, ''),
(42, '', '', '690784', 35, 'COD', 'INR', 900, 'Arjumand  Mushtaq', 'Arjumand', 'Arjuraja114@gmail.com', '70518 37681', 'BEEHAMA', 'Beehama Ganderbal', 'Ganderbal', '', '191201', 'India', 'Arjumand  Mushtaq', 'Arjumand', 'Arjuraja114@gmail.com', '70518 37681', 'BEEHAMA', 'Beehama Ganderbal', 'Ganderbal', '', '191201', 'India', 'active', '', 'confirmed', '2023-02-26 17:25:21', '', 0, '2023-02-27 00:25:21', '2023-02-26 17:25:21', 0, 0, 0, ''),
(43, '', '', '392359', 0, '', 'INR', 1450, 'Tabassum ', 'Taj', 'tabassumtaj507@gmail.com', '9650980815', 'D-133 street no - 7', 'Dayal pur', 'Delhi', '', '110094', 'India', 'Tabassum ', 'Taj', 'tabassumtaj507@gmail.com', '9650980815', 'D-133 street no - 7', 'Dayal pur', 'Delhi', '', '110094', 'India', 'active', '', 'pending', '2023-02-27 07:21:26', '', 0, '2023-02-27 14:21:26', '2023-02-27 07:21:26', 0, 0, 0, ''),
(51, '', '', '426394', 37, 'COD', 'INR', 450, 'Nagma', 'Shaikh', 'Nagmashaikh11051992@gmail.com', '96077 7999', 'Dosti Planet North elmore c room num 2501', 'Mumbar kausa thane', 'Mumbai', '', '400612', 'India', 'Nagma', 'Shaikh', 'Nagmashaikh11051992@gmail.com', '96077 7999', 'Dosti Planet North elmore c room num 2501', 'Mumbar kausa thane', 'Mumbai', '', '400612', 'India', 'active', '', 'confirmed', '2023-03-03 11:41:18', '', 0, '2023-03-03 18:41:18', '2023-03-03 11:41:18', 0, 0, 0, ''),
(52, '', '', '781583', 38, 'COD', 'INR', 1199, 'Sabana', 'Shah ', 'sabanashah06@gmail.com', '8837433122', 'Khergao awng leikai ', '', '123', '', '795008', 'India', 'Sabana', 'Shah ', 'sabanashah06@gmail.com', '8837433122', 'Khergao awng leikai ', '', '123', '', '795008', 'India', 'active', '', 'confirmed', '2023-03-03 12:53:24', '', 0, '2023-03-03 19:53:24', '2023-03-03 12:53:24', 0, 0, 0, ''),
(53, '', '', '966811', 0, '', 'INR', 449, 'Sana', 'Shaikh', 'sanashaikh147@gmail.com', '7498632925', 'Flat no - 406, Lokhandwala prestige building, Basaweshwer Nagar', 'Near Middle East and lokmat office', 'Solapur ', '', '413003', 'India', 'Sana', 'Shaikh', 'sanashaikh147@gmail.com', '7498632925', 'Flat no - 406, Lokhandwala prestige building, Basaweshwer Nagar', 'Near Middle East and lokmat office', 'Solapur ', '', '413003', 'India', 'active', '', 'pending', '2023-03-04 14:52:43', '', 0, '2023-03-04 21:52:43', '2023-03-04 14:52:43', 0, 0, 0, ''),
(54, '', '', '862647', 41, 'COD', 'INR', 1999, 'Sumaiya', 'Azeez', 'sumaiyabanu497@gmail.com', '83100 22955', '352/1 1st cross Ammar masjid', 'Shanthinagar', 'Mysore', '', '570019', 'India', 'Sumaiya', 'Azeez', 'sumaiyabanu497@gmail.com', '83100 22955', '352/1 1st cross Ammar masjid', 'Shanthinagar', 'Mysore', '', '570019', 'India', 'active', '', 'confirmed', '2023-03-05 17:36:22', '', 0, '2023-03-06 00:36:22', '2023-03-05 17:36:22', 0, 0, 0, ''),
(55, '', '', '381137', 1, 'COD', 'INR', 4748, 'Yash', 'Pal', 'yashvir.ezrankings01@gmail.com', '1234567890', 'A-744', 'Sec 11', 'Noidaa', '', '123456', 'India', 'Yash', 'Pal', 'yashvir.ezrankings01@gmail.com', '1234567890', 'A-744', 'Sec 11', 'Noidaa', '', '123456', 'India', 'active', '', 'confirmed', '2023-03-06 04:31:24', '', 0, '2023-03-06 11:31:24', '2023-03-06 04:31:24', 0, 0, 0, ''),
(56, '', '', '779467', 42, '', 'INR', 899, 'Naznin', 'Shaikh', 'nadznin@gmail.com', '+91 99224 15616', 'NadNin@gmail.com', 'Thakkar apartment A/2; 505, camp', 'Pune', '', '411001', 'India', 'Naznin', 'Shaikh', 'nadznin@gmail.com', '+91 99224 15616', 'NadNin@gmail.com', 'Thakkar apartment A/2; 505, camp', 'Pune', '', '411001', 'India', 'active', '', 'pending', '2023-03-08 00:06:01', '', 0, '2023-03-08 07:06:01', '2023-03-08 00:06:01', 0, 0, 0, ''),
(57, '', '', '307096', 44, 'COD', 'INR', 1999, 'Hasan', 'Khan', 'khanmariam22@gmail.com', '60062 90046', 'Emarat enclave, B Block, flat no 601, Nohsa, Phulwari Sharif,', '', 'Patna ', '', '801505', 'India', 'Hasan', 'Khan', 'khanmariam22@gmail.com', '60062 90046', 'Emarat enclave, B Block, flat no 601, Nohsa, Phulwari Sharif,', '', 'Patna ', '', '801505', 'India', 'active', '', 'confirmed', '2023-03-08 17:09:25', '', 0, '2023-03-09 00:09:25', '2023-03-08 17:09:25', 0, 0, 0, ''),
(58, '', '', '387840', 45, '', 'INR', 2198, 'Annu', 'Khan', 'saifianam327@gmail.com', '7678164092', 'D-1/102 Nehru vihar', '25 futa road mother dairy', 'Delhi', '', '110094', 'India', 'Annu', 'Khan', 'saifianam327@gmail.com', '7678164092', 'D-1/102 Nehru vihar', '25 futa road mother dairy', 'Delhi', '', '110094', 'India', 'active', '', 'cancel', '2023-03-09 10:35:52', '', 0, '2023-03-09 17:35:52', '2023-03-09 10:35:52', 0, 0, 0, ''),
(59, '', '', '887960', 45, 'COD', 'INR', 1099, 'Annu', 'Khan', 'saifianam327@gmail.com', '7678164092', 'D-1/102 Nehru vihar', '25 futa road mother dairy', 'Delhi', '', '110094', 'India', 'Annu', 'Khan', 'saifianam327@gmail.com', '7678164092', 'D-1/102 Nehru vihar', '25 futa road mother dairy', 'Delhi', '', '110094', 'India', 'active', '', 'confirmed', '2023-03-09 10:39:42', '', 0, '2023-03-09 17:39:42', '2023-03-09 10:39:42', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `fld_id` int(11) NOT NULL,
  `fld_order_id` int(11) NOT NULL,
  `fld_product_id` int(11) NOT NULL,
  `fld_product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_quantity` int(11) NOT NULL,
  `fld_product_variation_id` int(11) NOT NULL,
  `fld_amount` int(11) NOT NULL,
  `fld_sale_price` int(11) NOT NULL,
  `fld_sub_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `fld_product_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_img_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fld_upload_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`fld_id`, `fld_order_id`, `fld_product_id`, `fld_product_name`, `fld_quantity`, `fld_product_variation_id`, `fld_amount`, `fld_sale_price`, `fld_sub_title`, `fld_product_type`, `fld_img_path`, `fld_upload_date`) VALUES
(1, 699577, 2, '3 PIECE SET - NAVY BLUE', 1, 3, 1, 0, '', 'Variation', '59c5f9e406124fd8ff2b26342adae629.jpg', '2022-12-15 08:51:47'),
(2, 699577, 2, '3 PIECE SET - NAVY BLUE', 1, 4, 1, 0, '', 'Variation', '59c5f9e406124fd8ff2b26342adae629.jpg', '2022-12-15 08:51:47'),
(3, 928532, 2, '3 PIECE SET - NAVY BLUE', 1, 3, 1, 0, '', 'Variation', '59c5f9e406124fd8ff2b26342adae629.jpg', '2022-12-15 09:34:01'),
(4, 183047, 53, 'BLACK KURTI', 5, 135, 1199, 0, '', 'Variation', '73e25b15f6766f94ef24bec8d655e197.jpg', '2022-12-15 14:56:19'),
(5, 613817, 96, 'PREMIUM LEGGINGS - PINK', 1, 212, 499, 0, '', 'Variation', '1e637fcae8963084f67b9088e8b34ef7.jpg', '2022-12-15 15:00:21'),
(6, 155427, 92, 'SHIMMER PANTS - DARK GOLD', 1, 208, 599, 0, '', 'Variation', 'dd141eea1075ad83f8d9d321a932e86e.jpg', '2022-12-15 15:09:24'),
(7, 420949, 114, '3 PIECE SET - SKY BLUE', 1, 241, 2650, 0, '', 'Variation', '6c8d12ec8d59ee4bb3b59a8e08fa3411.jpg', '2022-12-16 09:52:04'),
(8, 849780, 113, 'PREMIUM VELVET RUGS - ROYAL BROWN', 1, 233, 2699, 0, '', 'Variation', '3c4508545df937e80eb19bb1dcd7b22b.jpg', '2022-12-16 10:34:53'),
(9, 609709, 113, 'PREMIUM VELVET RUGS - ROYAL BROWN', 1, 233, 2699, 0, '', 'Variation', '3c4508545df937e80eb19bb1dcd7b22b.jpg', '2022-12-16 10:35:28'),
(10, 542806, 53, 'BLACK KURTI', 1, 135, 1199, 0, '', 'Variation', '73e25b15f6766f94ef24bec8d655e197.jpg', '2022-12-17 19:28:05'),
(11, 693329, 64, 'KURTI - LIGHT GREEN', 1, 160, 1099, 0, '', 'Variation', 'f275360c441186fab4e5cfb4078b5af2.jpg', '2022-12-17 20:02:08'),
(12, 391193, 113, 'PREMIUM VELVET RUGS - ROYAL BROWN', 1, 233, 2699, 0, '', 'Variation', '3c4508545df937e80eb19bb1dcd7b22b.jpg', '2022-12-19 12:32:43'),
(13, 973152, 114, '3 PIECE SET - SKY BLUE', 1, 241, 2650, 0, '', 'Variation', '6c8d12ec8d59ee4bb3b59a8e08fa3411.jpg', '2022-12-19 12:36:50'),
(14, 804148, 114, '3 PIECE SET - SKY BLUE', 1, 241, 2650, 0, '', 'Variation', '6c8d12ec8d59ee4bb3b59a8e08fa3411.jpg', '2022-12-21 14:35:06'),
(15, 379244, 114, '3 PIECE SET - SKY BLUE', 1, 241, 2650, 0, '', 'Variation', '6c8d12ec8d59ee4bb3b59a8e08fa3411.jpg', '2022-12-22 10:23:25'),
(16, 379244, 3, 'CHIKEN SEQUENCE PLAZO - NAVY BLUE', 1, 7, 749, 0, '', 'Variation', 'ddf27fbe084659b3c763838396154c44.jpg', '2022-12-22 10:23:25'),
(17, 445956, 114, '3 PIECE SET - SKY BLUE', 1, 241, 2650, 0, '', 'Variation', '6c8d12ec8d59ee4bb3b59a8e08fa3411.jpg', '2022-12-22 10:35:09'),
(18, 445956, 99, 'KAFTAN - BLACK + GREEN', 1, 215, 1950, 0, '', 'Variation', '801c1187684b5b08029414f27405d671.jpg', '2022-12-22 10:35:09'),
(19, 912543, 3, 'CHIKEN SEQUENCE PLAZO - NAVY BLUE', 1, 7, 749, 0, '', 'Variation', 'ddf27fbe084659b3c763838396154c44.jpg', '2022-12-22 12:50:14'),
(20, 316391, 3, 'CHIKEN SEQUENCE PLAZO - NAVY BLUE', 1, 7, 749, 0, '', 'Variation', 'ddf27fbe084659b3c763838396154c44.jpg', '2022-12-22 12:52:56'),
(21, 411115, 3, 'CHIKEN SEQUENCE PLAZO - NAVY BLUE', 1, 7, 749, 0, '', 'Variation', 'ddf27fbe084659b3c763838396154c44.jpg', '2022-12-22 12:56:33'),
(22, 528617, 3, 'CHIKEN SEQUENCE PLAZO - NAVY BLUE', 1, 7, 749, 0, '', 'Variation', 'ddf27fbe084659b3c763838396154c44.jpg', '2022-12-22 13:19:38'),
(23, 896911, 114, '3 PIECE SET - SKY BLUE', 1, 241, 2650, 0, '', 'Variation', '6c8d12ec8d59ee4bb3b59a8e08fa3411.jpg', '2022-12-23 04:42:04'),
(24, 858657, 63, 'KURTI - WHITE', 1, 156, 1250, 0, '', 'Variation', 'd152a9dd0899e6c804231146ce524138.jpg', '2023-01-02 12:02:05'),
(25, 643203, 63, 'KURTI - WHITE', 1, 156, 1250, 0, '', 'Variation', 'd152a9dd0899e6c804231146ce524138.jpg', '2023-01-02 12:16:36'),
(26, 108472, 63, 'KURTI - WHITE', 1, 156, 1250, 0, '', 'Variation', 'd152a9dd0899e6c804231146ce524138.jpg', '2023-01-02 12:24:18'),
(30, 120696, 53, 'BLACK KURTI', 1, 135, 1199, 0, '', 'Variation', '73e25b15f6766f94ef24bec8d655e197.jpg', '2023-01-03 08:10:07'),
(31, 362299, 62, 'KURTI - CREAM', 1, 151, 1025, 0, '', 'Variation', '75312374507b5d93fa142870275f39c8.jpg', '2023-01-06 11:07:55'),
(32, 186642, 62, 'KURTI - CREAM', 1, 151, 1025, 0, '', 'Variation', '75312374507b5d93fa142870275f39c8.jpg', '2023-01-06 11:08:12'),
(33, 568850, 62, 'KURTI - CREAM', 1, 151, 1025, 0, '', 'Variation', '75312374507b5d93fa142870275f39c8.jpg', '2023-01-06 15:32:51'),
(34, 454859, 35, 'ABAYA HAND WORK STONE - BLACK', 1, 111, 2299, 0, '', 'Variation', '6375263b01cde9f0d300973de2d934ee.jpg', '2023-01-07 06:09:43'),
(35, 265931, 101, 'KURTI - WINE', 1, 219, 1150, 0, '', 'Variation', '2a4cac8ec92eba30027370792cc1b8ec.jpg', '2023-01-07 08:20:54'),
(36, 910475, 10, 'ARBIAN NIQAB HANDWORK', 1, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-01-29 10:41:50'),
(37, 992635, 10, 'ARBIAN NIQAB HANDWORK', 1, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-01-29 11:16:15'),
(38, 190438, 154, 'LUXURY HIJAB STONE WORK - CAMEL', 1, 290, 600, 0, '', 'Variation', '21089de47b3c44aa552da2b3d20fadff.jpg', '2023-01-30 11:56:35'),
(39, 281614, 50, '3 PIECE SET - BURGUNDY', 1, 126, 2627, 0, '', 'Variation', '7c353f8fa50e31b08adb50dc71d7b392.jpg', '2023-02-18 18:36:52'),
(40, 281614, 126, '3 PIECE SET - PISTACHIO', 1, 258, 3150, 0, '', 'Variation', '9a966a1883e5946424bc7aa04de30afe.jpg', '2023-02-18 18:36:52'),
(41, 781144, 126, '3 PIECE SET - PISTACHIO', 1, 258, 3150, 0, '', 'Variation', '9a966a1883e5946424bc7aa04de30afe.jpg', '2023-02-18 18:39:25'),
(42, 781144, 50, '3 PIECE SET - BURGUNDY', 1, 126, 2627, 0, '', 'Variation', '7c353f8fa50e31b08adb50dc71d7b392.jpg', '2023-02-18 18:39:25'),
(43, 806671, 50, '3 PIECE SET - BURGUNDY', 1, 126, 2627, 0, '', 'Variation', '7c353f8fa50e31b08adb50dc71d7b392.jpg', '2023-02-18 18:46:40'),
(44, 806671, 126, '3 PIECE SET - PISTACHIO', 1, 258, 3150, 0, '', 'Variation', '9a966a1883e5946424bc7aa04de30afe.jpg', '2023-02-18 18:46:40'),
(45, 141053, 101, 'KURTI - WINE', 1, 221, 1150, 0, '', 'Variation', '2a4cac8ec92eba30027370792cc1b8ec.jpg', '2023-02-20 18:45:33'),
(46, 948916, 101, 'KURTI - WINE', 1, 221, 1150, 0, '', 'Variation', '2a4cac8ec92eba30027370792cc1b8ec.jpg', '2023-02-20 18:51:00'),
(47, 736390, 126, '3 PIECE SET - PISTACHIO', 1, 257, 3150, 0, '', 'Variation', '9a966a1883e5946424bc7aa04de30afe.jpg', '2023-02-20 18:54:10'),
(48, 753199, 6, 'ABAYA CUFF WORK', 1, 235, 2050, 0, '', 'Variation', '085c273a1c8b8bc640147f08c9be9294.jpg', '2023-02-21 14:59:49'),
(49, 752784, 10, 'ARBIAN NIQAB HANDWORK', 1, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-02-24 09:57:33'),
(50, 464315, 10, 'ARBIAN NIQAB HANDWORK', 1, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-02-24 09:58:23'),
(51, 437124, 10, 'ARBIAN NIQAB HANDWORK', 1, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-02-24 13:54:39'),
(52, 533574, 202, 'SUPERIOR MULTICOLOUR RUGS - MULTICOLOUR', 1, 339, 1599, 0, '', 'Variation', 'a919cc27f5cd5bae9255b2505e1758b3.jpg', '2023-02-25 08:16:38'),
(53, 690784, 10, 'ARBIAN NIQAB HANDWORK', 2, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-02-26 17:25:21'),
(54, 392359, 143, 'KURTI_LIGHT GREEN', 1, 277, 1450, 0, '', 'Variation', 'd70c6015616321219e5adf312200588e.jpg', '2023-02-27 07:21:26'),
(55, 608364, 200, 'PREMIUM LEGGINGS - BURGUNDY', 1, 337, 499, 0, '', 'Variation', '7228bf79221937b02e5a5c3af4db10b4.jpg', '2023-03-01 09:12:39'),
(56, 608364, 13, 'PREMIUM LEGGINGS', 1, 13, 499, 0, '', 'Variation', '099841ee23ab95b9a98f89d877fc154b.jpg', '2023-03-01 09:12:39'),
(57, 868152, 200, 'PREMIUM LEGGINGS - BURGUNDY', 1, 337, 499, 0, '', 'Variation', '7228bf79221937b02e5a5c3af4db10b4.jpg', '2023-03-02 05:56:17'),
(58, 372199, 196, 'LUXURY HIJAB STONE WORK_BLUE', 1, 333, 600, 0, '', 'Variation', '3daecd86850ccdec5c623c7429617ba9.jpg', '2023-03-02 06:27:57'),
(59, 913044, 196, 'LUXURY HIJAB STONE WORK_BLUE', 1, 333, 600, 0, '', 'Variation', '3daecd86850ccdec5c623c7429617ba9.jpg', '2023-03-02 07:01:38'),
(60, 913044, 3, 'CHIKEN SEQUENCE PLAZO - NAVY BLUE', 1, 7, 749, 0, '', 'Variation', 'ddf27fbe084659b3c763838396154c44.jpg', '2023-03-02 07:01:38'),
(61, 224410, 203, 'PREMIUM LEGGINGS - DARK TEAL', 1, 340, 499, 0, '', 'Variation', '4b6d66e094eccb5fcf53cf85da6096ff.jpg', '2023-03-03 04:48:12'),
(62, 224410, 5, 'BLUE BUTTERFLY ABAYA HAND WORK', 1, 90, 2250, 0, '', 'Variation', 'e40dc04b087078cd096b420364b74efb.jpg', '2023-03-03 04:48:12'),
(63, 495822, 10, 'ARBIAN NIQAB HANDWORK', 1, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-03-03 04:50:02'),
(64, 111509, 203, 'PREMIUM LEGGINGS - DARK TEAL', 1, 340, 499, 0, '', 'Variation', '4b6d66e094eccb5fcf53cf85da6096ff.jpg', '2023-03-03 05:08:43'),
(65, 111509, 5, 'BLUE BUTTERFLY ABAYA HAND WORK', 1, 90, 2250, 0, '', 'Variation', 'e40dc04b087078cd096b420364b74efb.jpg', '2023-03-03 05:08:43'),
(66, 426394, 10, 'ARBIAN NIQAB HANDWORK', 1, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-03-03 11:41:18'),
(67, 781583, 10, 'ARBIAN NIQAB HANDWORK', 1, 0, 450, 0, '', 'Simple', '7e97985473160838bbc5337e55fd5155.jpg', '2023-03-03 12:53:24'),
(68, 781583, 3, 'CHIKEN SEQUENCE PLAZO - NAVY BLUE', 1, 7, 749, 0, '', 'Variation', 'ddf27fbe084659b3c763838396154c44.jpg', '2023-03-03 12:53:24'),
(69, 966811, 124, 'HIJAB FLOWER PRINT - PEACH BLACK', 1, 253, 449, 0, '', 'Variation', '45c38bf76ad6124f0fdf42cae81c7eff.jpg', '2023-03-04 14:52:43'),
(70, 862647, 147, 'JILBAB WITH NOSE PIECE - LAVENDER', 1, 283, 1999, 0, '', 'Variation', '2f9cc942f5e172b155e69a7433330101.jpg', '2023-03-05 17:36:22'),
(71, 381137, 202, 'SUPERIOR MULTICOLOUR RUGS - MULTICOLOUR', 1, 339, 1599, 0, '', 'Variation', 'a919cc27f5cd5bae9255b2505e1758b3.jpg', '2023-03-06 04:31:24'),
(72, 381137, 203, 'PREMIUM LEGGINGS - DARK TEAL', 1, 340, 499, 0, '', 'Variation', '4b6d66e094eccb5fcf53cf85da6096ff.jpg', '2023-03-06 04:31:24'),
(73, 381137, 2, '3 PIECE SET - NAVY BLUE', 1, 4, 2650, 0, '', 'Variation', '59c5f9e406124fd8ff2b26342adae629.jpg', '2023-03-06 04:31:24'),
(74, 779467, 185, 'ELEGANCE CHENNILE RUGS - WHITE', 1, 322, 899, 0, '', 'Variation', 'cca90526a33818ebd6c84836d82fea99.jpg', '2023-03-08 00:06:01'),
(75, 307096, 147, 'JILBAB WITH NOSE PIECE - LAVENDER', 1, 283, 1999, 0, '', 'Variation', '2f9cc942f5e172b155e69a7433330101.jpg', '2023-03-08 17:09:25'),
(76, 387840, 64, 'KURTI - LIGHT GREEN', 2, 161, 1099, 0, '', 'Variation', 'f275360c441186fab4e5cfb4078b5af2.jpg', '2023-03-09 10:35:52'),
(77, 887960, 64, 'KURTI - LIGHT GREEN', 1, 161, 1099, 0, '', 'Variation', 'f275360c441186fab4e5cfb4078b5af2.jpg', '2023-03-09 10:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `templates` varchar(255) NOT NULL,
  `breadcrumb` text,
  `parent` int(10) NOT NULL DEFAULT '0',
  `description` text,
  `additional_description` text,
  `photo` varchar(200) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `banner_heading` varchar(255) NOT NULL,
  `banner_description` text NOT NULL,
  `banner_label` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
  `counter` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `templates`, `breadcrumb`, `parent`, `description`, `additional_description`, `photo`, `alt`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(1, 'My Account', 'my-account', 'my-account.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', ' ', '2022-11-10 10:15:15', '2022-11-10 14:45:15'),
(2, 'Cart', 'cart', 'cart.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '', '2022-11-10 10:15:41', '2022-11-10 14:45:41'),
(3, 'Login', 'login', 'login.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '', '2022-11-10 10:16:00', '2022-11-10 14:46:00'),
(4, 'Register', 'register', 'login.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '', '2022-11-10 10:16:20', '2022-11-10 14:46:20'),
(5, 'Checkout', 'checkout', 'checkout.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '', '2022-11-10 10:16:37', '2022-11-10 14:46:37'),
(6, 'Wishlist', 'wishlist', 'wishlist.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '', '2022-11-10 10:16:52', '2022-11-10 14:46:52'),
(7, 'About Us', 'about-us', 'about-us.php', 'About Us', 0, '<h2>OUR VISION</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Since its establishment, AL PASBAN has garnered praise for its avant-garde, distinctive designs, needlework, patterns, and fabric kinds. AL PASBAN honours the ethnic style of wear that\\\\\\\\\\\\\\\\&#39;s influenced by Islamic attire in its creations.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Our ethnic wear stores for everyone&rsquo;s needs can enhance one&rsquo;s overall looks and help them build a long-lasting impression.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We offer a stylish and comfortable selection of clothing for both men and women, accessories for all, rugs, and even perfumes. AL PASBAN is a one-stop shop for a variety of fashion demands, to put it briefly. Our product line, a brand for contemporary, trend-conscious consumers, embraces prestige with grace.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Despite the constantly shifting market demands, AL PASBAN maintains its position through the development of novel and distinctive trends. From everyday to festive wear, our styling solutions leave people amazed.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>OUR MISSION</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Alongside, offline and online stores, AL PASBAN pursues innovation by harnessing modern technology. Our fine apparel and accessories are available to customers of all sorts throughout India and the world. With our ambition and determination, we wish to celebrate fashion and help it impact all spheres of life. Delivering what&rsquo;s trending, we aspire to be a leader in our field with up-and-coming branches. Al PASBAN offers quality to perfection with a timeless sense of style and active involvement in the apparel industry.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>OUR VALUES</h2>\r\n<p>&nbsp;</p>\r\n<ol>\r\n	<li>Honesty: Our authenticity and unique style define who we are.</li>\r\n	<li>Sincerity: With the balance of creativity and fine craftsmanship, we craft our clothes and accessories to perfection.</li>\r\n	<li>Quality: Premium standards with no compromise on quality.</li>\r\n	<li>Impact: We create a buzz with what we create.</li>\r\n	<li>Lead: Al PASBAN leads in apparel with its unique designs and compelling embroidery.</li>\r\n	<li>Difference: The difference between what&rsquo;s premium and mediocre is apparent with Al Pasban.</li>\r\n</ol>\r\n', '', '934650952a1eb9f687783f6608e1771c.png', '', '', '', '', '', 0, '1', 'About Us MT', 'About Us KW', '       About Us DESC', '2022-11-10 10:17:05', '2022-11-10 14:47:05'),
(8, 'Contact Us', 'contact-us', 'contact-us.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '', '2022-11-10 10:17:52', '2022-11-10 14:47:52'),
(9, 'Customer Support', 'customer-support', 'customer-support.php', '', 0, '<p><strong>Get In Touch</strong></p>\r\n\r\n<p><strong>Facebook</strong></p>\r\n\r\n<p><strong>Instagram</strong></p>\r\n\r\n<p><strong>Our Customer Support Service</strong></p>\r\n<p>&nbsp;</p>\r\n<p>Dear Family,</br> You can shop ethnic design clothing, or traditional wear, accessories, rugs, perfumes, and more with AL PASBAN. Every user can benefit from the most convenient online buying experience thanks to our online store.</br></br>\r\nHowever, occasionally, if a problem does occur, you can always write us at support@alpasban.com. If you experience any difficulties, you can also phone, text or WhatsApp us at +91-9311-503538. Through these contacts, you can also provide us with feedback, and we hope to be of good service to you.</br></br>\r\nRegards</br>\r\nAL PASBAN Online Team</p>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '   ', '2022-11-10 10:18:35', '2022-11-10 14:48:35'),
(10, 'Privacy Policy', 'privacy-policy', 'privacy-policy.php', '', 0, '<p>We at AL PASBAN go above and beyond to safeguard your personal information. This section explains our processes for collecting, utilizing and disclosing personal data (only under specific circumstances). Please carefully read our privacy statement.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Collection Of Data</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>When you place an order with us, we may collect information about you that is not restricted to your name, email address, phone number, delivery address, payment method, and payment information. This information is gathered so that we can fulfill your orders and provide any reasonable claims with them. You should be aware that to deliver the requested items successfully, third parties (suppliers or couriers) may receive your name, address, phone number, and other associated information.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Use Of Personal Information</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your information may be used in surveys or for analysis on our websites. In addition to the fact that your details will remain anonymous, you can decide not to take part in surveys or polls on our website. Your information is kept private and we only use your personal information for analysis. AL PASBAN may use your private data to inform you about new promotions, products, newsletters, or any other information related to your interest. Remember, you have the right to unsubscribe from such offers at any time.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>For providing better shopping to you, we may use your data other than analyzing your activity on the site and determining your location.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Data Sharing With 3rd Parties</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Information from AL PASBAN may need to be shared with partners, suppliers, or affiliates. For instance, the courier partner in charge of delivering your item will need access to your information. In case of fraud prevention or other similar reasons, we might also disclose information to third parties.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Data collection and usage are defined in this privacy policy and we use your data as stated here. Even if we are the ones supplying your information or data, AL PASBAN does not control how third parties use your private information.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Cookies</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cookies simply refer to the data that&rsquo;s stored by the browser on your device. It mostly identifies your device and the pages you have visited. If cookies are allowed on your device, all of our website\\\\&#39;s functions will be accessible to you. You have the option to disable cookies, though.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cookies are virus- and malware-free and are not used to get your personal information. The AL PASBAN website uses Google Analytics, which employs cookies to help us understand how you use our website. Google Analytics uses cookies to gather data that are not limited to your IP address.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Protection And Your Rights</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your data\\\\&#39;s security is AL PASBAN\\\\&#39;s top priority, and to protect it, we follow protocols and implement appropriate security measures on our website. Our policies were created to limit or stop unauthorized access to data and to prevent any unintentional loss of your information. Your information is gathered and stored on servers that are well-protected by firewalls.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please keep your username, password, and any account information private. Additionally, you can ask us to stop using your personal information for marketing reasons. As one of our customers, you also have the right to view and change your personal information if you discover any mistakes.</p>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '  ', '2022-11-10 10:19:03', '2022-11-10 14:49:03'),
(11, 'Shipping / Returnpolicy', 'shipping-returnpolicy', 'shipping-returnpolicy.php', '', 0, '<h2>Shipping/Return Policy</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n<li>If you order products from our website, you can anticipate receiving your order within 4 to 7 business days. The fact that we deliver our products all over India ensures that our delivery service is unrestricted.\r\n</li>\r\n<li>Delivery times may be longer than expected on public holidays, national holidays, and festivals.</li>\r\n<li>We do not currently accept international orders from other countries. However, you can email us at support@alpasban.com if you are ready to buy the product. </li>\r\n<li>We request you to safely store the numbers and original packaging so that we can smoothly assess your questions, complaints or doubts. Thus, kindly store and maintain these items so that we can resolve your complaints to the best of our abilities.  </li>\r\n</ol>', '', '', '', '', '', '', '', 0, '1', '', '', ' ', '2022-11-10 10:19:14', '2022-11-10 14:49:14'),
(12, 'Terms of Use', 'terms-of-use', 'terms-of-use.php', '', 0, '<h2>Terms And Conditions</h2>\r\n\r\n<p>AL PASBAN gives content and services that are subject to some terms and conditions. Our privacy, payment, and all the other policies and terms and conditions are available on the website. This also includes specific functionality, promotions, and customer service all of which are collectively part of this &ldquo;Terms And Conditions&rdquo;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>When you access this website, you are agreeing with the Terms And Conditions of the website and that you read, understand, and agree with the Terms And Conditions stated in this agreement. Kindly read this page carefully before proceeding to access the website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Privacy</h2>\r\n\r\n<p>Our privacy practices are stated here in our <strong>privacy policy</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Payment Policy</h2>\r\n\r\n<p>To know about our payment methods, kindly read our <strong>payment methods</strong>.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Shipping Policy</h2>\r\n\r\n<p>Please read our <strong>shipping policy</strong> so that you know about our delivery practices.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Products And Services For Use</h2>\r\n\r\n<p>The products and services that are defined on our website, or any samples provided to you are for personal use only. Bear in mind that the actual product may differ a little from the image shown on our website. You may not resell or sell any of the products or services, or samples that you receive from us. AL PASBAN reserves the right, with or without notice to cancel or reduce the quantity of any item that we provide to you, in case, we believe that you&rsquo;ve violated our terms and conditions.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Validity Of Information</h2>\r\n\r\n<p>We try to be accurate when defining products on our website. Only to the extent implied by applicable law, we don&rsquo;t guarantee that the product descriptions, information, colors, or any other content on the website is reliable, or completely error-free.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Intellectual Property(IP)</h2>\r\n\r\n<p>All the information available on the website and its interface, including but not limited to logos, trademarks, graphics, text, button icons, images, audio clips, software, data, and more is the property of AL PASBAN. The complete website content is owned by AL PASBAN, our partners, affiliates, and licensors, and is protected by the laws of India, including laws about intellectual property.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Except as put forth in the limited licenses or as under the applicable law, neither the content nor any portion of the website can be used, reproduced, sold, copied, duplicated, resold, modified, accessed, or in any way exploited, in complete or in parts, for any task without our approval, or prior written content.</p>\r\n\r\n<h2>Limited Licenses</h2>\r\n\r\n<p>We allow a limited, unsettled, and non-exclusive license to browse and personally use the AL PASBAN website. However, this limited access does not give you the right to:</p>\r\n\r\n<ol>\r\n	<li>Frame or use any framing techniques to enclose the website or any of its portions.</li>\r\n	<li>Transmit, license, download, republish, or redistribute the website and content. (excluding caching or something necessary to view the website).</li>\r\n	<li>Use the website or content on it for other than personal use.</li>\r\n	<li>Modify, or build any derived work based on the website and its content.</li>\r\n	<li>Use tools, spiders, crawlers, or any other data-gathering tools that may possess a burden or load on our website infrastructure.</li>\r\n	<li>You must keep all the proprietary notices on the website, attached to, or contained in the website.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We also provide a limited license to create a hyperlink to the homepage of our website for personal, non-commercial use. A website that links to our website:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>Can link to but not replicate all and/or any of our content.</li>\r\n	<li>In any way, imply that we are subscribing to such website or its services or products.</li>\r\n	<li>Should not misrepresent their relationship with us.</li>\r\n	<li>Contain content considered vulgar, distasteful, illegal, controversial, or inappropriate for any age.</li>\r\n	<li>Should not associate our products or services in an offensive or objectionable manner.</li>\r\n	<li>Associate us with unwanted products, services, and opinions.</li>\r\n	<li>Should only link to the homepage.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If we request you, you should immediately remove any link we don&rsquo;t find to be correct. You should pause any linking until we authorize you again to start linking. Any unauthorized use of our website or content will lead to automatic termination as stated in this section.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Obligations And Responsibilities Of The User</h2>\r\n\r\n<p>When you access our website, you should abide by these Terms And Conditions and all the other special warnings and instructions. You must act by the law, and in good faith. As a website browser, you may not change or modify the website or content that appears on the website or impair the normal functioning of the website. You&rsquo;re liable for all the losses and damages that we, our affiliates, partners, or licensors may imply if you willfully default on any of the set forth terms and conditions.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Third-Party Links</h2>\r\n\r\n<p>We will not bear the responsibility for any Off-page content or websites linking to or from the AL PASBAN website. Links that appear on the website are for convenience only and are not endorsements by us, our partners, or affiliates, in any way. Your linking to or from the off-website pages or any other websites is at your own risk.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;re not responsible nor do we warrant the offerings of, off-page websites or any external websites linked to or from our website. AL PASBAN also assumes no responsibility for the content, products, actions, or services of such websites or pages which also includes privacy policies and terms and conditions. You must carefully know the terms and conditions and privacy policy of all the external websites that you visit.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Submissions</h2>\r\n\r\n<p>As per our policy, we decline uninvited ideas and suggestions. Submissions include unsolicited suggestions and ideas, feedback, queries, suggestions, or any other information that you may provide us. These submissions will be treated as non-proprietary and non-confidential.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>As per the terms of our privacy policy, by transmitting or posting any submission, you grant us the right to reproduce, modify, copy, adapt, use, translate, publish, distribute, license, and sell the submission in the way we desire that includes but not limited to copying complete or in part, creating derivative works, distributing and displaying submission in any form, technology, media, whether known or developed, alone and part of other works, or simply using the submission within or with connection to our products or services.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your submission will also not be returned and we may use your submission or ideas, concepts, or know-how contained within the submission without payment of money or any other form of consideration for any purpose, without limitation that includes development, manufacturing, distributing, and marketing products.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>In case you make a submission, you accept the fact that you own or handle the rights to your submission. You further represent and guarantee that such Submission does not contain chain letters, mass mailings, viruses, commercial solicitation, or any other spam. Don&rsquo;t mislead the origin of the submission by submitting the wrong email address, or impersonating any entity or individual. You also agree to pay for the damages arising from or in connection with any of the submissions.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>User Content</h2>\r\n\r\n<p>When you upload, transmit, e-mail, or make available, text, data, software, photographs, music or sound, graphics, videos, images, messages, and other user content on the website, you are wholly responsible for such content. This user content constitutes a submission as stated above. What this means is that third parties and not us, are responsible for all the user content that they post to the website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You agree not to take part, assist or encourage others in posting, uploading, transmitting, emailing, or making website user content available that is:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Against the law, harmful, damaging, threatening, abusive, vulgar, harassing, deviating, complex, defamatory, pornographic, invasive of one&rsquo;s privacy, hateful(racial or ethnically), or any other objectionable content.</li>\r\n	<li>False, or in general, misleading.</li>\r\n	<li>Compensated for or granted by any of the third parties.</li>\r\n	<li>Filled with software viruses, unauthorized advertising, promotional materials such as mass mailings, or any other form of spam.</li>\r\n	<li>Available under any law or contractual relationships.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You also consent not to:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>Deliberately and unintentionally break any applied local, national, and international law.</li>\r\n	<li>Impersonate any individual or wrongly misrepresent your association with any person.</li>\r\n	<li>Stalk or harass, which includes promoting the harassment of another, trap or harm any third party, including minors in any possible way.</li>\r\n	<li>Forge identifiers or headers to manipulate the origin of the user content.</li>\r\n	<li>Gather personally identified data about other users.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>AL PASBAN does not regulate or promote the user content transmitted or posted on the website which is why we can&rsquo;t ensure the correctness, or integrity of the user content. While using the website you may be exposed to user content that&rsquo;s offensive, or distasteful to you. In any circumstances, we&rsquo;re not liable to any user content, in any way, and this also includes any errors in the user content, and if, in any case, you encounter loss as a result of the user content that&rsquo;s transmitted, uploaded, e-mailed or generally available on the website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You also agree that we have the right to refuse or remove any user content and also we reserve the right to delete or change any user content. Without restricting the provision of these terms and conditions, we possess the right to remove any user content that breaks these terms and conditions and is otherwise considered offensive. We have the authority to refuse services without any prior notice for any of the users who disobey these terms and conditions or disrupt the rights of others.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Special Events, Functions, And Features</h2>\r\n\r\n<p>AL PASBAN offers special events, functions, and features that may be:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>Subject to terms of use, rules, or policies instead of these Terms And Conditions.</li>\r\n	<li>Extended by us or third parties.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>If any of the above cases happen, we will notify you and if you choose to leverage our offers, you consent that your use of the offerings will be subject to different terms of use, and policies.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Representations, Warranties, And Limitation Of Liability</h2>\r\n\r\n<p>AL PASBAN represents as it is stated on the website. We make no assurance of any type, express or imply with these Terms And Conditions and the site. This includes but is not limited to the guarantee of merchantability, and non-infringement for a specific purpose, apart from the extent when such representations and warranties are not by law excludable.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You grant to the fullest extent allowed by applicable law that we will not bear the responsibility, whether in contract, tort(including negligence), or under any circumstance, for any:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>Access delay or interruptions to the website.</li>\r\n	<li>Interruption of business.</li>\r\n	<li>No delivery of data, misdelivery, destruction, corruption, or any other change.</li>\r\n	<li>Damages of any type as a result off-website links on our website.</li>\r\n	<li>Any inaccuracies or faults within the content.</li>\r\n	<li>Computer viruses and system malfunctions which can occur with the use of our site. This also includes hyperlinks from any of the third-party websites.</li>\r\n	<li>Events beyond our control.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please be aware of the components and usage instructions accompanying each of our products. Make sure that they are safe to use. For any of the products that you buy from AL PASBAN, you will, among other things be governed by the restriction of liability and disclaimer conditions given in more detail with the product packaging.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You also consent that no claims, arising, or associated with the use of the website or the terms and conditions can be bought by you more than one year after the cause of action associated with actions arising from it.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Disputes</h2>\r\n\r\n<p>Concerning any controversy regarding the website, all rights, actions, and obligations, explained by these Terms And Conditions shall be governed by the laws and courts of India.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Compensation</h2>\r\n\r\n<p>You agree to protect, indemnify and consider us harmless for any destruction, loss, or cost encountered, including attorneys&rsquo; fees, directly resulting from any third-party claim or action from the use of AL PASBAN or breach of these terms and conditions.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>From the use of software robots, crawlers or spiders, data gathering and extraction tools, or any action that imposes an unreasonable load on our infrastructure, you also consent to indemnify us for any damage, loss, or any reasonable fee, including attorney fees.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Agreement To Receive Notices Electronically By Posting On The Website And Through Email</h2>\r\n\r\n<p>You agree to receive any agreements, disclosures, or any other notices to which these Terms And Conditions refer from us electronically which includes no limitation by email or by posting notices on the website. Notices that we provide to you electronically, you agree, that it satisfies any legal requirement and that such communications be in writing in English.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You can withdraw to receive notices electronically by notifying us of your withdrawal and discontinuing your use of this website. In such a scenario, all the rights granted to you, under these Terms And Conditions shall automatically terminate. We cannot provide the benefits of the website to a user that does not consent to receive the notices electronically.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>General</h2>\r\n\r\n<p>You acknowledge that these Terms And Conditions consist of the complete agreement between us and your use of the website and that it supersedes and governs all existing proposals, agreements, or any other communications.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We have the right to modify these Terms And Conditions at any time by uploading the changes on the website and providing no notice of it in advance. These changes come into effect, immediately after posting. If you continue to use the website after these changes, then that means, that you agree to all the changed Terms And Conditions. Again, we may or may not, with or without any advanced notice, terminate the rights given by these Terms And Conditions. You must obey immediately with any termination or notice, as applicable, by immediately stopping the use of the website.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nothing in these terms and conditions must be understood as starting an agency, partnership, or any other form of a joint venture with us. AL PASBAN&rsquo;s failure to need your performance of any provision should not change our full right to require performance at any time after that. Nor should the breaking of any provision be taken or held as a waiver of the provision.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>When the rules of these terms and conditions become invalid under any applicable law or are so held by a court decision, such invalidity should not cause these Terms And Conditions to become invalid completely. But, instead, these Terms And Conditions should be modified to the possible extent by the judging party that most completely represents the original intent of the parties as reflected in the original provision.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>All rights reserved.</p>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '     ', '2022-11-10 10:19:30', '2022-11-10 14:49:30'),
(13, 'Payment Method', 'payment-method', 'payment-method.php', '', 0, '<h2>What Are Your Various Payment Methods?</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>With the following payment options, our customers can complete their payment requests:</p>\r\n\r\n<div class=\\\"payment\\\">\r\n<div class=\\\"credit\\\">\r\n<p>Credit Cards</p>\r\n\r\n<ul>\r\n	<li>MasterCard</li>\r\n	<li>Visa</li>\r\n	<li>Discover</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\\\"debit\\\">\r\n<p>Debit Cards</p>\r\n\r\n<ul>\r\n	<li>MasterCard</li>\r\n	<li>Visa</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\\\"debit\\\">\r\n<p>Cash On Delivery</p>\r\n</div>\r\n</div>\r\n\r\n<h2>Instructions For Paying Online With Various Methods</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>When using a credit or debit card to make a purchase, you&#39;ll need to provide the card&#39;s number, expiration date, and three-digit CVV code (available on the back of your card). Only after correctly entering these details, you will be redirected to the bank&rsquo;s page where you&rsquo;ll have to enter the online 3D secure password or OTP to complete the transaction.</li>\r\n	<li>You can use mobile banking and net banking by registering for the service with your respective bank and completing the transaction via the bank&rsquo;s official app or website.</li>\r\n	<li>Utilize any UPI app to make a quick transaction by simply inputting your UPI pin.</li>\r\n	<li>When the item is brought to your door, you can also give us cash in person.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>How Secure Is Payment With The Online Method?</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We at AL PASBAN have made sure that every one of our customers has a first-rate and secure buying experience. AL PASBAN adheres to the greatest security requirements, which is why our website also has an SSL certificate.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Card information is not retained and cannot be accessed without your permission by outside parties. Encryption is used to protect all of your personal information, and a secure connection is offered.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You shop with AL PASBAN using a 3D secure system that implements the following steps:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>While entering your new card information in the payment step, click on the box next to &lsquo;Secure Payment&rsquo;.</li>\r\n	<li>Information is processed before the order is placed with your concerned bank, and an SMS containing a code is issued to the phone number you have registered with your bank.</li>\r\n	<li>Enter this code in the empty field on the page that comes right after the payment process. If the SMS code is not entered within the allotted time, the order will not be confirmed.</li>\r\n	<li>As a result, the 3D secure system adds another level of security to the internet.</li>\r\n</ul>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '                 ', '2022-11-10 10:19:40', '2022-11-10 14:49:40'),
(14, 'Shop', 'shop', 'shop.php', 'Shop', 0, '', '', '35c0a4f8e7ba78c5d4b4a1490f27d1a8.jpg', '', '', '', '', '', 0, '1', '', '', ' ', '2022-11-10 10:19:40', '2022-11-10 14:49:40'),
(15, '404', '404', 'default.php', '404', 0, '<p>Oops! Page Not Found</p>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '     ', '2022-11-10 10:19:40', '2022-11-10 14:49:40'),
(16, 'Refund Policy', 'refund-policy', 'refund-policy.php', 'Refund Policy', 0, '<h2>Refund Policy</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Once you have contacted our customer service to seek a refund, it will take us 4 business days to collect the item from you. After the product has been thoroughly examined by our quality control department, further 7 days are needed to start the refund process. For the following two days, the item in our warehouse is put through a quality inspection. The receipt of the refund depends on the mode of payment that you chose.</p>\r\n\r\n<p>&nbsp;</p> \r\n\r\n<p>Our anticipated time frame is, in brief, as follows:</p>\r\n\r\n<p>&nbsp;</p> \r\n<ul>\r\n<li>After a satisfactory quality check, refund receipt for all types of orders would take about 7 business days after quality check. </li>\r\n</ul>\r\n\r\n<p>&nbsp;</p> \r\n\r\n<p>AL PASBAN bears full responsibility for refunding the whole payment if the order is lost or is not delivered to the desired destination. (Shipping costs included)</p>\r\n\r\n<p>&nbsp;</p> \r\n\r\n<p>However, if the order is successfully returned to you, shipping and COD fees will be applied, as necessary.</p>\r\n\r\n<p>&nbsp;</p> \r\n\r\n<h2>Cancellation Policy</h2>\r\n\r\n<p>Kindly send us an email at support@alpasban.com within 6 hours of placing the order from Monday to Saturday between 9 AM-6 PM for cancelling the order.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please be aware that certain items are dispatched right away, making it difficult to cancel them sometimes.</p>\r\n\r\n<p>&nbsp;</p> \r\n\r\n<p> The same payment method the customer used to start the payment for the product will be utilized to credit the amount paid.</p>\r\n\r\n<p>&nbsp;</p> \r\n\r\n<h2>Kindly Note: </h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The length of time for a return for debit and credit card transfers will fully depend on the providing bank.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Customers will receive an SMS from banks if the credit amount exceeds INR 5,000. Check your bank account or card statement for verification if the amount is less than 5,000 INR.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Another things to note is, only the product price will be reimbursed. Delivery and handling charges will be applied, as usual. </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n \r\n\r\n\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '  ', '2022-11-10 10:19:40', '2022-11-10 14:49:40'),
(17, 'FAQ', 'faq', 'faq.php', '', 0, '<h2>AL PASBAN FAQs</h2>\r\n\r\n<p>&nbsp;</p>\r\n<p>Q1. How to place an order on the website?</p> \r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: Simply choose the item that you want to purchase. Follow these steps after creating a login or using a guest login:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>1. Place the item in your shopping cart and select \\\"Buy Now.\\\"</p>\r\n<p>&nbsp;</p>\r\n\r\n<p>2. Add a delivery address next. You can choose an address you\\\'ve already added before moving to the next step.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>3. Enter your selected phone number and email.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>4. After you\\\'ve confirmed your order and chosen a payment method, pay.</p>\r\n<p>&nbsp;</p>\r\n\r\n<p>Q2. How can I track my order? </p>\r\n<p>Ans: It’s easy to track your orders on our website:</p>\r\n\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li>Enter your order number on the order tracking page.</li>\r\n<li>Select Track.</li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n\r\n<p>You will now be redirected to the status page: </p>\r\n<p>&nbsp;</p>\r\n\r\n<p>The definitions for your order status are as follows:</p> \r\n<p>&nbsp;</p>\r\n<ol>\r\n<li>New – Your order is not processed.</li>\r\n<li>Pending – Your order is accepted and is waiting to be dispatched. </li>\r\n<li>Dispatch – Your order got dispatched and you should receive an email with all the tracking information. </li>\r\n<li>Order Completed – A this point, you may have received your order, and your order will be marked completed. Contact us immediately if you haven’t received your order by then. </li>\r\n\r\n</ol>\r\n<p>&nbsp;</p>\r\n\r\n<p>Q3. What are the various ways through which I can contact your business? </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: If you wish to reach out to us, you can write us an email at support@alpasban.com. Or you can call, text, or Whatsapp us at +91-9311-503538. </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Q4. How can I update my account details? </p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Ans: To check your account details, just click \\\"My Account.\\\" You may access, update, and edit your account information there, including your address, phone number, email address, passwords, and more.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Q5. Can I order something that’s out of stock? </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: A product marked as \\\"Out of Stock\\\" is not available and therefore cannot be purchased. However, you can use our website\\\'s \\\"Notify Me\\\" function to be notified whenever an item becomes available.</p>\r\n<p>&nbsp;</p>\r\n\r\n<p>Q6. Do you guys deliver internationally? </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: Currently, we don’t accept international orders. Still, if you’re willing to buy any product, you can email us at support@alpasban.com.</p> \r\n\r\n<p>&nbsp;</p>\r\n<p>Q7. What if my order gets delayed on an occasion? </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: Please check your email or messages for any updates you might have missed if, in rare circumstances, your order is delayed. A delivery timeframe will be shared with you and you can even track your orders with AL PASBAN. If the problem persists, kindly contact us at support@alpasban.com.</p> \r\n\r\n<p>&nbsp;</p>\r\n<p>Q8. Is it possible to accept the package after verifying the contents? </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: A package cannot be opened before delivery is accepted, as per company policy. You can accept the package and later contact us if you find any faults within your package.</p> \r\n\r\n<p>&nbsp;</p>\r\n<p>Q9. Will you reconsider an order if it’s not collected the first time? </p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: Yes, we do re-attempt order deliveries. If the package is not collected the first time, we retry the delivery the very next day.</p> \r\n<p>&nbsp;</p>\r\n\r\n<p>Q10. I received an order and the package wasn’t in place. What can I do now? </p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Ans: As our dear customer, you have the option of replacing or returning the product. You can use the website Return option on the order and fill out the details as to what’s the exact issue.</p> \r\n\r\n<p>&nbsp;</p>\r\n<p>Q11. What if the order is not getting dispatched for a long time? </p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Ans: Right away contact our Customer Support so that we can look into the matter.</p> \r\n\r\n<p>&nbsp;</p>\r\n<p>Q12. Do you send a confirmation update on your orders?</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Ans: When you successfully place an order with AL PASBAN, we do indeed send you an email and SMS. At each stage of the order process, we\\\'ll let you know where your order is. With the aid of a tracking number for your shipping, you can even follow the progress of your order.</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Q13. Is it possible to change the delivery date of the order? </p>\r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: Unfortunately, the delivery date cannot be altered. You can be confident that we will deliver your order by the schedule.</p>\r\n<p>&nbsp;</p>\r\n\r\n<p>Q14. I’m facing an issue in tracking my order. What could be the reason? </p>\r\n<p>&nbsp;</p>\r\n\r\n<p>Ans: Sometimes, the tracking ID can take some time to activate. Check after a while and then you should have no problem tracking your order.</p> \r\n\r\n<p>&nbsp;</p>\r\n<p>Q15. I have not received the invoice for my order. What should I do?</p>\r\n\r\n<p>&nbsp;</p>\r\n<p>Ans: Don’t worry as the hard copy of the invoice is always sent with the order. If you have not received the hard copy then you can request a soft copy for your order at support@alpasban.com.</p>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '  ', '2022-11-17 06:12:21', '2022-11-17 10:42:21'),
(18, 'Forgot Password', 'forget-password', 'forget-password.php', '', 0, NULL, NULL, '', '', '', '', '', '', 0, '1', '', '', ' ', '2022-11-17 06:59:52', '2022-11-17 11:29:52'),
(19, 'Search', 'search', 'search.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '', '2022-11-21 11:41:02', '2022-11-21 16:11:02'),
(20, 'New Password', 'new-password', 'new-password.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '  ', '2022-11-22 07:13:18', '2022-11-22 11:43:18'),
(21, 'Payment', 'payment', 'payment.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', '', '2022-11-22 07:43:07', '2022-11-22 12:13:08'),
(22, 'Blog Detail', 'blog-detail', 'blog-details.php', '', 0, '', '', '', '', '', '', '', '', 0, '0', 'Blog Detail', '', ' ', '2022-11-10 10:15:15', '2022-11-10 14:45:15'),
(23, 'Order Success', 'order-success', 'order-success.php', '', 0, '', '', '', '', '', '', '', '', 0, '1', '', '', ' ', '2022-11-10 10:15:15', '2022-11-10 14:45:15'),
(24, 'MEN', 'men', 'default.php', '', 0, '<h2 style=\\\"text-align: center; color: #bf9125;\\\">Coming Soon.</h2>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '    ', '2022-12-08 10:21:22', '2022-12-08 14:51:22'),
(25, 'PERFUMES', 'perfumes', 'default.php', '', 0, '<h2 style=\\\"text-align: center; color: #bf9125;\\\">Coming Soon.</h2>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', '  ', '2022-12-09 07:45:54', '2022-12-09 12:15:54'),
(27, 'Sitemap', 'sitemap', 'sitemap.php', 'Sitemap', 0, NULL, NULL, NULL, NULL, '', '', '', '', 0, '1', '', '', '', '0000-00-00 00:00:00', '2023-02-09 03:42:51'),
(28, 'Thank You', 'thank-you', 'thank-you.php', 'Thank You', 0, '<h3>Thank you for your message. we will contact you soon.</h3>\r\n', '', '', '', '', '', '', '', 0, '1', '', '', ' ', '2023-02-09 01:02:21', '2023-02-09 06:02:21'),
(29, 'Blogs', 'blogs', 'blogs.php', NULL, 0, NULL, NULL, NULL, NULL, '', '', '', '', 0, '1', '', '', '', '0000-00-00 00:00:00', '2023-02-28 00:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `token` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `password_reset`
--

INSERT INTO `password_reset` (`id`, `email`, `token`, `date`) VALUES
(1, 'rajnish@ezrankings.in', 'f96c358357edd53cb1d6ce3c32a63888ed9dd6df3b05a99d30edc4e59221e61b1db8c29e368e8bf2e8d0bde68b98467447e5', '2022-11-22'),
(2, 'rajnish@ezrankings.in', '46e519c4ef116cf60bf7b7c43cfc11d95d90361de75db01a43d0f2546f6bf90b19d1c58ce6095a4ff25c7bbb465703ef7a9b', '2022-11-22'),
(3, 'rajnish@ezrankings.in', 'bca7f5edd11b16e9e25c726bb80c385d503ab79aeb9a624b523ff5c6daa23a87cd5446844de17247b28669a76615b614c46c', '2022-11-22'),
(4, 'rajnish@ezrankings.in', '14d9f0b44e7ec94d93fdfac35d43cb61e8203c0c7d4747317561fb74036b73f678fa189fc5476b48cda2f5a56bdd3cf919cc', '2022-11-22'),
(5, 'manorath.ezrankings@gmail.com', '7394954b0c219afb26c9034e00df34a2ac5640de993567b2681c7ffb9ab09e7153f986c4ca38a72df42f6c65325ec1346e08', '2022-11-28'),
(6, 'saifidanish295@gmail.com', 'd4a4a0a45dca8facfd74e2f0ecb77e3c926bc8370d0bb543169c3069314d4bd7a41278e3213322d1c2291445165ee19bddd3', '2022-12-01'),
(7, 'saifidanish295@gmail.com', 'c5108b0a4b56e30671e0a7490c6a6190a281e333fedb3d359935f321b588c7d2871c382a8985582f838c56cc810acbd99d33', '2022-12-15'),
(8, 'saifidanish295@gmail.com', '056079e0cd685df5cd5630917ee4d6b4d47d74db5e8859e64ac71c489f1c8c8c0c2b9ba29dd59a96bf008191ea96790f74e3', '2022-12-15'),
(9, 'siya.ngel4@gmail.com', 'b13d49f1fe075f4bc86d4abf212778038005d4d6d7a7097742ea78011be519e8b85f465c2f511326f4b0ab22a20cde6096d3', '2023-01-02'),
(10, 'siya.ngel4@gmail.com', '63d3839b4d80961ecf6cc30a794e397aa2ddc25adf3f6ccffe60e0a75707ada5b9770efe8104c9c5ee1d1fa6a1d46fc9e9d2', '2023-01-02'),
(11, 'siya.ngel4@gmail.com', 'ae0c8b518fcb142152504028e912e4a31fe02f0629d8e6208d758fe28c2a9fba1270609c1e0950efe63213baa0beeb61e352', '2023-01-02'),
(12, 'siya.ngel4@gmail.com', 'ec51f7e4e9aebfb2dacfd4256396e0e43d42020656cb969a2cfa1a75622a4f269a9c99cf1a09fb97da7ac7e0acf7a5bc21ac', '2023-01-02'),
(13, 'siya.ngel4@gmail.com', '3649744de635f9a4be5873e890f0eff4a4924ae0e955549dc14bdc639b8328d131854215a02f585556603cd9ed3d9461f2ba', '2023-01-06'),
(14, 'siya.ngel4@gmail.com', 'bd264840051bad7de2c5e3d890ccca425713d449a9d89e3f548e44d546c899143d83b1e9d5d6ba9b926a1d4d8d1d21e7ab63', '2023-01-06'),
(15, 'siya.ngel4@gmail.com', 'c389e51fab41a15618d43f97824243088186cf747f65bf822f339f5f64e18e0df8b8571eb75e2ff3778d2dcbf753088ea069', '2023-01-06');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `brand_id` varchar(50) DEFAULT NULL,
  `name` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `color` varchar(200) DEFAULT NULL,
  `regular_price` double NOT NULL,
  `sale_price` double DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_code` varchar(255) DEFAULT NULL,
  `style_id` varchar(50) DEFAULT NULL,
  `stock` int(5) DEFAULT NULL,
  `hsn_code` varchar(100) NOT NULL,
  `custom_size` text,
  `short_description` text,
  `additional_info` text,
  `description` text,
  `photo` varchar(200) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `banner_photo` varchar(255) NOT NULL,
  `banner_heading` varchar(255) NOT NULL,
  `banner_description` text NOT NULL,
  `banner_label` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
  `fabric_id` varchar(50) DEFAULT NULL,
  `product_type` enum('Simple','Variation') NOT NULL,
  `products_attributes_id` varchar(10) DEFAULT NULL,
  `counter` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `slug`, `color`, `regular_price`, `sale_price`, `sku`, `product_code`, `style_id`, `stock`, `hsn_code`, `custom_size`, `short_description`, `additional_info`, `description`, `photo`, `alt`, `banner_photo`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `fabric_id`, `product_type`, `products_attributes_id`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(2, '1,21,16,2', NULL, '3 PIECE SET - NAVY BLUE', '3-piece-set', '2', 2650, 0, 'AL-SET-NVYBL-I2', 'P0060', '1', 10, '630790', '', '', '', '<p><meta charset=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"utf-8\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" /></p>\r\n\r\n<ul>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-20a22d9b-7fff-4b85-19d9-603f59a294a6\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Wear the traditional and traditional Pakistani dress for your special day.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-20a22d9b-7fff-4b85-19d9-603f59a294a6\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Made of high-quality fabric that has Top Pure Georgette and Bottom Viscose Santoon Dupatta Nazmin.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-20a22d9b-7fff-4b85-19d9-603f59a294a6\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">It is important to choose a wedding and party dress that reflects your personality and your style</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-20a22d9b-7fff-4b85-19d9-603f59a294a6\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Beautiful and elegant embroidery work with V neck.</b></p>\r\n	</li>\r\n</ul>\r\n', '59c5f9e406124fd8ff2b26342adae629.jpg', 'Alt', '', '', '', '', '', '19,26,18', 'Variation', '2,1', 0, '1', '', '', '                                                           ', '2022-11-08 01:23:18', '2022-11-08 17:53:18');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `slug`, `color`, `regular_price`, `sale_price`, `sku`, `product_code`, `style_id`, `stock`, `hsn_code`, `custom_size`, `short_description`, `additional_info`, `description`, `photo`, `alt`, `banner_photo`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `fabric_id`, `product_type`, `products_attributes_id`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(3, '6,1,16,2', NULL, 'CHIKEN SEQUENCE PLAZO - NAVY BLUE', 'chiken-sequence-plazo--navy-blue', '2', 749, 0, 'AL-PLZ-CKN-NBLUE-RGL-D1', 'P00160', '2', 4, '', '', '', '', '<p><meta charset=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"utf-8\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" /></p>\r\n\r\n<ul>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-94010895-7fff-f671-fb24-792a2a3dfb49\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">It&#39;s no surprise because every Indian woman love to wear by Chikens.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-94010895-7fff-f671-fb24-792a2a3dfb49\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Crisp weave, so comfortable to wear with heavy rayon viscose fabric.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-94010895-7fff-f671-fb24-792a2a3dfb49\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">The sequenced pattern infuses a dash of style and culture.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-94010895-7fff-f671-fb24-792a2a3dfb49\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Beautiful embroidery work carries the entire traditional vibe.</b></p>\r\n	</li>\r\n</ul>\r\n', 'ddf27fbe084659b3c763838396154c44.jpg', '', '', '', '', '', '', '3', 'Variation', '2,1', 1, '1', '', '', '            ', '2022-11-08 01:57:01', '2022-11-08 18:27:01');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `slug`, `color`, `regular_price`, `sale_price`, `sku`, `product_code`, `style_id`, `stock`, `hsn_code`, `custom_size`, `short_description`, `additional_info`, `description`, `photo`, `alt`, `banner_photo`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `fabric_id`, `product_type`, `products_attributes_id`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(5, '12,1', NULL, 'BLUE BUTTERFLY ABAYA HAND WORK', 'blue-butterfly-abaya-hand-work', '8', 2250, 0, 'AL-BT-ABY-BLUE-RGL-B2', 'P0029', '5', 5, '', '', '', '', '<p><meta charset=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"utf-8\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" /></p>\r\n\r\n<ul>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-880e9c97-7fff-0d5b-a2b9-b83325a0e175\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Magnificent, high-quality fabric that is light and breathable.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-880e9c97-7fff-0d5b-a2b9-b83325a0e175\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">2-piece butterfly abaya with shaila design with beautiful, intricate detailing on the front of the abaya.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-880e9c97-7fff-0d5b-a2b9-b83325a0e175\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Closed in the front, shoulder zippers for easy wear with a luxurious elastic sleeve.</b></p>\r\n	</li>\r\n</ul>\r\n', 'e40dc04b087078cd096b420364b74efb.jpg', '', '', '', '', '', '', '6', 'Variation', '2,1', 2, '1', '', '', '        ', '2022-11-08 02:04:57', '2022-11-08 18:34:57'),
(6, '12,1', NULL, 'ABAYA CUFF WORK', 'abaya-cuff-work', '9', 2050, 0, 'AL-ABY-CFWRK-BLK-RGL-A2', 'P0021', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>2-piece black abaya with shaila.</b></li>\r\n	<li><b>Front open style abaya with embroidery with stone work cuff design, soft touch jaguar fabric.</b></li>\r\n	<li><b>Simple and sober look that gives you an elegant feel.</b></li>\r\n</ul>\r\n', '085c273a1c8b8bc640147f08c9be9294.jpg', '', '', '', '', '', '', '7', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-11-08 02:07:19', '2022-11-08 18:37:19'),
(8, '12,1', NULL, 'ABAYA HAND WORK STONE - BLACK', 'abaya-hand-work-stone-black1', '9', 2050, 0, 'AL-ABY-BLK-RGL-B4', 'P0007', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>Modern, eye-catching design with a lightweight imported zoom fabric that feels beautiful and comfortable.</b></li>\r\n	<li><b>Simple and sleek, this 2-piece black abaya with shaila is perfect for every woman.</b></li>\r\n	<li><b>The front open style gives you a modern look without compromising modesty.</b></li>\r\n</ul>\r\n', 'd083b82d3bd03dcd2610a6e0f65cc48c.jpg', '', '', '', '', '', '', '9', 'Variation', '2,1', 0, '1', '', '', '          ', '2022-11-08 02:11:42', '2022-11-08 18:41:42'),
(10, '1,22,16', NULL, 'ARABIAN NIQAB HANDWORK', 'arabian-niqab-handwork', '9', 450, 0, 'AL-NQB-HNDWRK-BLK-A1', 'P0032', '7', 6, '', '', '', '', '<ul>\r\n	<li><b>Arabian niqab with beautiful hand work.</b></li>\r\n	<li><b>Protects you from sun, bad eyes, dust and other bad elements</b></li>\r\n	<li><b>100% safe for all day wear at work or outings.</b></li>\r\n	<li><b>Able to wear it in different ways to suit your needs</b></li>\r\n	<li><b>Georgette fabric is light, soft, and breathable</b></li>\r\n</ul>\r\n', '7e97985473160838bbc5337e55fd5155.jpg', '', '', '', '', '', '', '11', 'Simple', NULL, 0, '1', '', '', '        ', '2022-11-08 02:14:52', '2022-11-08 18:44:52'),
(11, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - BLACK', 'luxury-hijab-stone-work---black', '9', 600, 0, 'AL-LUXHJB-BLK-E1', 'P0084', '8', 3, '', '', '', '', '<ul>\r\n	<li><b>Fully imported luxury party wear hijab with stone work</b></li>\r\n	<li><b>Comfortable imported lycra material make you feel so fresh and natural</b></li>\r\n	<li><b>Beautiful border stone work that make you look different.</b></li>\r\n	<li><b>hijab size 175 cm 70 cm.</b></li>\r\n</ul>\r\n', 'ad2ef16f3feadc3fcf972e01f941f9ff.jpg', '', '', '', '', '', '', '12,13', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-11-08 02:18:18', '2022-11-08 18:48:18'),
(12, '6,1,2', NULL, 'SHIMMER PANTS - GOLD', 'shimmer-pants-gold', '11', 599, 0, 'AL-SMRPNTS-GLD-RGL-C1', 'P00141', '2', 10, '', '', '', '', '<ul>\r\n	<li><b>The SHIMMER PANT with pocket will feel you great.</b></li>\r\n	<li><b>Stretchable shimmer fabric will keep you feeling comfortable.</b></li>\r\n	<li><b>The sitting and walking comfort is unbeatable.</b></li>\r\n	<li><b>Wear these great SHIMMER PANTS both to work and to the party for an evening out on the town, or even to college for a more comfortable feel.</b></li>\r\n</ul>\r\n', '98e63fb4638b369fd1ebed7660948d26.jpg', '', '', '', '', '', '', '14', 'Variation', '2,1', 0, '1', '', '', '       ', '2022-11-09 07:06:18', '2022-11-09 11:36:18'),
(13, '6,34,1,2', NULL, 'PREMIUM LEGGINGS', 'premium-leggings', '12', 499, 0, 'AL-LGNS-MSTRD-RGL-D4', 'P00129', '2', 3, '', '', '', '', '<ul>\r\n	<li><b>Superb premium leggings for you to feel extra comfortable.</b></li>\r\n	<li><b>Great quality premium viscose material is breathable and you can wear it anywhere, from college, office also parties.</b></li>\r\n	<li><b>Make you feel very comfortable with this high-quality fabric!</b></li>\r\n</ul>\r\n', '099841ee23ab95b9a98f89d877fc154b.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '      ', '2022-11-09 07:10:04', '2022-11-09 11:40:04'),
(14, '6,1,2', NULL, 'PLAZO CHECK SEA GREEN', 'plazo-check-sea-green', '14', 450, 0, 'AL-PLZ-CHK-SGRN-RGL-D2', 'P00145', '2', 6, '', '', '', '', '<ul>\r\n	<li><b>Get your favourite check style plazo, with comfortable heavy rayon fabric and breathable fabric.</b></li>\r\n	<li><b>Excellent quality fabric for both casual and formal wear.</b></li>\r\n	<li><b>It is a must have for you!</b></li>\r\n</ul>\r\n', '89875f4f91e614145d8897e776f312b0.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', '       ', '2022-11-10 12:48:45', '2022-11-10 17:18:45'),
(15, '12,1', NULL, 'AIRLINE ABAYA HANDWORK (O)', 'airline-abaya-handwork-o', '9', 1499, 0, 'AL-ARL-O-ABY-BLK-RGL-A1', 'P0031', '5', 7, '', '', '', '', '<ul>\r\n	<li><b>Stunning design and patterns will make you feel like royal.</b></li>\r\n	<li><b>This airline abaya with shaila is light weight and comfortable, perfect to wear all day long.</b></li>\r\n	<li><b>It has a beautiful design that will make you stand out from the crowd.</b></li>\r\n</ul>\r\n', '141db2a337f36785f8257f74ff8c1728.jpg', '', '', '', '', '', '', '17', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-11-10 01:12:39', '2022-11-10 17:42:39'),
(19, '12,1', NULL, 'TURKISH ABAYA - WINE', 'turkish-abaya-wine', '7', 2999, 0, 'AL-ABY-JGR-WINE-RGL-B3', 'P0016', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>Turkish Abaya with Shaila, an eye-catching abaya that\\\\\\\\&#39;s perfect for both casual wear and fancy occasions.</b></li>\r\n	<li><b>The fabric is made from JAGUAR, a material that\\\\\\\\&#39;s soft to the touch.</b></li>\r\n	<li><b>This abaya reaches up to 56 inches in length and can be styled in front with a belt.</b></li>\r\n	<li><b>Works as a dress with sleeves or belt and shaila also.</b></li>\r\n</ul>\r\n', 'd566c9f417747728cb394211fcd05a30.jpg', '', '', '', '', '', '', '22,7', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-11-18 12:13:51', '2022-11-18 16:43:51'),
(20, '6,1,2', NULL, 'BLACK PANTS', 'pants', NULL, 849, 0, 'AL-PNTS-BLK-3SZ-D3', 'P00133', '2', 15, '', '', '', '', '<ul>\r\n	<li><b>A high-quality, comfortable and breathable fabric.</b></li>\r\n	<li><b>The black pant is made from a cotton satin and viscose.</b></li>\r\n	<li><b>Material is stretchable and soft.</b></li>\r\n	<li><b>It can be worn for various occasions including office environment, dinner parties or any casual gatherings</b></li>\r\n</ul>\r\n', '0ffc3f022706a8eaca60434741246413.jpg', '', '', '', '', '', '', '27,28', 'Variation', '2,1', 0, '1', '', '', '            ', '2022-11-18 01:05:14', '2022-11-18 17:35:14'),
(21, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - DARK PINK', 'luxury-hijab-shimmer-print-dark-pink', NULL, 550, 0, 'AL-LUXHJB-PNT-DPNK-G3', 'P0099', '8', 5, '', '', '', '', '<ul>\r\n	<li><b>Luxury shimmer print hijab with a fancy shimmering appearance.</b></li>\r\n	<li><b>Fabric content of the hijab is just lightweight impt fabric, also contains a touch of cotton that results in a softer and more comfortable feel.</b></li>\r\n	<li><b>The size of the hijab can be adjusted to 175 cm long and 70 cm wide.</b></li>\r\n	<li><b>Made of high-quality material to ensure you feel comfortable and look rich.</b></li>\r\n</ul>\r\n', 'bbde1616c770e8ece5bd1222329a93f0.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '       ', '2022-11-18 01:14:31', '2022-11-18 17:44:31'),
(22, '12,1', NULL, 'JILBAB WITH NOSE PIECE', 'jilbab-with-nose-piece', '48', 1999, 0, 'AL-JIL-GRN-RGL-B3', 'P0019', '11', 5, '', '', '', '', '<ul>\r\n	<li><b>Perfect for prayer and daily wear. This 3-piece jilbab with nose piece covers your body nicely, its elasticized sleeves are convenient to pull over your hands for a full coverage.</b></li>\r\n	<li><b>The fabric is lightweight and very comfortable, so you can wear this on a daily basis without feeling too weighed down by it.</b></li>\r\n</ul>\r\n', '8d12ed3427afc7b7a9d5bcbe57b70457.jpg', '', '', '', '', '', '', '6', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-11-18 01:19:56', '2022-11-18 17:49:56'),
(23, '12,1', NULL, 'ABAYA WITH BUTTON - BLUE', 'abaya-with-button-blue', NULL, 1450, 0, 'AL-ABY-JGR-BLUE-RGL-A3', 'P0011', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>The stylish, comfortable abaya is well suited for all occasions and be the centre of attraction in this beautiful blue abaya with shaila.</b></li>\r\n	<li><b>Features a deep plate design and a stunning front open that make it an abaya that you can flaunt with confidence.</b></li>\r\n	<li><b>Designed in jaguar fabric for an effortless style and effortless touch.</b></li>\r\n</ul>\r\n', '293e2155b2bda8a0984006121c053789.jpg', '', '', '', '', '', '', '7', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-11-18 01:26:01', '2022-11-18 17:56:01'),
(24, '12,1', NULL, 'ABAYA EMBROIDERY WORK', 'abaya-embroidery-work', '40', 1750, 0, 'AL-ABY-BLK/GLD-RGL-A2', 'P0022', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>Made of imported nida fabric that&rsquo;s lightweight and soft to the touch.</b></li>\r\n	<li><b>Comes in a black and gold color combination with a detachable belt.</b></li>\r\n	<li><b>Best for formal parties as well as daily wear.</b></li>\r\n</ul>\r\n', 'd1f79e5e981cbb23f8a2de32cf2c08f2.jpg', '', '', '', '', '', '', '17', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-11-18 01:41:03', '2022-11-18 18:11:03'),
(25, '12,1', NULL, 'ABAYA CUFF', 'abaya-cuff', NULL, 1550, 0, 'AL-ABY-JGR-BLK-RGL-A3', 'P0014', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>2-piece black abaya with shaila .</b></li>\r\n	<li><b>Front open style abaya with embroidery with stone work cuff design, soft touch jaguar fabric.</b></li>\r\n	<li><b>Simple and sober look that gives you an elegant feel.</b></li>\r\n</ul>\r\n', '4ec55fd38b4d41bbaaa3e93b53e1cc0f.jpg', '', '', '', '', '', '', '7', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-11-18 01:42:48', '2022-11-18 18:12:48'),
(26, '12,1', NULL, 'CIGZI FLOWER FRILL WORK', 'cigzi-flower-frill-work', '9', 2350, 0, 'AL-ABY-BLK-CGZ-RGL-B4', 'P0010', '5', 5, '', '', '', '', '<ul>\r\n	<li><b>2-piece black abaya with shaila, Comes in a traditional Moroccan style, with a front close design.</b></li>\r\n	<li><b>Made from our signature super-rich fabric, the Abaya is a total investment piece.</b></li>\r\n	<li><b>The bottom plate has a frill design with flower print.</b></li>\r\n</ul>\r\n', '714a6aea71503565f1ebcfd5a2df2470.jpg', '', '', '', '', '', '', '30', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-11-18 01:44:04', '2022-11-18 18:14:04'),
(27, '24,19,1', NULL, 'HIJAB FLOWER PRINT - BLACK', 'hijab-flower-print-black', '9', 449, 0, 'AL-DLYHJB-BLK-G1', 'P00116', '12', 6, '', '', '', '', '<ul>\r\n	<li><b>Made of the finest cotton shimmer material and exquisite flower print, you will be the most elegant and delicate girl when you wearing this hijab.</b></li>\r\n	<li><b>Hijab size: 175cm x 85cm. Perfect for any teens and ladies; Easily cover your head, neck, and chest with a scarf that gives you stylish look.</b></li>\r\n	<li><b>This hijab is perfect for college wear and daily wear because of its simplicity which can enhance beauty.</b></li>\r\n</ul>\r\n', 'c8ab528efaf30eaa75efb800ba74bcc6.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '      ', '2022-11-18 01:50:43', '2022-11-18 18:20:43'),
(28, '6,1,2', NULL, 'FLEX PANTS 1 PATTERN', 'flex-pants-1-pattern', NULL, 650, 0, 'AL-FLXPNT1-OFWHT-RGL-C2', 'P00134', '2', 4, '', '', '', '', '<ul>\r\n	<li><b>The perfect union of cotton linen and viscose that provides you a soft and comfortable feel.</b></li>\r\n	<li><b>The stylish design gives you an edge and makes you stand out in any occasion.</b></li>\r\n	<li><b>The lightweight material gives you breathability to keep your body cool.</b></li>\r\n	<li><b>This product is suitable for both formal events and casual wear, which makes it one of a kind.</b></li>\r\n	<li><b>Color off white</b></li>\r\n</ul>\r\n', 'd79ece4e68b55cc73b6a48838287984b.jpg', '', '', '', '', '', '', '33,28', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-11-18 02:15:37', '2022-11-18 18:45:37'),
(29, '35,1,20,2', NULL, 'VISCOSE KURTI', 'viscose-kurti', NULL, 1799, 0, 'AL-KURTI-WNE-J3', 'P0043', '4', 20, '', '', '', '', '<ul>\r\n	<li>Breathe in luxury and sophistication with this premium, exclusive kurti.</li>\r\n	<li>Made from high quality viscose fabrics for a comfortable wear.</li>\r\n	<li>Casual yet elegant. Can be worn for any occasion or in any place.</li>\r\n</ul>\r\n', '7750bdc5315e01d3f1c36e28bbb9c38c.jpg', '', '', '', '', '', '', '4,5', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-05 08:05:57', '2022-12-05 12:35:57'),
(30, '1,21,2', NULL, '3 PIECE SET - BOTTLE GREEN', '3-piece-set---bottle-green', '4', 2670, 0, 'AL-SET-BGRN-H3', 'P0055', '1', 5, '', '', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Fox Georgette and Bottom heavy Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with round neck.</b></li>\r\n</ul>\r\n', '358d5c8b14311e15ab081496dbf97ebc.jpg', '', '', '', '', '', '', '25,26,24', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-05 08:34:43', '2022-12-05 13:04:43'),
(32, '12,1', NULL, 'KAFTAN - BLACK + MAHROON', 'kaftan---black--mahroon', '41', 1950, 0, 'AL-ABY-BL/MRN-RGL-A4', 'P0002', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>this kaftan is made of beautiful imported cy crush fabric. Bringing to you a unique, rich and elegant style without the worries of an expensive price tag.</b></li>\r\n	<li><b>The front is open with a beautiful colour combination. A beautiful 2-piece kaftan with shaila that completes your outfit!</b></li>\r\n	<li><b>You\\\\\\\\\\\\\\\\&#39;ll feel rich and full of life in this exquisitely designed kaftan.</b></li>\r\n</ul>\r\n', 'd631ed615146facf74bbfdac869fbbf6.jpg', '', '', '', '', '', '', NULL, 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-05 10:10:28', '2022-12-05 14:40:29'),
(33, '12,1', NULL, 'TURKISH ABAYA - PEACH', 'turkish-abaya---peach', '26', 2999, 0, 'AL-ABY-JGR-PCH-RGL-A3', 'P0015', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>Turkish Abaya with Shaila, an eye-catching abaya that&#39;s perfect for both casual wear and fancy occasions.</b></li>\r\n	<li><b>The fabric is made from JAGUAR, a material that&#39;s soft to the touch.</b></li>\r\n	<li><b>This abaya reaches up to 56 inches in length and can be styled in front with a belt.</b></li>\r\n	<li><b>Works as a dress with sleeves or belt and shaila also.</b></li>\r\n</ul>\r\n', '07df017450a28f27d630b511cbbd8e7d.jpg', '', '', '', '', '', '', '22', 'Variation', '2,1', 0, '1', '', '', '      ', '2022-12-05 11:24:54', '2022-12-05 15:54:54'),
(34, '12,1', NULL, 'ABAYA WITH BUTTON - BLACK', 'abaya-with-button---black', '9', 1450, 0, 'AL-ABY-JGR-BLACK-RGL-A3', 'P0012', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>The stylish, comfortable abaya is well suited for all occasions and be the centre of attraction in this beautiful black abaya with shaila.</b></li>\r\n	<li><b>Features a deep plate design and a stunning front open that make it an abaya that you can flaunt with confidence.</b></li>\r\n	<li><b>Designed in jaguar fabric for an effortless style and effortless touch.</b></li>\r\n</ul>\r\n', 'ad3ee5a738ac60d122f65b2c2330bd65.jpg', '', '', '', '', '', '', '7', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-05 11:35:58', '2022-12-05 16:05:58'),
(35, '12,1', NULL, 'ABAYA HAND WORK STONE - BLACK', 'abaya-hand-work-stone---black2', '9', 2299, 0, 'AL-ABY-BLK-RGL-A4', 'P0005', '6', 9, '', '', '', '', '<ul>\r\n	<li><b>Modern, eye-catching design with a lightweight imported zoom fabric that feels beautiful and comfortable.</b></li>\r\n	<li><b>Simple and sleek, this 2-piece black abaya with shaila is perfect for every woman.</b></li>\r\n	<li><b>The front open style gives you a modern look without compromising modesty.</b></li>\r\n	<li><b>Beautiful HAND WORK.</b></li>\r\n</ul>\r\n', '6375263b01cde9f0d300973de2d934ee.jpg', '', '', '', '', '', '', '9', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-05 11:52:30', '2022-12-05 16:22:30'),
(37, '12,1', NULL, 'ABAYA HAND WORK STONE - BLACK', 'abaya-hand-work-stone---black3', '9', 2350, 0, 'AL-ABY-BLK-RGL-A4-2', 'P0003', '6', 10, '', '', '', '', '<ul>\r\n	<li><b>Modern, eye-catching design with a lightweight imported zoom fabric that feels beautiful and comfortable.</b></li>\r\n	<li><b>Simple and sleek, this 2-piece black abaya with shaila is perfect for every woman.</b></li>\r\n	<li><b>The front open style gives you a modern look without compromising modesty.</b></li>\r\n	<li><b>Beautiful HAND WORK.</b></li>\r\n</ul>\r\n', '2fc42624e495dfa0070421709d0142ad.jpg', '', '', '', '', '', '', '9', 'Variation', '2,1', 0, '1', '', '', ' ', '2022-12-05 12:02:11', '2022-12-05 16:32:11'),
(38, '6,1,2', NULL, 'CHIKEN SEQUENCE PLAZO - BLACK', 'chiken-sequence-plazo---black', '9', 749, 0, 'AL-PLZ-CKN-BLK-RGL-D1', 'P00157', '2', 6, '', '', '', '', '<ul>\r\n	<li><b>It\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&#39;s no surprise because every Indian woman love to wear by Chikens.</b></li>\r\n	<li><b>Crisp weave, so comfortable to wear with heavy rayon viscose fabric.</b></li>\r\n	<li><b>The sequenced pattern infuses a dash of style and culture.</b></li>\r\n	<li><b>Beautiful embroidery work carries the entire traditional vibe.</b></li>\r\n</ul>\r\n', 'a0a7dd315500389a127caad3f7cddbb0.jpg', '', '', '', '', '', '', '3', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-05 12:12:47', '2022-12-05 16:42:47'),
(39, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - DARK PURPLE', 'luxury-hijab-shimmer-print---dark-purple', NULL, 550, 0, 'AL-LUXHJB-PNT-DPRPL-G3', 'P00103', '8', 5, '', '', '', '', '<ul>\r\n	<li><b>Luxury shimmer print hijab with a fancy shimmering appearance.</b></li>\r\n	<li><b>Fabric content of the hijab is just lightweight impt fabric, also contains a touch of cotton that results in a softer and more comfortable feel.</b></li>\r\n	<li><b>The size of the hijab can be adjusted to 175 cm long and 70 cm wide.</b></li>\r\n	<li><b>Made of high-quality material to ensure you feel comfortable and look rich.</b></li>\r\n</ul>\r\n', '60628162ee9a8eaba59e46b5fb91a8f3.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-05 12:42:06', '2022-12-05 17:12:06'),
(40, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - ROYLE BLUE', 'luxury-hijab-shimmer-print---royle-blue', NULL, 550, 0, 'AL-LUXHJB-PNT-RBLUE-G3', 'P00101', '8', 5, '', '', '', '', '<ul>\r\n	<li><b>Luxury shimmer print hijab with a fancy shimmering appearance.</b></li>\r\n	<li><b>Fabric content of the hijab is just lightweight impt fabric, also contains a touch of cotton that results in a softer and more comfortable feel.</b></li>\r\n	<li><b>The size of the hijab can be adjusted to 175 cm long and 70 cm wide.</b></li>\r\n	<li><b>Made of high-quality material to ensure you feel comfortable and look rich.</b></li>\r\n</ul>\r\n', 'cbfe62b32661f9e40fcfd6ca84b82d82.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-05 12:58:07', '2022-12-05 17:28:07'),
(41, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - BROWN', 'luxury-hijab-shimmer-print---brown', NULL, 550, 0, 'AL-LUXHJB-PNT-BRN-G3', 'P00102', '8', 5, '', '', '', '', '<ul>\r\n	<li><b>Luxury shimmer print hijab with a fancy shimmering appearance.</b></li>\r\n	<li><b>Fabric content of the hijab is just lightweight impt fabric, also contains a touch of cotton that results in a softer and more comfortable feel.</b></li>\r\n	<li><b>The size of the hijab can be adjusted to 175 cm long and 70 cm wide.</b></li>\r\n	<li><b>Made of high-quality material to ensure you feel comfortable and look rich.</b></li>\r\n</ul>\r\n', '1250e5d18662423cfe60f61cb4e402eb.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-05 01:19:53', '2022-12-05 17:49:53'),
(42, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - WINE', 'luxury-hijab-shimmer-print---wine', '7', 550, 0, 'AL-LUXHJB-PNT-WNE-G3', 'P0096', '8', 5, '', '', '', '', '<ul>\r\n	<li><b>Luxury shimmer print hijab with a fancy shimmering appearance.</b></li>\r\n	<li><b>Fabric content of the hijab is just lightweight impt fabric, also contains a touch of cotton that results in a softer and more comfortable feel.</b></li>\r\n	<li><b>The size of the hijab can be adjusted to 175 cm long and 70 cm wide.</b></li>\r\n	<li><b>Made of high-quality material to ensure you feel comfortable and look rich.</b></li>\r\n</ul>\r\n', '2e0493b00286549d0c0adedf40adb416.jpg', '', '', '', '', '', '', NULL, 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-05 01:23:08', '2022-12-05 17:53:08'),
(43, '24,19,1', NULL, 'HIJAB FLOWER PRINT - BLUE', 'hijab-flower-print---blue', '8', 449, 0, 'AL-DLYHJB-BLUE-G2', 'P00113', '12', 6, '', '', '', '', '<ul>\r\n	<li><b>Made of the finest cotton shimmer material and exquisite flower print, you will be the most elegant and delicate girl when you wearing this hijab.</b></li>\r\n	<li><b>Hijab size: 175cm x 85cm. Perfect for any teens and ladies; Easily cover your head, neck, and chest with a scarf that gives you stylish look.</b></li>\r\n	<li><b>This hijab is perfect for college wear and daily wear because of its simplicity which can enhance beauty.</b></li>\r\n</ul>\r\n', '8a89f1a735da99725d6b4ace9c505437.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-05 01:35:51', '2022-12-05 18:05:51'),
(44, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - GREY', 'luxury-hijab-shimmer-print---grey', '18', 550, 0, 'AL-LUXHJB-PNT-GREY-G3', 'P0098', '8', 5, '', '', '', '', '<ul>\r\n	<li><b>Luxury shimmer print hijab with a fancy shimmering appearance.</b></li>\r\n	<li><b>Fabric content of the hijab is just lightweight impt fabric, also contains a touch of cotton that results in a softer and more comfortable feel.</b></li>\r\n	<li><b>The size of the hijab can be adjusted to 175 cm long and 70 cm wide.</b></li>\r\n	<li><b>Made of high-quality material to ensure you feel comfortable and look rich.</b></li>\r\n</ul>\r\n', '3b9250a70403ae6fdd39e023b2c5c201.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-05 01:40:28', '2022-12-05 18:10:28'),
(46, '24,19,1', NULL, 'HIJAB FLOWER PRINT - GREY', 'hijab-flower-print-grey', '18', 449, 0, 'AL-DLYHJB-GREY-G1', 'P00117', '12', 5, '', '', '', '', '', '8fad28ed057275df8cf3d716e44dac8d.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-05 01:55:46', '2022-12-05 18:25:46'),
(47, '24,19,1', NULL, 'HIJAB FLOWER PRINT - BOTTLE GREEN', 'hijab-flower-print---bottle-green', '4', 449, 0, 'AL-DLYHJB-BGRN-G2', 'P00112', '12', 6, '', '', '', '', '<ul>\r\n	<li><b>Made of the finest cotton shimmer material and exquisite flower print, you will be the most elegant and delicate girl when you wearing this hijab.</b></li>\r\n	<li><b>Hijab size: 175cm x 85cm. Perfect for any teens and ladies; Easily cover your head, neck, and chest with a scarf that gives you stylish look.</b></li>\r\n	<li><b>This hijab is perfect for college wear and daily wear because of its simplicity which can enhance beauty.</b></li>\r\n</ul>\r\n', 'dc81bc671437177ac71a4d7a8b7946db.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 05:48:07', '2022-12-06 10:18:07'),
(48, '24,19,1', NULL, 'HIJAB FLOWER PRINT - WINE', 'hijab-flower-print---wine', '7', 449, 0, 'AL-DLYHJB-WNE-G1', 'P00115', '12', 6, '', '', '', '', '<ul>\r\n	<li><b>Made of the finest cotton shimmer material and exquisite flower print, you will be the most elegant and delicate girl when you wearing this hijab.</b></li>\r\n	<li><b>Hijab size: 175cm x 85cm. Perfect for any teens and ladies; Easily cover your head, neck, and chest with a scarf that gives you stylish look.</b></li>\r\n	<li><b>This hijab is perfect for college wear and daily wear because of its simplicity which can enhance beauty.</b></li>\r\n</ul>\r\n', 'b5e9cc00a584ea0cb4be81551d5e3cff.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 06:21:40', '2022-12-06 10:51:40'),
(49, '1,21,2', NULL, '3 PIECE SET - BOTTLE BLUE', '3-piece-set---bottle-blue', NULL, 2670, 0, 'AL-SET-BBLUE-H3', 'P0057', '1', 5, '', '', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Fox Georgette and Bottom heavy Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with round neck.</b></li>\r\n</ul>\r\n', 'b141d206e47c2c937e604e442218a5ad.jpg', '', '', '', '', '', '', '25,26,24', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 06:27:06', '2022-12-06 10:57:06'),
(50, '1,21,2', NULL, '3 PIECE SET - BURGUNDY', '3-piece-set---burgundy', NULL, 2670, 0, 'AL-SET-BRGNDY-H3', 'P0056', '1', 5, '', '', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Fox Georgette and Bottom heavy Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with round neck.</b></li>\r\n</ul>\r\n', '7c353f8fa50e31b08adb50dc71d7b392.jpg', '', '', '', '', '', '', '25,26,24', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 06:32:30', '2022-12-06 11:02:30'),
(51, '1,21,2', NULL, '3 PIECE SET - PURPLE', '3-piece-set---purple', NULL, 2650, 0, 'AL-SET-PRPL-I4', 'P0044', '13', 20, '', '', '', '', '<ul>\r\n	<li><b>Soft, light and airy, this 3-piece batik suit is a perfect ensemble for your parties.</b></li>\r\n	<li><b>Suit fabric chanderi silk dupatta protects you from the sun, but doesn\\\\\\\\&#39;t get in the way of your style.</b></li>\r\n	<li><b>The beautiful hand work on the suit lends a rustic charm to your look; the long duppata in particular has an old-world charm.</b></li>\r\n</ul>\r\n', '85bb20f805502030b99f6890a9b4ef1b.jpg', '', '', '', '', '', '', '4', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 06:44:15', '2022-12-06 11:14:15'),
(52, '1,21,2', NULL, '3 PIECE SET - BLACK', '3-piece-set---black', '9', 2670, 0, 'AL-SET-BLK-I3', 'P0054', '1', 5, '', '', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Fox Georgette and Bottom heavy Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with round neck.</b></li>\r\n</ul>\r\n', 'ffde0643656530d64443ef9c62d0b9a2.jpg', '', '', '', '', '', '', '25,26,24', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 06:50:29', '2022-12-06 11:20:29'),
(53, '35,1,20,2', NULL, 'BLACK KURTI', 'black-kurti', '9', 1199, 0, 'AL-KURTI-BLK-J3', 'P0042', '14', 25, '', '', '', '', '<ul>\r\n	<li><b>Emblazoned with a simple yet striking design, perfect for any personality and occasion.</b></li>\r\n	<li><b>The fabric bandha jakad is lightweight, breathable, and stretchy. Wearing it guarantees that you\\\\\\\\\\\\\\\\&#39;ll be comfortable and look effortlessly chic.</b></li>\r\n	<li><b>when you wear this black kurti and people will compliment you for your effortless style</b></li>\r\n</ul>\r\n', '73e25b15f6766f94ef24bec8d655e197.jpg', '', '', '', '', '', '', '32', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 06:58:03', '2022-12-06 11:28:03'),
(54, '6,1,2', NULL, 'WHITE PANTS', 'white-pants', '21', 849, 0, 'AL-PNTS-WHT-3SZ-D3', 'P00132', '2', 15, '', '', '', '', '<ul>\r\n	<li><b>A high-quality, comfortable and breathable fabric.</b></li>\r\n	<li><b>The white pant is made from a cotton satin and viscose.</b></li>\r\n	<li><b>Material is stretchable and soft.</b></li>\r\n	<li><b>It can be worn for various occasions including office environment, dinner parties or any casual gatherings</b></li>\r\n</ul>\r\n', 'e1b4691240fae94de05c51d216bfb458.jpg', '', '', '', '', '', '', '27,28', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 07:12:08', '2022-12-06 11:42:08'),
(55, '6,1,2', NULL, 'FLEX PANTS 2 PATTERN', 'flex-pants-2-pattern', NULL, 650, 0, 'AL-FLXPNT2-OFWHT-RGL-C2', 'P00135', '2', 4, '', '', '', '', '<ul>\r\n	<li><b>The perfect union of cotton linen and viscose that provides you a soft and comfortable feel.</b></li>\r\n	<li><b>The stylish design gives you an edge and makes you stand out in any occasion.</b></li>\r\n	<li><b>The lightweight material gives you breathability to keep your body cool.</b></li>\r\n	<li><b>This product is suitable for both formal events and casual wear, which makes it one of a kind.</b></li>\r\n	<li><b>Color off white.</b></li>\r\n</ul>\r\n', 'bbf10ecf0c03c9fc75c7fe82978193e7.jpg', '', '', '', '', '', '', '33,28', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 07:19:22', '2022-12-06 11:49:22'),
(56, '6,1,2', NULL, 'FLEX PANTS 3 PATTERN', 'flex-pants-3-pattern', NULL, 650, 0, 'AL-FLXPNT3-OFWHT-RGL-C2', 'P00136', '2', 4, '', '', '', '', '<ul>\r\n	<li><b>The perfect union of cotton linen and viscose that provides you a soft and comfortable feel.</b></li>\r\n	<li><b>The stylish design gives you an edge and makes you stand out in any occasion.</b></li>\r\n	<li><b>The lightweight material gives you breathability to keep your body cool.</b></li>\r\n	<li><b>This product is suitable for both formal events and casual wear, which makes it one of a kind.</b></li>\r\n	<li><b>Color off white.</b></li>\r\n</ul>\r\n', 'c05102aa0d4cb9b27b18e03d83579cd9.jpg', '', '', '', '', '', '', '33,28', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 07:26:51', '2022-12-06 11:56:51'),
(57, '6,1,2', NULL, 'FLEX PANTS 4 PATTERN', 'flex-pants-4-pattern', NULL, 650, 0, 'AL-FLXPNT4-OFWHT-RGL-C2', 'P00137', '2', 4, '', '<p>10</p>\r\n', '', '', '<ul>\r\n	<li><b>The perfect union of cotton linen and viscose that provides you a soft and comfortable feel.</b></li>\r\n	<li><b>The stylish design gives you an edge and makes you stand out in any occasion.</b></li>\r\n	<li><b>The lightweight material gives you breathability to keep your body cool.</b></li>\r\n	<li><b>This product is suitable for both formal events and casual wear, which makes it one of a kind.</b></li>\r\n	<li><b>Color off white.</b></li>\r\n</ul>\r\n', '14a17bbcc916137bc0eed28f5a97fd3f.jpg', '', '', '', '', '', '', NULL, 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 07:35:17', '2022-12-06 12:05:18'),
(58, '6,1,2', NULL, 'FLEX PANTS 5 PATTERN', 'flex-pants-5-pattern', '27', 650, 0, 'AL-FLXPNT5-OFWHT-RGL-C2', 'P00138', '2', 4, '', '', '', '', '<ul>\r\n	<li><b>The perfect union of cotton linen and viscose that provides you a soft and comfortable feel.</b></li>\r\n	<li><b>The stylish design gives you an edge and makes you stand out in any occasion.</b></li>\r\n	<li><b>The lightweight material gives you breathability to keep your body cool.</b></li>\r\n	<li><b>This product is suitable for both formal events and casual wear, which makes it one of a kind.</b></li>\r\n	<li><b>Color off white.</b></li>\r\n</ul>\r\n', '9bf5b852ff8133775028b0735ad03f11.jpg', '', '', '', '', '', '', '33,28', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 07:48:02', '2022-12-06 12:18:02'),
(59, '6,1,2', NULL, 'FLEX PANTS 6 PATTERN', 'flex-pants-6-pattern', '27', 650, 0, 'AL-FLXPNT6-OFWHT-RGL-C2', 'P00139', '2', 4, '', '', '', '', '<ul>\r\n	<li><b>The perfect union of cotton linen and viscose that provides you a soft and comfortable feel.</b></li>\r\n	<li><b>The stylish design gives you an edge and makes you stand out in any occasion.</b></li>\r\n	<li><b>The lightweight material gives you breathability to keep your body cool.</b></li>\r\n	<li><b>This product is suitable for both formal events and casual wear, which makes it one of a kind.</b></li>\r\n	<li><b>Color off white.</b></li>\r\n</ul>\r\n', '8c1b54eb079ecb300b26e3a901702aae.jpg', '', '', '', '', '', '', '33,28', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 07:51:53', '2022-12-06 12:21:53'),
(60, '6,1,2', NULL, 'LIGHT GOLD PANTS', 'light-gold-pants', '28', 849, 0, 'AL-PNTS-LGLD-3SZ-C3', 'P00131', '2', 15, '', '', '', '', '<ul>\r\n	<li><b>A high-quality, comfortable and breathable fabric.</b></li>\r\n	<li><b>The light gold pant is made from a cotton satin and viscose.</b></li>\r\n	<li><b>Material is stretchable and soft.</b></li>\r\n	<li><b>It can be worn for various occasions including office environment, dinner parties or any casual gatherings.</b></li>\r\n</ul>\r\n', '4c51b971a729e684ef2c03af070b9a42.jpg', '', '', '', '', '', '', '27,28', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 07:57:50', '2022-12-06 12:27:50'),
(61, '35,1,20,2', NULL, 'KURTI - WINE', 'wine-kurti', '7', 999, 0, 'AL-KURTI-WNE-J4', 'P0037', '15', 20, '', '', '', '', '<ul>\r\n	<li><b>The stylish and best design pattern.</b></li>\r\n	<li><b>Luxury and soft cotton material.</b></li>\r\n	<li><b>Make you feel happy and comfortable all the time.</b></li>\r\n	<li><b>Ideal for all seasons of the year and for any occasion, festive or formal.</b></li>\r\n</ul>\r\n', 'b41dc2cc78065db613e9b644e9f213e5.jpg', '', '', '', '', '', '', '34', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 08:07:43', '2022-12-06 12:37:43'),
(62, '35,1,20,2', NULL, 'KURTI - CREAM', 'kurti-cream', '24', 1025, 0, 'AL-KURTI-CRM-J4', 'P0038', '16', 19, '', '', '', '', '<ul>\r\n	<li><b>Emblazoned with a simple jhummar design, perfect for any personality and occasion.</b></li>\r\n	<li><b>The fabric bandha jakad is lightweight, breathable, and stretchy. Wearing it guarantees that you\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&#39;ll be comfortable and look effortlessly chic.</b></li>\r\n	<li><b>when you wear this cream kurti and people will compliment you for your effortless style.</b></li>\r\n</ul>\r\n', '75312374507b5d93fa142870275f39c8.jpg', '', '', '', '', '', '', '32', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-06 08:13:58', '2022-12-06 12:43:58'),
(63, '35,1,20,2', NULL, 'KURTI - WHITE', 'kurti---white', '21', 1250, 0, 'AL-KURTI-WHT-J3', 'P0039', '17', 20, '', '', '', '', '<ul>\r\n	<li><b>The beauty of a white leaves print kurti is something that can capture the heart and make one\\\\\\\\\\\\\\\\&#39;s world more beautiful.</b></li>\r\n	<li><b>This fabric is made from modal silk and it\\\\\\\\\\\\\\\\&#39;s very high in quality. You\\\\\\\\\\\\\\\\&#39;ll be proud to wear this piece.</b></li>\r\n</ul>\r\n', 'd152a9dd0899e6c804231146ce524138.jpg', '', '', '', '', '', '', '23', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 08:18:51', '2022-12-06 12:48:51'),
(64, '35,1,20,2', NULL, 'KURTI - LIGHT GREEN', 'kurti---light-green', '29', 1099, 0, 'AL-KURTI-LTGRN-J4', 'P0035', '18', 19, '620412', '', '', '', '<ul>\r\n	<li><b>Our exclusive batik print kurti for you that is comfortable and light weight</b></li>\r\n	<li><b>The attractive colours and patterns will make you feel rich and elegant</b></li>\r\n	<li><b>You can wear it either in casual or formal occasions.</b></li>\r\n	<li><b>COLOUR LIGHT GREEN</b></li>\r\n</ul>\r\n', 'f275360c441186fab4e5cfb4078b5af2.jpg', '', '', '', '', '', '', '35', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-06 08:24:38', '2022-12-06 12:54:38'),
(65, '35,1,20,2', NULL, 'KURTI - PINK', 'kurti---pink', '15', 1050, 0, 'AL-KURTI-PNK-J4', 'P0036', '18', 20, '', '', '', '', '<ul>\r\n	<li><b>Our exclusive batik print kurti for you that is comfortable and light weight</b></li>\r\n	<li><b>The attractive colours and patterns will make you feel rich and elegant</b></li>\r\n	<li><b>You can wear it either in casual or formal occasions.</b></li>\r\n	<li><b>COLOUR PINK</b></li>\r\n</ul>\r\n', '4deeb613bb9d59b5445f720cb02f97b9.jpg', '', '', '', '', '', '', '35', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 08:29:35', '2022-12-06 12:59:35'),
(66, '1,21,2', NULL, '3 PIECE SET - CAMEL', '3-piece-set---camel', '30', 2650, 0, 'AL-SET-CML-I2', 'P0059', '1', 10, '', '', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Pure Georgette and Bottom Viscose Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with V neck.</b></li>\r\n</ul>\r\n', 'fe3c31734f53ab6f5eb9d0bf52872154.jpg', '', '', '', '', '', '', '37,26,36', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 09:55:33', '2022-12-06 14:25:33'),
(67, '1,21,2', NULL, '3 PIECE SET - MAHROON', '3-piece-set---mahroon', '6', 2199, 0, 'AL-SET-MHRN-I4H4', 'P0046', '13', 20, '', '', '', '', '<ul>\r\n	<li><b>A wonderful set of 3 pieces, colourful and lightweight</b></li>\r\n	<li><b>Soft fabric that feels good to the touch</b></li>\r\n	<li><b>Fabulous Mahroon colour that enhances your beauty</b></li>\r\n	<li><b>Wear as casual wear or for formal events</b></li>\r\n</ul>\r\n', '590ce438942c4769cba116e3c1c07653.jpg', '', '', '', '', '', '', '38,23', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 10:02:35', '2022-12-06 14:32:35'),
(68, '1,21,2', NULL, '3 PIECE SET - AQUA BLUE', '3-piece-set---aqua-blue', '49', 2750, 0, 'AL-SET-ABLUE-I1', 'P0065', '1', 10, '', '', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Pure Georgette and Bottom Viscose Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with V neck.</b></li>\r\n</ul>\r\n', '4ef24999961a36c710f475c836ca059b.jpg', '', '', '', '', '', '', '37,26,36', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-06 10:12:18', '2022-12-06 14:42:18'),
(69, '1,21,2', NULL, '3 PIECE SET - GREEN YELLOW', '3-piece-set---green-yellow', '31', 2299, 0, 'AL-SET-GRNYLW-I4', 'P0045', '19', 20, '', '', '', '', '<ul>\r\n	<li><b>3-piece set with beautiful round neck handwork</b></li>\r\n	<li><b>Comfortable and stretchable chanderi silk fabric</b></li>\r\n	<li><b>Great color combination of yellow and green</b></li>\r\n	<li><b>Suitable for both formal and casual occasions.</b></li>\r\n</ul>\r\n', 'a54f5f4fafae028d792fd5111188ac16.jpg', '', '', '', '', '', '', '4', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 10:26:17', '2022-12-06 14:56:17'),
(70, '1,21,2', NULL, '3 PIECE SET - PINK', '3-piece-set---pink', '15', 2699, 0, 'AL-SET-PNK-H2', 'P0063', '1', 10, '', '<p>Array</p>\r\n', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Pure Georgette and Bottom Viscose Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with V neck.</b></li>\r\n</ul>\r\n', '9afb88cb37691e849dabab0ae40b26a9.jpg', '', '', '', '', '', '', '37,26,36', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 10:54:44', '2022-12-06 15:24:44'),
(71, '1,21,2', NULL, '3 PIECE SET - YELLOW', '3-piece-set-yellow', '16', 2699, 0, 'AL-SET-YLW-H2', 'P0062', '1', 10, '', '<p>Array</p>\r\n', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Pure Georgette and Bottom Viscose Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with V neck.</b></li>\r\n</ul>\r\n', 'e0feacf0547488e0607ea753819c3089.jpg', '', '', '', '', '', '', '37,26,36', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 11:00:54', '2022-12-06 15:30:54'),
(72, '12,1', NULL, 'WHITE BUTTERFLY ABAYA HAND WORK', 'white-butterfly-abaya-hand-work', '21', 2250, 0, 'AL-BT-ABY-WHT-RGL-B2', 'P0028', '5', 5, '', '<p>Array</p>\r\n', '', '', '<ul>\r\n	<li><b>Magnificent, high-quality fabric that is light and breathable.</b></li>\r\n	<li><b>2-piece butterfly abaya with shaila design with beautiful, intricate detailing on the front of the abaya.</b></li>\r\n	<li><b>Closed in the front, shoulder zippers for easy wear with a luxurious elastic sleeve.</b></li>\r\n</ul>\r\n', '474971c0d92a322df30c6399f9c33f54.jpg', '', '', '', '', '', '', '6', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 11:06:59', '2022-12-06 15:36:59'),
(73, '12,1', NULL, 'MODEST ABAYA STONE WORK - BISCUIT', 'modest-abaya-stone-work-biscuit', '33', 2050, 0, 'AL-ABY-BSCT-RGL-A2', 'P0023', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>As a Muslim woman, you are always looking for an outfit that is both modest and fashionable.</b></li>\r\n	<li><b>The 2-piece abaya with shaila design will make you stand out in the crowd. It also makes it easy for you to manage your hijab easily with its front open style.</b></li>\r\n	<li><b>The light biscuit colour coupled with the stone work on the front of the jacket gives this abaya a beautiful look. You will be stunned with how stunning.</b></li>\r\n</ul>\r\n', 'b67024ed2f17a168476074da9f5d655f.jpg', '', '', '', '', '', '', '8', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 11:13:14', '2022-12-06 15:43:14'),
(74, '19,23,1', NULL, 'LUXURY HIJAB SHIMMER PLAIN - DARK GOLD', 'luxury-hijab-shimmer-plain-dark-gold', '19', 500, 0, 'AL-LUXHJB-DGLDN-G3', 'P0093', '8', 5, '', '', '', '', '<ul>\r\n	<li><b>Luxury shimmer plain hijab with a fancy shimmering appearance.</b></li>\r\n	<li><b>Fabric content of the hijab is just lightweight impt fabric, also contains a touch of cotton that results in a softer and more comfortable feel.</b></li>\r\n	<li><b>The size of the hijab can be adjusted to 175 cm long and 70 cm wide.</b></li>\r\n	<li><b>Made of high-quality material to ensure you feel comfortable and look rich.</b></li>\r\n</ul>\r\n', 'a195dccad398c025fd91c4c14f8d29a5.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-06 11:22:41', '2022-12-06 15:52:41'),
(75, '19,1,23,16', NULL, 'LUXURY HIJAB SHIMMER PRINT - PEACH', 'luxury-hijab-shimmer-print-peach', '26', 550, 0, 'AL-LUXHJB-PNT-PCH-G3', 'P00100', '8', 5, '', '', '', '', '', 'edd8f3358573eea0b50072588f7ee9b0.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '      ', '2022-12-06 11:27:14', '2022-12-06 15:57:14'),
(76, '6,1,2', NULL, 'DARK GOLD PANTS', 'dark-gold-pants', '19', 849, 0, 'AL-PNTS-DGLD-3SZ-C3', 'P00130', '2', 15, '', '', '', '', '<ul>\r\n	<li><b>A high-quality, comfortable and breathable fabric.</b></li>\r\n	<li><b>The dark gold pant is made from a cotton satin and viscose.</b></li>\r\n	<li><b>Material is stretchable and soft.</b></li>\r\n	<li><b>It can be worn for various occasions including office environment, dinner parties or any casual gatherings.</b></li>\r\n</ul>\r\n', 'f1fc052ea86ce2150bcef0dea3c372f2.jpg', '', '', '', '', '', '', '27,28', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-06 11:32:16', '2022-12-06 16:02:16'),
(77, '35,1,20,2', NULL, 'KURTI - DARK GREEN', 'kurti---dark-green', '43', 1099, 0, 'AL-KURTI-DGRN-J4', 'P0034', '10', 20, '', '', '', '', '<ul>\r\n	<li><b>The beauty of a dark green batik work kurti is something that can capture the heart and make one\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&#39;s world more beautiful.</b></li>\r\n	<li><b>This fabric is made from modal silk and it\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&#39;s very high in quality. You\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&#39;ll be proud to wear this piece.</b></li>\r\n</ul>\r\n', 'c33b08cebe3162f640fb0fc1147c5f13.jpg', '', '', '', '', '', '', '23', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(78, '1,21,2', NULL, '3 PIECE SET - BOTTLE GREEN 2', '3-piece-set---bottle-green-2', '4', 2600, 0, 'AL-SET-BGRN-I2H2', 'P0061', '1', 10, '', '', '', '', '<ul>\r\n	<li><b>Wear the traditional and traditional Pakistani dress for your special day.</b></li>\r\n	<li><b>Made of high-quality fabric that has Top Pure Georgette and Bottom Viscose Santoon Dupatta Nazmin.</b></li>\r\n	<li><b>It is important to choose a wedding and party dress that reflects your personality and your style</b></li>\r\n	<li><b>Beautiful and elegant embroidery work with V neck.</b></li>\r\n</ul>\r\n', 'c053a81fa94ed1fcc4093123c2337bb7.jpg', '', '', '', '', '', '', '37,26,36', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-07 01:19:31', '2022-12-07 17:49:31'),
(79, '1,21,2', NULL, '3 PIECE SET - DARK GREY', '3-piece-set---dark-grey', '3', 2149, 0, 'AL-SET-DGREY-I3', 'P0052', '1', 4, '', '', '', '', '<ul>\r\n	<li><b>Get this 3-piece Pakistani outfit for a complete look that\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&#39;s as refreshing as it is beautiful.</b></li>\r\n	<li><b>Premium cotton lawn provides a soft touch for an enhanced sense of comfort and style.</b></li>\r\n	<li><b>The chiffon dupatta with beautiful embroidery work over a printed lawn back and front both.</b></li>\r\n</ul>\r\n', 'b3733cc58b3bedb45cfd2724183eb374.jpg', '', '', '', '', '', '', '2', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-07 01:31:34', '2022-12-07 18:01:34');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `slug`, `color`, `regular_price`, `sale_price`, `sku`, `product_code`, `style_id`, `stock`, `hsn_code`, `custom_size`, `short_description`, `additional_info`, `description`, `photo`, `alt`, `banner_photo`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `fabric_id`, `product_type`, `products_attributes_id`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(80, '1,21,2', NULL, '3 PIECE SET - PINK 2', '3-piece-set-pink-2', '15', 2149, 0, 'AL-SET-PNK-I3', 'P0053', '1', 4, '', '', '', '', '<ul>\r\n	<li><b>Get this 3-piece Pakistani outfit for a complete look that\\\\\\\\&#39;s as refreshing as it is beautiful.</b></li>\r\n	<li><b>Premium cotton lawn provides a soft touch for an enhanced sense of comfort and style.</b></li>\r\n	<li><b>The chiffon dupatta with beautiful embroidery work over a printed lawn back and front both.</b></li>\r\n</ul>\r\n', '8675a26f81b48f075b6eb1cad01578f4.jpg', '', '', '', '', '', '', '2', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-07 01:41:53', '2022-12-07 18:11:53'),
(81, '1,21,2', NULL, '3 PIECE SET - LIGHT GREY', '3-piece-set-light-grey', '25', 2149, 0, 'AL-SET-LGREY-H4', 'P0048', '1', 4, '', '', '', '', '<ul>\r\n	<li><b>Get this 3-piece Pakistani outfit for a complete look that\\\\\\\\\\\\\\\\&#39;s as refreshing as it is beautiful.</b></li>\r\n	<li><b>Premium cotton lawn provides a soft touch for an enhanced sense of comfort and style.</b></li>\r\n	<li><b>The chiffon dupatta with beautiful embroidery work over a printed lawn back and front both.</b></li>\r\n</ul>\r\n', '29b1dce413a8b712c241400078b51102.jpg', '', '', '', '', '', '', '2', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-07 01:45:50', '2022-12-07 18:15:50'),
(82, '6,1,2', NULL, 'CHIKEN SEQUENCE PLAZO - MAHROON', 'chiken-sequence-plazo-mahroon', '6', 749, 0, 'AL-PLZ-CKN-MHRN-RGL-D1', 'P00162', '2', 5, '', '', '', '', '<ul>\r\n	<li><b>It\\\\\\\\&#39;s no surprise because every Indian woman love to wear by Chikens.</b></li>\r\n	<li><b>Crisp weave, so comfortable to wear with heavy rayon viscose fabric.</b></li>\r\n	<li><b>The sequenced pattern infuses a dash of style and culture.</b></li>\r\n	<li><b>Beautiful embroidery work carries the entire traditional vibe.</b></li>\r\n</ul>\r\n', 'ddca9bd21350c8c18bea11acc9a4ee4d.jpg', '', '', '', '', '', '', '3', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-07 01:52:26', '2022-12-07 18:22:26'),
(83, '6,1,2', NULL, 'CHIKEN SEQUENCE PLAZO - RED', 'chiken-sequence-plazo---red', '23', 749, 0, 'AL-PLZ-CKN-RED-RGL-D1', 'P00161', '2', 5, '', '', '', '', '<ul>\r\n	<li><b>It\\\\\\\\&#39;s no surprise because every Indian woman love to wear by Chikens.</b></li>\r\n	<li><b>Crisp weave, so comfortable to wear with heavy rayon viscose fabric.</b></li>\r\n	<li><b>The sequenced pattern infuses a dash of style and culture.</b></li>\r\n	<li><b>Beautiful embroidery work carries the entire traditional vibe.</b></li>\r\n</ul>\r\n', '920cc4510c4834344e60046ee94abbef.jpg', '', '', '', '', '', '', '3', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-07 01:58:34', '2022-12-07 18:28:34'),
(84, '6,1,2', NULL, 'CHIKEN SEQUENCE PLAZO - CREAM', 'chiken-sequence-plazo---cream', '24', 749, 0, 'AL-PLZ-CKN-CRM-RGL-D1', 'P00159', '2', 6, '', '', '', '', '<ul>\r\n	<li><b>It\\\\\\\\&#39;s no surprise because every Indian woman love to wear by Chikens.</b></li>\r\n	<li><b>Crisp weave, so comfortable to wear with heavy rayon viscose fabric.</b></li>\r\n	<li><b>The sequenced pattern infuses a dash of style and culture.</b></li>\r\n	<li><b>Beautiful embroidery work carries the entire traditional vibe.</b></li>\r\n</ul>\r\n', '72c8dc2cac3615325813b8bf27ac7d18.jpg', '', '', '', '', '', '', '3', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-07 02:02:47', '2022-12-07 18:32:47'),
(85, '6,1,2', NULL, 'CHIKEN SEQUENCE PLAZO - SKIN ', 'chiken-sequence-plazo---skin', '22', 749, 0, 'AL-PLZ-CKN-SKIN-RGL-D1', 'P00164', '2', 5, '', '', '', '', '<ul>\r\n	<li><b>It\\\\\\\\&#39;s no surprise because every Indian woman love to wear by Chikens.</b></li>\r\n	<li><b>Crisp weave, so comfortable to wear with heavy rayon viscose fabric.</b></li>\r\n	<li><b>The sequenced pattern infuses a dash of style and culture.</b></li>\r\n	<li><b>Beautiful embroidery work carries the entire traditional vibe.</b></li>\r\n</ul>\r\n', '92b3695ceb03b2add7df3478f0ab3e4e.jpg', '', '', '', '', '', '', '3', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-07 02:06:25', '2022-12-07 18:36:25'),
(86, '6,1,2', NULL, 'CHIKEN SEQUENCE PLAZO - MUSTARD', 'chiken-sequence-plazo-mustard', '12', 749, 0, 'AL-PLZ-CKN-MSTRD-RGL-D1', 'P00163', '2', 2, '', '', '', '', '<ul>\r\n	<li><b>It\\\\\\\\&#39;s no surprise because every Indian woman love to wear by Chikens.</b></li>\r\n	<li><b>Crisp weave, so comfortable to wear with heavy rayon viscose fabric.</b></li>\r\n	<li><b>The sequenced pattern infuses a dash of style and culture.</b></li>\r\n	<li><b>Beautiful embroidery work carries the entire traditional vibe.</b></li>\r\n</ul>\r\n', '0f0203a1aa0bafc32a2c67319a334d55.jpg', '', '', '', '', '', '', '3', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-07 02:10:13', '2022-12-07 18:40:13'),
(87, '6,1,2', NULL, 'PLAZO CHECK - PINK', 'plazo-check---pink', '15', 450, 0, 'AL-PLZ-CHK-PNK-RGL-D2', 'P00146', '2', 6, '', '', '', '', '<ul>\r\n	<li><b>Get your favourite check style plazo, with comfortable heavy rayon fabric and breathable fabric.</b></li>\r\n	<li><b>Excellent quality fabric for both casual and formal wear.</b></li>\r\n	<li><b>It is a must have for you!</b></li>\r\n</ul>\r\n', '3d478610fd28aa65f81de9a7316957cc.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-07 02:14:45', '2022-12-07 18:44:45'),
(88, '6,1,2', NULL, 'PLAZO CHECK - YELLOW', 'plazo-check-yellow', '16', 450, 0, 'AL-PLZ-CHK-YLW-RGL-D2', 'P00147', '2', 5, '', '', '', '', '<ul>\r\n	<li><b>Get your favourite check style plazo, with comfortable heavy rayon fabric and breathable fabric.</b></li>\r\n	<li><b>Excellent quality fabric for both casual and formal wear.</b></li>\r\n	<li><b>It is a must have for you!</b></li>\r\n</ul>\r\n', 'd858f1d7381740656b02889a0da34eeb.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-07 02:19:04', '2022-12-07 18:49:04'),
(89, '6,1,2', NULL, 'PLAZO CHECK - BEIGE', 'plazo-check---beige', '17', 450, 0, 'AL-PLZ-CHK-BEG-RGL-D2', 'P00149', '2', 5, '', '', '', '', '<ul>\r\n	<li><b>Get your favourite check style plazo, with comfortable heavy rayon fabric and breathable fabric.</b></li>\r\n	<li><b>Excellent quality fabric for both casual and formal wear.</b></li>\r\n	<li><b>It is a must have for you!</b></li>\r\n</ul>\r\n', '97ef7733a1977c66c18dbe9853db0454.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-08 05:40:45', '2022-12-08 10:10:45'),
(90, '6,1,2', NULL, 'PLAZO CHECK - GREY', 'plazo-check-grey', '18', 450, 0, 'AL-PLZ-CHK-GREY-RGL-D2', 'P00150', '2', 5, '', '', '', '', '<ul>\r\n	<li><b>Get your favourite check style plazo, with comfortable heavy rayon fabric and breathable fabric.</b></li>\r\n	<li><b>Excellent quality fabric for both casual and formal wear.</b></li>\r\n	<li><b>It is a must have for you!</b></li>\r\n</ul>\r\n', 'cf40b56f988bb210f87e7b7c23ed2635.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-08 05:44:11', '2022-12-08 10:14:11'),
(91, '6,1,2', NULL, 'SHIMMER PANTS - FAWN BEIGE', 'shimmer-pants---fawn-beige', '13', 599, 0, 'AL-SMRPNTS-FWN-RGL-C1', 'P00142', '2', 11, '', '', '', '', '<ul>\r\n	<li><b>The SHIMMER PANT with pocket will feel you great.</b></li>\r\n	<li><b>Stretchable shimmer fabric will keep you feeling comfortable.</b></li>\r\n	<li><b>The sitting and walking comfort is unbeatable.</b></li>\r\n	<li><b>Wear these great SHIMMER PANTS both to work and to the party for an evening out on the town, or even to college for a more comfortable feel.</b></li>\r\n</ul>\r\n', '8a67b31a8b58892382eb249447cc093f.jpg', '', '', '', '', '', '', '14', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-08 05:54:17', '2022-12-08 10:24:17'),
(92, '6,1,2', NULL, 'SHIMMER PANTS - DARK GOLD', 'shimmer-pants-dark-gold', '19', 599, 0, 'AL-SMRPNTS-DGLD-RGL-C1', 'P00144', '2', 7, '', '', '', '', '<ul>\r\n	<li><b>The SHIMMER PANT with pocket will feel you great.</b></li>\r\n	<li><b>Stretchable shimmer fabric will keep you feeling comfortable.</b></li>\r\n	<li><b>The sitting and walking comfort is unbeatable.</b></li>\r\n	<li><b>Wear these great SHIMMER PANTS both to work and to the party for an evening out on the town, or even to college for a more comfortable feel.</b></li>\r\n</ul>\r\n', 'dd141eea1075ad83f8d9d321a932e86e.jpg', '', '', '', '', '', '', '14', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-08 06:14:26', '2022-12-08 10:44:26'),
(93, '6,1,2', NULL, 'SHIMMER PANTS - WHITE', 'shimmer-pants-white', '21', 599, 0, 'AL-SMRPNTS-WHT-RGL-C1', 'P00140', '2', 9, '', '', '', '', '<ul>\r\n	<li><b>The SHIMMER PANT with pocket will feel you great.</b></li>\r\n	<li><b>Stretchable shimmer fabric will keep you feeling comfortable.</b></li>\r\n	<li><b>The sitting and walking comfort is unbeatable.</b></li>\r\n	<li><b>Wear these great SHIMMER PANTS both to work and to the party for an evening out on the town, or even to college for a more comfortable feel.</b></li>\r\n</ul>\r\n', '6e5bfcd4b7f3824dae2f022e0048ef82.jpg', '', '', '', '', '', '', '14', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-08 06:18:10', '2022-12-08 10:48:10'),
(94, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - GOLD', 'premium-leggings-gold', '11', 499, 0, 'AL-LGNS-GLD-RGL-D4', 'P00128', '2', 5, '', '', '', '', '<ul>\r\n	<li><b>Superb premium leggings for you to feel extra comfortable.</b></li>\r\n	<li><b>Great quality premium viscose material is breathable and you can wear it anywhere, from college, office also parties.</b></li>\r\n	<li><b>Make you feel very comfortable with this high-quality fabric!</b></li>\r\n</ul>\r\n', '10d0dc4c91d4be35c381606149c92bc1.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-08 06:28:20', '2022-12-08 10:58:20'),
(95, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - MAGENTA PINK', 'premium-leggings-magenta-pink', '20', 499, 0, 'AL-LGNS-MGNTPNK-RGL-D4', 'P00127', '2', 5, '', '', '', '', '<ul>\r\n	<li><b>Superb premium leggings for you to feel extra comfortable.</b></li>\r\n	<li><b>Great quality premium viscose material is breathable and you can wear it anywhere, from college, office also parties.</b></li>\r\n	<li><b>Make you feel very comfortable with this high-quality fabric!</b></li>\r\n</ul>\r\n', 'e8467c364331e0c1ab8946e1e1a5e92c.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-08 06:31:32', '2022-12-08 11:01:32'),
(96, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - PINK', 'premium-leggings-pink', '15', 499, 0, 'AL-LGNS-PNK-RGL-C4', 'P00118', '2', 7, '', '', '', '', '<ul>\r\n	<li><b>Superb premium leggings for you to feel extra comfortable.</b></li>\r\n	<li><b>Great quality premium viscose material is breathable and you can wear it anywhere, from college, office also parties.</b></li>\r\n	<li><b>Make you feel very comfortable with this high-quality fabric!</b></li>\r\n</ul>\r\n', '1e637fcae8963084f67b9088e8b34ef7.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-08 06:35:02', '2022-12-08 11:05:02'),
(97, '12,1', NULL, 'MODEST ABAYA STONE WORK - NAVY BLUE', 'modest-abaya-stone-work-navy-blue', '2', 2050, 0, 'AL-ABY-NBLU-RGL-A2', 'P0024', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>As a Muslim woman, you are always looking for an outfit that is both modest and fashionable.</b></li>\r\n	<li><b>The 2-piece abaya with shaila design will make you stand out in the crowd. It also makes it easy for you to manage your hijab easily with its front open style.</b></li>\r\n	<li><b>The light biscuit colour coupled with the stone work on the front of the jacket gives this abaya a beautiful look. You will be stunned with how stunning.</b></li>\r\n</ul>\r\n', '4ac751bce38ab865f128b175e42dd262.jpg', '', '', '', '', '', '', '8', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-08 06:43:51', '2022-12-08 11:13:51'),
(98, '12,1', NULL, 'ABAYA HAND WORK STONE - BLACK', 'abaya-hand-work-stone-black4', '9', 2100, 0, 'AL-ABY-BLK-RGL-B4', 'P0008', '6', 8, '', '', '', '', '<ul>\r\n	<li><b>Absolutely stunning 2 piece black abaya with shaila.</b></li>\r\n	<li><b>The design is such that it looks elegant and glamorous.</b></li>\r\n	<li><b>This is a beautiful and elegant looking abaya which will enhance your beauty while giving you a feel of comfort.</b></li>\r\n	<li><b>Beautiful hand work.</b></li>\r\n</ul>\r\n', '258e4baea77f9b2af979af618b4aa594.jpg', '', '', '', '', '', '', '9', 'Variation', '2,1', 0, '1', '', '', '  ', '2022-12-08 06:49:19', '2022-12-08 11:19:19'),
(99, '12,1', NULL, 'KAFTAN - BLACK + GREEN', 'kaftan-black-green', '10', 1950, 0, 'AL-ABY-BL/GR-RGL-A4', 'P0001', '6', 5, '', '', '', '', '<ul>\r\n	<li><b>this kaftan is made of beautiful imported cy crush fabric. Bringing to you a unique, rich and elegant style without the worries of an expensive price tag.</b></li>\r\n	<li><b>The front is open with a beautiful colour combination. A beautiful 2-piece kaftan with shaila that completes your outfit!</b></li>\r\n	<li><b>You\\\\\\\\\\\\\\\\&#39;ll feel rich and full of life in this exquisitely designed kaftan.</b></li>\r\n</ul>\r\n', '801c1187684b5b08029414f27405d671.jpg', '', '', '', '', '', '', '10', 'Variation', '2,1', 0, '1', '', '', '   ', '2022-12-08 06:52:49', '2022-12-08 11:22:49'),
(100, '19,23,1', NULL, 'LUXURY HIJAB STONE WORK - WINE', 'luxury-hijab-stone-work-wine', '7', 649, 0, 'AL-LUXHJB-WINE-E3', 'P0073', NULL, 5, '', '', '', '', '<ul>\r\n	<li><b>Beautiful hijab with luxurious party design.</b></li>\r\n	<li><b>Made from imported cotton mix fabric with high quality polyster, giving you stunningly comfortable and fashionable hijab.</b></li>\r\n	<li><b>Size is 180 cm x 70 cm which fits for most women.</b></li>\r\n</ul>\r\n', 'e623c84dad7dd77b61d2e5dd272f7af7.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-08 07:15:17', '2022-12-08 11:45:17'),
(101, '35,1,20,2', NULL, 'KURTI - WINE', 'kurti-wine', '7', 1150, 0, 'AL-KURTI-WNE-J3', 'P0040', '3', 25, '', '', '', '', '<ul>\r\n	<li><b>A perfect piece for the fashionable crowd.</b></li>\r\n	<li><b>You get to wear flower print all year round!</b></li>\r\n	<li><b>chanderi silk fabric is really light and comfy, so you can wear it on any occasion from casual to formal.</b></li>\r\n	<li><b>Sleeves inside kurti.</b></li>\r\n</ul>\r\n', '2a4cac8ec92eba30027370792cc1b8ec.jpg', '', '', '', '', '', '', '4', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-08 07:34:39', '2022-12-08 12:04:39'),
(102, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL BLUE 1', 'premium-velvet-rugs---royal-blue-1', '38', 2699, 0, 'AL-PRUG-VLVT-RYBLE-F3', 'P00170', '9', 22, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel.</b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '7254d9c522bf2b894ab6e7cf15127614.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '      ', '2022-12-08 11:44:18', '2022-12-08 16:14:18'),
(103, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL BLUE 2', 'premium-velvet-rugs---royal-blue-2', '38', 2599, 0, 'AL-PRUG-VLVT-RYBLE-H1', 'P00180', '9', 15, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel. </b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '6e95ca822a5f8e423ebda0b6a375c407.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-08 11:50:33', '2022-12-08 16:20:33'),
(104, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL BLUE 3', 'premium-velvet-rugs---royal-blue-3', '38', 2650, 0, 'AL-PRUG-VLVT-RYBLE-B1', 'P00173', '9', 20, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel.</b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '77783e1f8a5a0b1a93626ee82f95d7a3.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-08 11:54:28', '2022-12-08 16:24:28'),
(105, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL GREY 1', 'premium-velvet-rugs---royal-grey-1', '44', 2699, 0, 'AL-PRUG-VLVT-RYGRY-F4', 'P00168', '9', 14, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel. </b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', 'a861999dda518428009ab24b95a7a486.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-08 11:59:15', '2022-12-08 16:29:15'),
(106, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL GREY 2', 'premium-velvet-rugs---royal-grey-2', '44', 2599, 0, 'AL-PRUG-VLVT-RYGRY-H1', 'P00179', '9', 15, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel.</b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '0869ae26fbdcc19e972da9d6985273d1.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-08 12:04:39', '2022-12-08 16:34:39'),
(107, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL GREY 3', 'premium-velvet-rugs---royal-grey-3', '44', 2650, 0, 'AL-PRUG-VLVT-RYGRY-B1', 'P00171', NULL, 15, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel. </b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '87e53f8bef840d231955373d61bb6ab1.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-08 12:07:51', '2022-12-08 16:37:51'),
(108, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL BROWN 1', 'premium-velvet-rugs---royal-brown-1', '47', 2650, 0, 'AL-PRUG-VLVT-RYBWN-B1', 'P00172', '9', 10, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel. </b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '6e785147c36119f61bb6d1858d7d0abe.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-08 12:12:57', '2022-12-08 16:42:57'),
(109, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL PINK 1', 'premium-velvet-rugs---royal-pink-1', '45', 2699, 0, 'AL-PRUG-VLVT-RYPNK-F4', 'P00169', '9', 20, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel.</b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '9a474ae861e9429ebf4d1de3686bb320.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-08 12:38:28', '2022-12-08 17:08:28'),
(110, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL PINK', 'premium-velvet-rugs---royal-pink-2', '45', 2599, 0, 'AL-PRUG-VLVT-RYPNK-H1', 'P00176', '9', 20, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel. </b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '8f3b64a3ddd66101908c54a430ff0fa5.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-08 12:43:18', '2022-12-08 17:13:18'),
(111, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL GREEN', 'premium-velvet-rugs---royal-green-1', '46', 2650, 0, 'AL-PRUG-VLVT-RYGRN-B1', 'P00174', '9', 15, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel.</b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', 'eb9a9264dfaeb881db1ea553a5aca47e.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-08 12:47:08', '2022-12-08 17:17:08'),
(112, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL GREEN', 'premium-velvet-rugs---royal-green-2', '46', 2599, 0, 'AL-PRUG-VLVT-RYGRN-H1', 'P00177', '9', 15, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel.</b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', 'd53aa5cda2e556ca6b45d8feaaf9f59b.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2022-12-08 12:52:03', '2022-12-08 17:22:03'),
(113, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL BROWN', 'premium-velvet-rugs---royal-brown-2', '47', 2699, 0, 'AL-PRUG-VLVT-RYBWN-F4', 'P00165', '9', 5, '', '', '', '', '<ul>\r\n	<li><b>One of the highest quality luxury prayer rugs, made with the high-quality dense velvet materials.</b></li>\r\n	<li><b>Non-slip backing for better grip on the floor during prayer.</b></li>\r\n	<li><b>It provides a relaxing environment for your mind to be at peace during sajjadah.</b></li>\r\n	<li><b>The thick velvety feel ensures comfort and peace of mind during prayer.</b></li>\r\n	<li><b>Luxury design with a high-quality feel.</b></li>\r\n	<li><b>Durable and easy to clean.</b></li>\r\n</ul>\r\n', '3c4508545df937e80eb19bb1dcd7b22b.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2022-12-08 12:56:08', '2022-12-08 17:26:08');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `slug`, `color`, `regular_price`, `sale_price`, `sku`, `product_code`, `style_id`, `stock`, `hsn_code`, `custom_size`, `short_description`, `additional_info`, `description`, `photo`, `alt`, `banner_photo`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `fabric_id`, `product_type`, `products_attributes_id`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(114, '1,21,2', NULL, '3 PIECE SET - SKY BLUE', '3-piece-set--sky-blue', '5', 2650, 0, 'AL-SET-SKYBL-H3', 'P0058', '1', 10, '', '', '', '', '<p><meta charset=\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"utf-8\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" /></p>\r\n\r\n<ul>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-aba20adc-7fff-60d3-8dec-96223f1a92ec\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Wear the traditional and traditional Pakistani dress for your special day.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-aba20adc-7fff-60d3-8dec-96223f1a92ec\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Made of high-quality fabric that has Top Pure Georgette and Bottom Viscose Santoon Dupatta Nazmin.</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-aba20adc-7fff-60d3-8dec-96223f1a92ec\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">It is important to choose a wedding and party dress that reflects your personality and your style</b></p>\r\n	</li>\r\n	<li aria-level=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;1\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">\r\n	<p dir=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;ltr\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" role=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;presentation\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\"><b id=\\\"\\\\&quot;\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;docs-internal-guid-aba20adc-7fff-60d3-8dec-96223f1a92ec\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\&quot;\\\\\\\\\\\\\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\">Beautiful and elegant embroidery work with V neck.</b></p>\r\n	</li>\r\n</ul>\r\n', '6c8d12ec8d59ee4bb3b59a8e08fa3411.jpg', '', '', '', '', '', '', '19,26,18', 'Variation', '2,1', 0, '1', '', '', '        ', '2022-12-09 11:29:11', '2022-12-09 15:59:11'),
(115, '12,1', NULL, 'ABAYA WITH BUTTON - GREY', 'abaya-with-button---grey', '18', 1450, 0, 'AL-ABY-JGR-GREY-RGL-A3', 'P0013', '6', 5, '', '', '', '', '<p>The Grey abaya with button is minimal yet pleasing for casual wear. The regular fit abaya with button has a simple neck design. It is a perfect wardrobe piece who appreciate wearing a designer style. The exclusive abaya has full sleeves, a collar neck with beautiful matching color handmade front open buttons.</p>\r\n', 'e0fc91ec8117b0b1481a388d0bd13ad1.jpg', '', '', '', '', '', '', '7', 'Variation', '2,1', 0, '1', '', '', '      ', '2023-01-24 08:53:35', '2023-01-24 01:53:36'),
(116, '12,1', NULL, 'JILBAB WITH NOSE PIECE - CAMEL', 'jilbab-with-nose-piece---camel', '30', 1999, 0, 'AL-JIL-CML-RGL-B3', 'P0020', '11', 5, '', '', '', '', '<p>This Jilbab with nose piece is made with pure and premium quality cycrush fabric. The convenient loose-fitting design is a camel in color. Helps you to move with ease and comfort - no matter where you are or where you go. This jilbab 3 pcs covers or opens your face using the ribbons inside the Khimar.</p>\r\n', 'de8b11dc001a9bde2daaa64dedb393a3.jpg', '', '', '', '', '', '', '6', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-24 09:03:13', '2023-01-24 02:03:13'),
(117, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - PINK', 'luxury-hijab-stone-work---pink', '15', 649, 0, 'AL-LUXHJB-PNK-E4', 'P0066', '8', 5, '', '', '', '', '<p>Introducing the Luxury hijab stone work for comfortable wear. It is a perfect fit for party wear hijab available in pink color. The finest quality impt cotton+polyster can be worn for any function.</p>\r\n', '7314286e48c3236ff9f37aeb94482680.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-24 09:13:06', '2023-01-24 02:13:06'),
(118, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PLAIN - GOLD', 'luxury-hijab-shimmer-plain---gold', '11', 500, 0, 'AL-LUXHJB-GLD-G4', 'P0086', '8', 5, '', '', '', '', '<p>Establishing to you the Luxury hijab shimmer plain for women. Also, is perfect for a party wearing a hijab. It gives a good fall to the garment. Made from premium quality import cotton satin. This gold hijab is comfy and light-headed.</p>\r\n', '9f2875c003207d476128ff104b3243bc.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-24 09:17:19', '2023-01-24 02:17:19'),
(119, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - WHITE', 'luxury-hijab-stone-work---white', '21', 649, 0, 'AL-LUXHJB-WHT-E4', 'P0067', '8', 5, '', '', '', '', '<p>This Luxury hijab stonework is the perfect dress. Hijab is made of 100% pure and premium quality impt cotton+polyster. It is best suited for party wear hijab. This white-colored hijab is extremely soft, light in weight, and simple to care for. It gives the garment a nice fall.</p>\r\n', 'fd9b5f6b31fdaf1b23d6356312ce6814.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-24 09:23:05', '2023-01-24 02:23:05');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `slug`, `color`, `regular_price`, `sale_price`, `sku`, `product_code`, `style_id`, `stock`, `hsn_code`, `custom_size`, `short_description`, `additional_info`, `description`, `photo`, `alt`, `banner_photo`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `fabric_id`, `product_type`, `products_attributes_id`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(120, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - SKIN', 'luxury-hijab-stone-work---skin', '22', 649, 0, 'AL-LUXHJB-SKN-E4', 'P0069', '8', 5, '', '', '', '', '<p>Introducing the new Luxury hijab stone work for women. Discover our stylish and comfortable party wear hijab. This is made from superior quality impt cotton+polyster. This skin-colored luxury hijab is perfect for bridal or occasional wear.</p>\r\n', '5cef1ebf111d174ddb36eed4b0002150.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-24 09:42:55', '2023-01-24 02:42:55'),
(121, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - CREAM', 'luxury-hijab-shimmer-print---cream', '24', 550, 0, 'AL-LUXHJB-PNT-CRM-G3', 'P0094', '8', 5, '', '', '', '', '<p>The Luxury hijab shimmer print is lavished light in weight and seamless cloth. Cream-colored hijab has ultra &ndash; a soft, rich, and elegant finish made from impt cotton satin. This luxury cloth is perfect for party wear hijab.</p>\r\n', 'cce2a6dd2f323839da3cefadfe9a94ae.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-24 09:46:15', '2023-01-24 02:46:15'),
(122, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - PEACH', 'luxury-hijab-stone-work---peach', '26', 600, 0, 'AL-LUXHJB-PCH-E2', 'P0077', '8', 3, '', '', '', '', '<p>This luxury hijab stonework when draped gorgeously around your head or shoulders gives a unique look. The peach-colored hijab is popular and extremely easy to put on. Is made from imported lycra. It is a fantastic gift for anyone interested in fashion and can be used at a party wearing a hijab.</p>\r\n', '6d1594ae6c4d323f6ecd82846d038b6d.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-24 11:08:21', '2023-01-24 04:08:21'),
(123, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK _ WHITE', 'luxury-hijab-stone-work--white', '21', 600, 0, 'AL-LUXHJB-WHT-E2', 'P0079', '8', 3, '', '', '', '', '<p>The Luxury hijab stonework has been stitched and customized uniquely. This hijab is best suited for party wear hijab. It is woven from exclusive quality imported lycra. This white stone hijab is a modest fashion category.</p>\r\n', 'ff256c6c8aebae9fc53899e3ed633924.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', '   ', '2023-01-24 11:55:27', '2023-01-24 04:55:27'),
(124, '24,19,1', NULL, 'HIJAB FLOWER PRINT - PEACH BLACK', 'hijab-flower-print---peach-black', '50', 449, 0, 'AL-DLYHJB-PCH/BLK-G2', 'P00109', '12', 5, '', '', '', '', '<p>Introducing Hijab flower print is a stunning go-to wear hijab. Made up of pure cotton shimmer. This daily wear of hijab is inspired by a nature theme. If you are looking for a pleasant, upbeat, and vogue-type hijab this peach black is a perfect hijab to purchase.</p>\r\n', '45c38bf76ad6124f0fdf42cae81c7eff.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '      ', '2023-01-24 12:03:00', '2023-01-24 05:03:00'),
(125, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK_SKIN', 'luxury-hijab-stone-workskin', '22', 600, 0, 'AL-LUXHJB-SKN-E1', 'P0085', '8', 2, '', '<p>\r\n<style type=\\\"\\\\\\\"><!--td {border: 1px solid #cccccc;}br {mso-data-placement:same-cell;}-->\r\n</style>\r\n175 CM * 70 CM</p>\r\n', '', '', '<p>Luxury hijab stonework is a cozy choice for the winter season. Created in the kin, this hijab is perfect for styling in a variety of ways. This party wear hijab has a subtle texture. The hijab is luxuriously soft as is made from imported lycra.</p>\r\n', 'd33d06a36925d900dc8e1ca8e10f1c84.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-25 08:58:01', '2023-01-25 01:58:01'),
(126, '1,21,2', NULL, '3 PIECE SET - PISTACHIO', '3-piece-set---pistachio', '52', 3150, 0, 'AL-SET-PSTA-H4', 'P0047', '20', 20, '', '', '', '', '<p>The 3-piece set is a kurta that has a round neck and three-fourth sleeves. It has lavished diya design all over it. This piece set is made up of 100% pure muslin material. You can wear this pistachio set on any occasion.</p>\r\n', '9a966a1883e5946424bc7aa04de30afe.jpg', '', '', '', '', '', '', '39', 'Variation', '2,1', 0, '1', '', '', '      ', '2023-01-25 09:12:22', '2023-01-25 02:12:22'),
(127, '1,22', NULL, 'ARABIAN NIQAB PIPING - BLACK', 'arabian-niqab-piping---black', '9', 399, 0, 'AL-PPNG-NQB-BLK-A1', 'P0033', '7', 5, '', '', '', '', '<p>The Arbian niqab piping is made from high-quality georgette material. This niqab is free size and easy to maintain. The niqab abaya is a casual and pleasant design made for every dress to match up. The black arbian niqab is lightweight and luxurious.</p>\r\n', '9c258b68b2e1684b204c7dfe7c2771aa.jpg', '', '', '', '', '', '', '11', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-25 10:10:39', '2023-01-25 03:10:39'),
(128, '6,1,2', NULL, 'SHIMMER PANTS - SKIN', 'shimmer-pants---skin', '22', 599, 0, 'AL-SMRPNTS-SKN-RGL-C1', 'P00143', '2', 12, '', '', '', '', '<p>Introducing the Shimmer pants that have flat waistbands. It is a lavish bottom wear pants that are a relaxed fit for every occasion. It is stretchable shimmer pants that have inserted pockets. The skin-colored pants are easily washable.</p>\r\n', '053211f4cbb1f764efdc7a55338eb93b.jpg', '', '', '', '', '', '', '14', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-25 11:10:42', '2023-01-25 04:10:42'),
(129, '1,28,29', NULL, 'TURKISH CARAVANSARY RUGS - ROYAL GREEN ', 'turkish-caravansary-rugs---royal-green', '46', 2499, 0, 'AL-PRUG-KRVNSRY-RYGRN-F2', 'P00186', '21', 10, '', '', '', '', '<p>Turkish Caravansary Rugs are a type of hand-woven rug that originated in the Ottoman Empire. 3d Caravansary-styled rugs are known for their intricate patterns, bold colors, and high-quality materials. Dense velvet fabric rugs are known to have durability. The ROYAL GREEN rug is 70*110 size in CM.</p>\r\n', 'c53b15b2db48f1705527e955467dfa1e.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-27 05:08:50', '2023-01-26 22:08:50'),
(130, '1,28,29', NULL, 'TURKISH CARAVANSARY RUGS - ROYAL CREAM', 'turkish-caravansary-rugs---royal-cream', '53', 2499, 0, 'AL-PRUG-KRVNSRY-RYCRM-F3', 'P00185', '21', 10, '', '', '', '', '<p>Our Turkish Caravansary Rugs are nowadays suitable for living dining and bedrooms. These 3d Caravansary rug styles are perfect for high-traffic areas and can withstand everyday wear and tear. Its dense velvet fabric is a decorative piece of flooring to enhance the place. The Turkish royal cream color rug provides a comfortable surface for standing and sitting.</p>\r\n', 'acf8b4da755dff352e1b4a89cb692878.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-27 05:24:50', '2023-01-26 22:24:50'),
(131, '1,28,29', NULL, 'TURKISH CARAVANSARY RUGS - ROYAL BLACK', 'turkish-caravansary-rugs---royal-black', '54', 2499, 0, 'AL-PRUG-KRVNSRY-RYBLK-F3', 'P00184', '21', 15, '', '', '', '', '<p>These Turkish Caravansary Rugs are hand knotted by skilled artisans. The intricate 3d Caravansary style of rugs is inspired by the traditional patterns and motifs of ancient Turkish Caravansaries. Its dense velvet fabric is easy to maintain and they look luxurious. The royal black Turkish rug is not only beautiful but also functional.</p>\r\n', '225238f70f4819be0341c314102c54f9.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-27 05:29:42', '2023-01-26 22:29:42'),
(132, '1,28,29', NULL, 'TURKISH CARAVANSARY RUGS - ROYAL MAHROON', 'turkish-caravansary-rugs---royal-mahroon', '55', 2499, 0, 'AL-PRUG-KRVNSRY-RYMHRN-F3', 'P00183', '21', 15, '', '', '', '', '<p>The Turkish Caravansary Rugs have unique look. The rug&rsquo;s dense velvet fabric is high-quality natural fibers such as wool, silk, or cotton. This 3d Caravansary styled rug is easy to maintain and clean. The Turkish royal maroon color gives a glamorous look to the arena.</p>\r\n', '4873b2756cc4f4391c4a1598bae34541.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 05:35:09', '2023-01-26 22:35:09'),
(133, '1,28,29', NULL, 'TURKISH CARAVANSARY RUGS - ROYAL GREY', 'turkish-caravansary-rugs---royal-grey', '44', 2499, 0, 'AL-PRUG-KRVNSRY-RYGRY-F3', 'P00182', '21', 5, '', '', '', '', '<p>Introducing you to the Turkish Caravansary Rugs. It is a 3d Caravansary-styled rug that is a stunning blend of traditional craftsmanship and modern style. This dense velvet fabric rug is easy to clean and maintain. This royal grey-colored rug has elegance and a sense of heritage.</p>\r\n', '93ed9a797bea02da680676d2ecc21f78.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 05:40:09', '2023-01-26 22:40:09'),
(134, '1,28,29', NULL, 'TURKISH CARAVANSARY RUGS_ROYAL CREAM', 'turkish-caravansary-rugsroyal-cream', '53', 2499, 0, 'AL-PRUG-KRVNSRY-RYCRM-F3', 'P00181', '21', 5, '', '', '', '', '<p>Our Turkish Caravansary Rugs are true works of art. This 3d Caravansary style rug gives a traditional look of Turkish style to your room. The royal cream color rug allows history and cultural touch to your home. This rug is made with dense velvet material which allows you to wash it easily.</p>\r\n', 'a5ec28b7379ed13df9015cc17ec4a9c1.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 05:50:47', '2023-01-26 22:50:47'),
(135, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL CREAM', 'premium-velvet-rugs---royal-cream', '53', 2599, 0, 'AL-PRUG-VLVT-RYCRM-H1', 'P00178', '9', 15, '', '', '', '', '<p>This Premium Velvet Rug is an artful rug for any room. To give a gracious look to your room the premium style rug is a wonderful choice to choose. The dense fabric rug provides comfort, is easy to clean, and gives a cozy feel. This royal cream color rug gives a beautiful look to your room.</p>\r\n', '5bc0684a681f67c01fed1aa5970f4bb3.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 05:53:56', '2023-01-26 22:53:56'),
(136, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL CREAM 2', 'premium-velvet-rugs---royal-cream-2', '53', 2650, 0, 'AL-PRUG-VLVT-RYCRM-B1', 'P00175', '9', 20, '', '', '', '', '<p>The Premium Velvet Rugs are a luxurious addition to any room. This premium-style rug is perfect if you are looking for a touch of elegance in the arena. The dense fabric rug is an easily washable material. This royal cream color rug is the perfect accessory for the living, bedroom, or dining room.</p>\r\n', '807051632dc60d034c1a1facd285c440.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 05:57:01', '2023-01-26 22:57:01'),
(137, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL WHITE', 'premium-velvet-rugs---royal-white', '56', 2699, 0, 'AL-PRUG-VLVT-RYWHT-F4', 'P00167', '9', 10, '', '', '', '', '<p>Premium Velvet Rugs are the ultimate style of comfort. It is made from high-quality dense velvet fabric. Upgrade your home with this premium style of rug. This soft-to-touch and comfortable rug is royal white in color.</p>\r\n', 'cf0c636c5bccdf67d5d9b4ab5edced6c.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-27 06:00:20', '2023-01-26 23:00:20'),
(138, '1,28,9', NULL, 'PREMIUM VELVET RUGS - ROYAL CREAM 3', 'premium-velvet-rugs---royal-cream-3', '53', 2699, 0, 'AL-PRUG-VLVT-RYCRM-F4', 'P00166', '9', 9, '', '', '', '', '<p>Introducing Premium Velvet Rugs is the perfect definition of luxury and relief. This premium-style rug provides a touch of elegance to your room. It is a dense velvet fabric that is durable and easy to maintain. This royal cream-colored rug is the perfect accessory for your home d&eacute;cor.</p>\r\n', '49f52afffb7f3c13061a00f75e2869fb.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 06:04:14', '2023-01-26 23:04:14'),
(139, '6,1,2', NULL, 'PLAZO CHECK - SKY BLUE', 'plazo-check---sky-blue', '5', 450, 0, 'AL-PLZ-CHK-SBLUE-RGL-D2', 'P00148', '2', 5, '', '', '', '', '<p>The Plazo check is made with utmost comfort. Wear this bottom wear and slide into a pair of heels to look further to create a perfect ensemble. The plazo is created for youngsters from heavy rayon fabric. This sky blue plazo can be easily worn anywhere comfortably.</p>\r\n', '16ee2bca5e954939f84a99b2bc569810.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 07:02:14', '2023-01-27 00:02:14'),
(140, '6,1,2', NULL, 'CHIKEN SEQUENCE PLAZO - WHITE', 'chiken-sequence-plazo---white', '21', 749, 0, 'AL-PLZ-CKN-WHT-RGL-D1', 'P00158', '2', 5, '', '', '', '', '<p>Chicken sequence plazo is an excellent way to refresh your wardrobe to mix and match. This bottom-wear style is a free size lower. Is made from high-quality heavy rayon viscose. The white plazo is simple and stylish bottom that is appropriate for casual, celebration, and work wear.</p>\r\n', '9cadbc255b107722703c63776fa981b4.jpg', '', '', '', '', '', '', '3', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 07:05:45', '2023-01-27 00:05:45'),
(141, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - WHITE', 'premium-leggings---white', '21', 499, 0, 'AL-LGNS-WHT-RGL-D4', 'P00126', '2', 5, '', '', '', '', '<p>The Premium leggings have an elastic waistband. In the bottom-wear leggings, there is no color fading or cotton bottom formation while washing. White lowers are made up of premium viscose.</p>\r\n', '5583ca183685f49b8a7c7421de1f21e0.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-27 07:15:37', '2023-01-27 00:15:37'),
(142, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - SKIN', 'premium-leggings---skin', '22', 499, 0, 'AL-LGNS-SKN-RGL-C4', 'P00123', '2', 5, '', '', '', '', '<p>Premium leggings is cool and comfortable legging. The leggings are made from premium viscose. It is a cut-to-size bottom-wear outfit. The skin-colored leggings provide you with free and easy movement.</p>\r\n', 'a7d32bb897b9f37eb9b758106e549c43.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-27 07:23:15', '2023-01-27 00:23:15'),
(143, '35,1,20,2', NULL, 'KURTI_LIGHT GREEN', 'kurtilight-green', '29', 1450, 0, 'AL-KURTI-LGRN-J3', 'P0041', '22', 25, '', '', '', '', '<p>It is a stylish long Kurti. It is a gorgeous collection of vine designs. The Kurti has beautiful floral embroidery with modal silk fabric. The light green Kurti has U-SHAPED neckline and three-fourth sleeves.</p>\r\n', 'd70c6015616321219e5adf312200588e.jpg', '', '', '', '', '', '', '23', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-27 07:33:55', '2023-01-27 00:33:55'),
(144, '1,21,2', NULL, '3 PIECE SET_AQUA BLUE', '3-piece-setaqua-blue', '49', 2149, 0, 'AL-SET-ABLUE-I3', 'P0051', '1', 4, '', '', '', '', '<ul>\r\n	<li>3-piece set is a straight-fit Pakistani suit.</li>\r\n	<li>Quilting and floral embroidery.</li>\r\n	<li>graceful appearance in aqua blue color.</li>\r\n	<li>Lawn cotton dupatta in chiffon material.</li>\r\n</ul>\r\n', '62640c237233620117f5f57fce11e12b.jpg', '', '', '', '', '', '', '2', 'Variation', '2,1', 0, '1', '', '', '     ', '2023-01-27 07:44:33', '2023-01-27 00:44:33'),
(145, '24,19,1', NULL, 'HIJAB FLOWER PRINT - COOPER BROWN', 'hijab-flower-print---cooper-brown', '51', 449, 0, 'AL-DLYHJB-CBRN-G1', 'P00114', '12', 6, '', '', '', '', '<p>The Hijab flower print is a unique daily wear hijab. This cooper brown hijab looks perfect and amazing with any outfit. Treat yourself or your loved ones with this premium quality cotton shimmer hijab.</p>\r\n', 'b3faeb8cc84e88db13c39ee944991eba.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-27 08:48:39', '2023-01-27 01:48:39'),
(146, '12,1', NULL, 'MODEST ABAYA STONE WORK - PEACH', 'modest-abaya-stone-work---peach', '26', 2050, 0, 'AL-ABY-PCH-RGL-A2', 'P0025', '6', 5, '', '', '', '', '<p>Introducing the Modest abaya stonework which is a beautiful blend of traditional and modern styles which is peach in color. Its CY fabric is made from a soft, fabric that looks beautiful. The front open style has stonework on the front adding a touch of elegance and glamour to the classic design.</p>\r\n', 'b1d499634476e191b4ee232d6d0bed60.jpg', '', '', '', '', '', '', '8', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-01-30 06:04:09', '2023-01-29 23:04:09'),
(147, '12,1', NULL, 'JILBAB WITH NOSE PIECE - LAVENDER', 'jilbab-with-nose-piece---lavender', '57', 1999, 0, 'AL-JIL-LVNDR-RGL-B3', 'P0017', '11', 3, '', '', '', '', '<p>Jilbab with nose piece is a comfortable loose-fitting outfit that allows you to move easily. The jilbab 3 pcs- style is machine washable. Jilbab is made from 100% pure cy crush material. The Lavender jilbab&rsquo;s standard length is 56 inches. The jilbab also comes with an adjustable mouthpiece.</p>\r\n', '2f9cc942f5e172b155e69a7433330101.jpg', '', '', '', '', '', '', '6', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-30 06:12:06', '2023-01-29 23:12:06'),
(148, '24,19,1', NULL, 'HIJAB FLOWER PRINT - CREAM+RED', 'hijab-flower-print---creamred', '58', 449, 0, 'AL-DLYHJB-CRM/RED-G2', 'P00106', '12', 5, '', '', '', '', '<p>The hijab flower print is perfect for all seasons. The daily wear of hijab adds color and modesty to your outfit. The flower hijab is an exclusive quality cotton shimmer fabric. Shop this cream+red hijab which is incredibly versatile. It helps to ear delightedly for a day-to-day look or lets it tumble loosely for an elegant mood.</p>\r\n', 'd8c0f6dcf600cef3978b883d299c9919.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '   ', '2023-01-30 06:16:49', '2023-01-29 23:16:49'),
(149, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PLAIN - CREAM', 'luxury-hijab-shimmer-plain---cream', '24', 500, 0, 'AL-LUXHJB-CRM-G3', 'P0090', '8', 5, '', '', '', '', '<p>Introducing Luxury hijab shimmer plain is perfect to wear on any occasion. The hijab helps one look comfortable and confident. The hijab is made up of impt cotton satin. Cream-colored plain hijab is made to last from best-in-class materials. Shop for the hijab simmer plain from our collection of exclusive, customized &amp; handmade.</p>\r\n', '3b64793d4e60caaec061000efc70d63d.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-01-30 06:21:03', '2023-01-29 23:21:03'),
(150, '24,19,1', NULL, 'HIJAB FLOWER PRINT - MUSTARD', 'hijab-flower-print---mustard', '12', 449, 0, 'AL-DLYHJB-MSTRD-G2', 'P00111', '12', 6, '', '', '', '', '<p>The Hijab Flower Print is soft and lightweight. For daily wear, the hijab is one of the stunning ranges in our collection. The hijab is made up of the finest quality cotton shimmer fabric. The width of the mustard hijab is roughly 36 inches.</p>\r\n', '7cc497d046a1c11ce42591839f48e64e.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-30 06:30:34', '2023-01-29 23:30:34'),
(151, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PLAIN - BABY PINK', 'luxury-hijab-shimmer-plain---baby-pink', '59', 500, 0, 'AL-LUXHJB-BBYPNK-G4', 'P0088', '8', 5, '', '', '', '', '<p>The luxury hijab shimmer plain is a very easy-to-style hijab for events. It is comfortable to wear and adds perfection to your clothing. The hijab made from impt cotton satin hijab can be worn on daily basis. The Baby pink hijab is a great way to add style to your outfit.</p>\r\n', '83174f836aaef5c3d89c6670a768d2ff.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-30 06:35:25', '2023-01-29 23:35:25'),
(152, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - LIGHT GREY', 'luxury-hijab-stone-work---light-grey', '25', 649, 0, 'AL-LUXHJB-LGREY-E3', 'P0075', '8', 5, '', '', '', '', '<p>Luxury hijab stonework is ready to wear accessory. This is a party wear hijab which helps cover fully front and back. Impt cotton+polyster is a breathable and sweat-absorbent fabric. Its light grey hijab is the best pick for official wear, party wear, events, etc.</p>\r\n', '3bc9453da6ec50183d048337011a016d.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-30 06:38:49', '2023-01-29 23:38:49'),
(153, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - LIGHT PEACH', 'luxury-hijab-stone-work---light-peach', '60', 649, 0, 'AL-LUXHJB-LPCH-E3', 'P0074', '8', 5, '', '', '', '', '<p>The luxury hijab stonework is one of the trending and fashionable stoles. Party wear hijab gives a royal and glamorous look at all events. The impt cotton+polyster fabric is very comfortable in wearing. The light peach hijab gives stylish look when paired with any dress.</p>\r\n', '9beb013e64777e43c88bc4c89ce30028.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-01-30 06:47:42', '2023-01-29 23:47:42'),
(154, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - CAMEL', 'luxury-hijab-stone-work---camel', '30', 600, 0, 'AL-LUXHJB-CML-E1', 'P0081', '8', 3, '', '', '', '', '<p>This Luxury hijab stonework is soft and lightweight hijab. For any function, the party wear hijab is a perfect match to wear anywhere. This lavish hijab is premium quality imported lycra that can be worn comfortably. This plain camel hijab can be worn for a long time if taken with proper care.</p>\r\n', '21089de47b3c44aa552da2b3d20fadff.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-30 06:52:13', '2023-01-29 23:52:13'),
(155, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - SKY BLUE', 'luxury-hijab-stone-work---sky-blue', '5', 649, 0, 'AL-LUXHJB-SBLUE-E3', 'P0071', '8', 5, '', '', '', '', '<p>The luxury hijab stonework is Customizable, pleasant, and tailored beautifully. Party wear hijab can be fusion enough that it matched any top-wear in any event. It is a fancy hijab with extreme quality impt cotton+polyster. This sky-blue hijab can be dressed easily.</p>\r\n', '50ae5f6e16360857617ced8aca6fe126.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-30 06:55:45', '2023-01-29 23:55:45'),
(156, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK_SKY BLUE', 'luxury-hijab-stone-worksky-blue', '5', 600, 0, 'AL-LUXHJB-SBLUE-E2', 'P0076', '8', 3, '', '', '', '', '<p>Introducing luxury hijab stonework is an attractive accessory. The party-wear hijab is versatile and can be styled in various ways to suit any occasion. The sky-blue hijab is durable and easy to wash. It is easily washable as it is made from imported lycra.</p>\r\n', 'be7beb581f4571cc207ea023adda52fa.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-30 06:58:45', '2023-01-29 23:58:45'),
(157, '1,21,2', NULL, '3 PIECE SET_ PISTACHIO', '3-piece-set-pistachio', '52', 2750, 0, 'AL-SET-PSTACLR-I1', 'P0064', '1', 10, '', '', '', '', '<p>3 PIECE SET is a traditional dress. This Pakistani suit is very comfortable and cozy to wear. Also, the product is made from a mixture of pure georgette, viscose santoon, and nazmin fabric. This pistachio-colored piece set is suitable for formal and casual occasions.</p>\r\n', 'ec1246d809eb6db0bc9cef97b663528c.jpg', '', '', '', '', '', '', '37,26,36', 'Variation', '2,1', 0, '1', '', '', '    ', '2023-01-31 06:45:28', '2023-01-30 23:45:28'),
(158, '6,1,2', NULL, 'PLAZO PLAIN - DARK OLIVE', 'plazo-plain---dark-olive', '61', 450, 0, 'AL-PLZ-PLN-DOLV-RGL-D2', 'P00154', '2', 5, '', '', '', '', '<p>This plazo plain is versatile and comfortable bottom wear. The plain design of the dark olive plazo makes it easy to pair with a variety of tops, kurtas, and tunics. The plazo plain is the current in vogue everyone must have. This plazo is also durable and simple to keep up in your wardrobe.</p>\r\n', 'c5e51955da8f29fcc2a3dd47f1ff3f6f.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-31 06:53:14', '2023-01-30 23:53:14'),
(159, '6,1,2', NULL, 'PLAZO PLAIN - DARK PINK', 'plazo-plain---dark-pink', '42', 450, 0, 'AL-PLZ-PLN-DPNK-RGL-D2', 'P00152', '2', 6, '', '', '', '', '<p>The plazo plain is suitable for women of all ages. The dark pink bottom wear is in plain design which makes it a perfect choice to collab with every top It is made from rayon material that makes it look classy, and the comfortable waistband adds to its appeal.</p>\r\n', 'a958c89ed08f4b371f9a615414d001a3.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-31 06:56:17', '2023-01-30 23:56:17'),
(160, '6,1,2', NULL, 'PLAZO PLAIN - TEAL', 'plazo-plain---teal', '62', 450, 0, 'AL-PLZ-PLN-TEL-RGL-D2', 'P00151', '2', 10, '', '', '', '', '<p>Plazo plain is made of a soft, breathable, and lightweight fabric that drapes elegantly over the legs. This bottom wear is perfect for everyday wear or casual outings. Its heavy rayon fabric is an easily washable product. This teal-colored plazo is a stretchable plazo that can be worn with any top.</p>\r\n', '1173d5fd385d33eb8ace6e38fba66fdf.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-31 06:59:59', '2023-01-30 23:59:59'),
(161, '6,1,2', NULL, 'PLAZO PLAIN - BROWN', 'plazo-plain---brown', '37', 450, 0, 'AL-PLZ-PLN-BRWN-RGL-D2', 'P00155', '2', 2, '', '', '', '', '<p>Introducing the plazo plain is suitable for both casual and formal occasions. This bottom wear is comfortable to wear. The heavy rayon fabric is known to have durability and is easy to wash. The brown plazo can be paired with any top wear to look authentic.</p>\r\n', '2f994d485ac1a6a2a170f9f56791d67f.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-01-31 07:03:00', '2023-01-31 00:03:00'),
(162, '11,1,28', NULL, 'EXTRA LUXURY RUGS 1ST EDITION - MAHROON', 'extra-luxury-rugs-1st-edition---mahroon', '6', 1299, 0, 'AL-PRUG-LXTRA-MHRN-F2', 'P00187', '23', 25, '', '', '', '', '<p>The extra luxury rugs 1st edition is a high-end premium quality rug. The lux extra velvet A-styled rug gives a luxurious feel to the room. Its luxury velvet fabric makes it easy to wash and so is durable. This mahroon luxury rug edition is a perfect fit for each room.</p>\r\n', 'cf49c752751b6d83f691e312b8388bc1.jpg', '', '', '', '', '', '', '40', 'Variation', '2,1', 0, '1', '', '', '   ', '2023-01-31 07:15:08', '2023-01-31 00:15:08'),
(163, '11,1,28', NULL, 'EXTRA LUXURY RUGS 1ST EDITION - ROYAL GREEN ', 'extra-luxury-rugs-1st-edition---royal-green', '46', 1299, 0, 'AL-PRUG-LXTRA-RYGRN-F2', 'P00188', '23', 25, '', '', '', '', '<p>Extra luxury rugs 1st edition the vibrant colors, intricate patterns, and luxury velvet fabric of the rug&#39;s material will give any room an elegant and sophisticated look. This lux extra velvet-styled green rug effortlessly combines minimalistic patterns and innovative design. These rugs are also placed in commercial places too.</p>\r\n', '9441ba92be8271694aee1f6d1323a5ca.jpg', '', '', '', '', '', '', '40', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-01-31 07:20:54', '2023-01-31 00:20:54'),
(164, '11,1,28', NULL, 'EXTRA LUXURY RUGS 2ND EDITION_MAHROON', 'extra-luxury-rugs-2nd-editionmahroon', '6', 1399, 0, 'AL-PRUG-LXTRA-MHRN-F2', 'P00189', '23', 25, '', '', '', '', '<p>The extra luxury rugs 2nd edition are thick, plush, and extremely soft rugs. Lux extra velvet-styled rug will stay vibrant. The luxury velvet Fabric rugs are durable and will last for years with proper care. The mahroon rugs are perfect for living rooms, bedrooms, and other high-traffic areas in the home.</p>\r\n', '5793dd76e17ce8464b7d186f84c1a900.jpg', '', '', '', '', '', '', '40', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-01-31 07:23:29', '2023-01-31 00:23:29'),
(165, '11,1,28', NULL, 'EXTRA LUXURY RUGS 2ND EDITION _ROYAL GREEN ', 'extra-luxury-rugs-2nd-edition-royal-green', '46', 1399, 0, 'AL-PRUG-LXTRA-RYGRN-F2', 'P00190', '23', 25, '', '', '', '', '<p>The extra luxury rugs 2nd edition is a modern design rug for home d&eacute;cor. The luxury velvet fabric blends with all types of flooring lux extra velvet-styled rugs are made from superior quality. The royal green luxury rug is durable and will last for years if taken properly care of.</p>\r\n', '3fd9a9fad3cd2a2e077c79564e73734d.jpg', '', '', '', '', '', '', '40', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-01-31 07:26:30', '2023-01-31 00:26:30'),
(166, '11,1,28', NULL, 'EXTRA LUXURY RUGS 3RD EDITION - DARK BLUE', 'extra-luxury-rugs-3rd-edition---dark-blue', '63', 1499, 0, 'AL-PRUG-LXTRA-DBLE-F1', 'P00191', '23', 25, '', '', '', '', '<p>The extra luxury rug 3rd edition is designed to add elegance and luxury to any room. The rugs are made from the finest quality luxury velvet. The lux extra velvet style rug is Designer Handmade and Modified. The dark blue rug is a good piece of floor accessory.</p>\r\n', '5f33c7210ded167953702f290b0d7a30.jpg', '', '', '', '', '', '', '40', 'Variation', '2,1', 0, '1', '', '', '   ', '2023-01-31 07:29:18', '2023-01-31 00:29:18'),
(167, '11,1,28', NULL, 'EXTRA LUXURY RUGS 3RD EDITION - MAHROON 2', 'extra-luxury-rugs-3rd-edition---mahroon-2', '6', 1499, 0, 'AL-PRUG-LXTRA-MHRN-F1', 'P00192', '23', 25, '', '', '', '', '<p>The extra luxury rugs 3rd edition helps provide comfort and beauty to the room. Its mahroon lux extra velvet fabric is made from the highest quality materials and is designed to provide a luxurious and comfortable feel underfoot. The luxury velvet-styled rug is long-lasting.</p>\r\n', 'd93e03968d229d08c0eaad5bf4b26731.jpg', '', '', '', '', '', '', '40', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-01-31 07:33:17', '2023-01-31 00:33:17'),
(168, '12,1', NULL, 'MODEST ABAYA STONE WORK - UMBER ', 'modest-abaya-stone-work---umber', '64', 2050, 0, 'AL-ABY-UMB-RGL-B2', 'P0026', '6', 5, '', '', '', '', '<p>Check out this readymade modest abaya stone work which is best suited for casual wear. The front open-style abaya looks gorgeous on all body types. The Cy fabric abaya adds a spark to your look. The umber abaya is easy to clean and long-lasting.</p>\r\n', 'c3d1f510e06adec19f1623ab7e2ea3d3.jpg', '', '', '', '', '', '', '8', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:02:27', '2023-02-07 05:02:27'),
(169, '12,1', NULL, 'AIRLINE ABAYA HANDWORK (C) - BLACK', 'airline-abaya-handwork-c---black', '9', 1499, 0, 'AL-ARL-C-ABY-BLK-RGL-B2', 'P0030', '5', 6, '', '', '', '', '<p>The airline abaya handwork (c) is a stylish and comfortable outfit. The latest abaya is made with fine material of impt nida. It has a beautiful front-close style. The black airline abaya is easy to wash, clean, and store. It can be worn anywhere anytime.</p>\r\n', '4190da51315a57120e0cad464e7f3030.jpg', '', '', '', '', '', '', '17', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:06:04', '2023-02-07 05:06:04'),
(170, '24,19,1', NULL, 'HIJAB FLOWER PRINT - PINK', 'hijab-flower-print---pink', '15', 449, 0, 'AL-DLYHJB-PINK-G2', 'P00110', '12', 5, '', '', '', '', '<p>Introducing you to the hijab flower print featuring flower aspect patterns. The daily wear hijab is good to go with formal or casual wear. The cotton shimmer hijab is the perfect accessory to match any dress. The pink hijab is 175 CM * 85 CM in size.</p>\r\n', '262ba79b662f15fe9a007ea752e0adbe.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:09:26', '2023-02-07 05:09:26'),
(171, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - TINE BLUE', 'luxury-hijab-shimmer-print---tine-blue', '65', 550, 0, 'AL-LUXHJB-PNT-TBLUE-G3', 'P0097', '8', 5, '', '', '', '', '<p>Shop out our best luxury hijab shimmer print. The party wear style hijab is long lasting if taken proper care of. Impt cotton satin is a soft and stretchy material that helps in easy styling. The tine blue hijab shimmer is here to adorn your cham.</p>\r\n', 'b267bf7cb633f1d59f7b80090221c1bc.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-07 12:13:01', '2023-02-07 05:13:01'),
(172, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PLAIN - GREY ', 'luxury-hijab-shimmer-plain---grey', '18', 500, 0, 'AL-LUXHJB-GREY-G3', 'P0092', '8', 5, '', '', '', '', '<p>Check out the new luxury hijab shimmer plain which is in our best party wear hijab collection. The hijab is made from the fine fabric of impt cotton satin and thus is easily washable. The grey hijab is comfortable to wear and is 175 cm * 70 cm in dimensions.</p>\r\n', 'cd4ce8b2ad30a5b15975a477142060ee.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:17:43', '2023-02-07 05:17:43'),
(173, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK_LIGHT GREY', 'luxury-hijab-stone-worklight-grey', '25', 600, 0, 'AL-LUXHJB-LGREY-E1', 'P0083', '8', 3, '', '', '', '', '<p>This lavish luxury hijab stone work is popular for special events while staying comfortable at the same time. This party-wear hijab styles are durable and easy to wash, made from imported lycra fabric. Its light grey hijab will enhance your inner beauty and keep you glowing all day.</p>\r\n', '3c03af983f6e0ff7594317efbed4f8ad.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:20:47', '2023-02-07 05:20:47'),
(174, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - DARK GOLD', 'luxury-hijab-shimmer-print---dark-gold', '19', 550, 0, 'AL-LUXHJB-PNT-DGLDN-G3', 'P00105', '8', 5, '', '', '', '', '<p>The luxury hijab shimmer print helps match all your outfit for parties to do fashion. Its impt cotton satin fabric helps keep the hijab long-lasting if taken proper care of. The dark gold hijab gives an attractive, and perfect look. The party wears hijab style is 175 cm * 70 cm in size.</p>\r\n', '6b20886d3e378f86b7d8b6505bdd309a.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:23:56', '2023-02-07 05:23:56'),
(175, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - GREY', 'luxury-hijab-stone-work---grey', '18', 600, 0, 'AL-LUXHJB-GREY-E2', 'P0078', '8', 3, '', '', '', '', '<p>Check out the new luxury hijab stonework which can be mixed and matched with any luxury outfit to look decent in any event. The party wear style hijab is a long-lasting product if taken proper care of. The grey imported lycra fabric is stylish and modern to look.</p>\r\n', 'bd47637336895b589738a62a82dc4bcb.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:26:55', '2023-02-07 05:26:55'),
(176, '24,19,1', NULL, 'HIJAB FLOWER PRINT - YELLOW BROWN', 'hijab-flower-print---yellow-brown', '66', 449, 0, 'AL-DLYHJB-YLW/BRN-G2', 'P00107', '12', 6, '', '', '', '', '<p>The hijab flower print is a high-quality fresh flower print accessory for the head. The hijab is a daily wear style to match every outfit. The cotton shimmer hijab is durable, easy to keep, and simple to clean. The yellow-brown flower print hijab helps do decent fashion.</p>\r\n', '4a7dfb047fb5eca4c1062ad77f1d8074.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-07 12:29:51', '2023-02-07 05:29:51'),
(177, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PLAIN - SKIN ', 'luxury-hijab-shimmer-plain---skin', '22', 500, 0, 'AL-LUXHJB-SKNCLR-G3', 'P0091', '8', 5, '', '', '', '', '<p>The luxury hijab shimmer plain provides a sophisticated touch and is ideal for ethnic wear. The party wear hijab style allows you to step out like royalty every time. Its impt cotton satin material feels soft and light weighted. The skin hijab is made to make you feel confident and empowered.</p>\r\n', '3cf8fea4488f6c5eaf97dfbf5ba24b6f.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:34:21', '2023-02-07 05:34:21'),
(178, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - BLUE', 'luxury-hijab-stone-work---blue', '8', 649, 0, 'AL-LUXHJB-BLUE-E4', 'P0070', '8', 5, '', '', '', '', '<p>Check out the new luxury hijab stone work which is a top-quality hijab that encourages morality and fashion. This hijab seeks to provide high-quality hijabs that are both luxurious and comfy, allowing for effortless style. This blue hijab made from impt cotton+polyster fabric is superior in quality.</p>\r\n', '9bea8cbbf28753f83b0ab839a91d63fc.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-07 12:38:14', '2023-02-07 05:38:14'),
(179, '1,21,2', NULL, '3 PIECE SET - BLUE', '3-piece-set---blue', '8', 2149, 0, 'AL-SET-BLUE-H4', 'P0049', '1', 4, '', '', '', '', '<p>This 3-piece set adds charm to your look. Its blue pakistani suit style is durable and easy to maintain. The fabric lawn cotton dupatta chiffon adds elegance to your look. This 3-piece set allows you to fashion effortlessly in less time.</p>\r\n', '760814f09de9c5f6d551403161b8e1b3.jpg', '', '', '', '', '', '', '2', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-08 05:45:29', '2023-02-07 22:45:29'),
(180, '6,1,2', NULL, 'PLAZO PLAIN - WOOD ', 'plazo-plain---wood', '67', 450, 0, 'AL-PLZ-PLN-WD-RGL-D2', 'P00156', '2', 3, '', '', '', '', '<p>Plazo plain is super comfy to wear. The bottom wear style can be matched with any top wear to look elegant. This plazo is made from fine-quality of heavy rayon fabric. The wood color plazo plain is easy to wash and durable.</p>\r\n', '927a8b7a9ac32ce8afd7cab028631d4a.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-08 05:49:15', '2023-02-07 22:49:15'),
(181, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - RED', 'premium-leggings---red', '23', 499, 0, 'AL-LGNS-RED-RGL-D4', 'P00125', '2', 5, '', '', '', '', '<p>Introducing premium leggings help in sweat and heat control. This bottom-wear style helps mix and match to style up. These leggings are made from premium viscose fabric are durable. The red leggings are super gentle, convenient, and significantly more long&ndash;lasting.</p>\r\n', 'b7946c7c959be6c8d4e4812501a3bbee.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-08 05:54:05', '2023-02-07 22:54:05'),
(182, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - BLACK', 'premium-leggings---black', '9', 499, 0, 'AL-LGNS-BLK-RGL-C4', 'P00119', '2', 5, '', '', '', '', '<p>The premium leggings are easy to wear and take care of. Wear it to your yoga practice, dance class, or travel - it is designed for easy movement. The legging&rsquo;s premium viscose fabric is durable and easy to wash. The black leggings are free size and comfy.</p>\r\n', '9ff01a8e1fc149449af99bc1ca6e2dc2.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-08 05:57:24', '2023-02-07 22:57:24'),
(183, '6,1,2', NULL, 'PLAZO PLAIN - MAHROON', 'plazo-plain---mahroon', '6', 450, 0, 'AL-PLZ-PLN-MHRN-RGL-D2', 'P00153', '2', 2, '', '', '', '', '<p>This plazo plain is an elegant summer bottom wear that goes with all types of top wear. The plazo plain is made from heavy rayon fabric making it easier to be durable and to wash conveniently. The mahroon plazo plain gives elegant look.</p>\r\n', '0e2a29378b8d2d3963e748f064266227.jpg', '', '', '', '', '', '', '16', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-08 06:00:34', '2023-02-07 23:00:34'),
(184, '30,1,28', NULL, 'DODIYA RUGS - GREEN', 'dodiya-rugs---green', '48', 1199, 0, 'AL-PRUG-DYA-GRN-F1', 'P00193', '24', 50, '', '', '', '', '<p>Dodiya rugs are beautiful to look at. The rugs are made with perfect quality dense velvet fabric. The rug&rsquo;s dense velvet style will make your loved ones will be moved by the beauty without a doubt. The green rug is soft to the feel and gives the house an irresistible charm.</p>\r\n', 'cff108749f1f079b2d16fe162a89fdd2.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-08 06:04:44', '2023-02-07 23:04:44'),
(185, '31,1,28', NULL, 'ELEGANCE CHENNILE RUGS - WHITE', 'elegance-chennile-rugs---white', '21', 899, 0, 'AL-PRUG-CNL-WHT-F1', 'P00194', '25', 50, '', '', '', '', '<p>Sink your feet into the coziness of elegance chennile rugs. The chennile-styled rug gives floors a lush texture. The rug is made from turkish chennile fabric which allows it to not slip from the floor. The white rug comes can be mixed up with any flooring to give an amazing look.</p>\r\n', 'cca90526a33818ebd6c84836d82fea99.jpg', '', '', '', '', '', '', '41', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-08 06:09:36', '2023-02-07 23:09:36'),
(186, '12,1', NULL, 'JILBAB WITH NOSE PIECE -PINK', 'jilbab-with-nose-piece--pink', '15', 1999, 0, 'AL-JIL-PINK-RGL-B3', 'P0018', '11', 5, '', '', '', '', '<p>Check out the jilbab with nose piece that helps you move easily and comfortably. The jilbab 3 pcs gives the garment a nice fall. The jilbab is made from cy crush fabric, breathable, and simple to care for. The pink jilbab is good to go with events to look decent.</p>\r\n', 'c7f3e9b68cad6da052642345a11b91da.jpg', '', '', '', '', '', '', '6', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-13 11:53:48', '2023-02-13 04:53:48'),
(187, '12,1', NULL, 'ABAYA HAND WORK PATCHES - GREY', 'abaya-hand-work-patches---grey', '18', 2199, 0, 'AL-ABY-PTCHS-GREY-RGL-B2', 'P0027', '6', 5, '', '', '', '', '<p>The abaya hand work patches appear to be both graceful and authentic to wear. The front is open ideal for both formal and casual occasions. It is made from cy crush making it simple to wear. The grey abaya is durable and long-lasting.</p>\r\n', '41568c4acb3d2459b1633d18e24b7ec5.jpg', '', '', '', '', '', '', '6', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-13 12:26:48', '2023-02-13 05:26:48'),
(188, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - MAHROON', 'luxury-hijab-stone-work---mahroon', '6', 600, 0, 'AL-LUXHJB-MHRN-E1', 'P0082', '8', 4, '', '', '', '', '<p>Introducing the luxury hijab stone work is a stylish and vibrant-looking outfit. The hijab is made from a pure form of imported lycra. The party wear hijab style allows us to do easy styling. The mahroon hijab gives an attractive look.</p>\r\n', '58671ec62ca7f672ae6707d230d24ba9.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-13 12:32:00', '2023-02-13 05:32:00'),
(189, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK - DARK GREY', 'luxury-hijab-stone-work---dark-grey', '3', 649, 0, 'AL-LUXHJB-DGREY-E4', 'P0068', '8', 5, '', '', '', '', '<p>This luxury hijab stone work gives an appealing and flawless appearance. Party wear hijab style boosts your confidence and keeps you shining brightly all day. This hijab is made from great quality impt cotton+polyster. Dark grey hijab is good to look at.</p>\r\n', 'e3b7499a2b6e46fb8eedb6a1ac6923fe.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-15 12:12:45', '2023-02-15 05:12:45'),
(190, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PLAIN - BLACK', 'luxury-hijab-shimmer-plain---black', '9', 500, 0, 'AL-LUXHJB-BLK-G4', 'P0089', '8', 10, '', '', '', '', '<p>The luxury hijab shimmer plain is super soft and smooth to use. The hijab is made from excellent quality impt cotton satin. Party wear style hijab is durable if taken proper care of. Black hijab can be mixed with any outfit to look perfect for any event.</p>\r\n', 'cf0d1f4f627a706e9d884201e3d26b34.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-15 12:15:49', '2023-02-15 05:15:49'),
(191, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PLAIN - BLUE', 'luxury-hijab-shimmer-plain---blue', '8', 500, 0, 'AL-LUXHJB-BLUE-G4', 'P0087', '8', 5, '', '', '', '', '<p>Check out the luxury hijab shimmer plain which gives super popular and gives a modest appearance. The party wear hijab style is the perfect outfit to wear on an everyday basis. Hijab shimmer is made from extreme quality impt cotton satin. The grey hijab makes you feel beautiful.</p>\r\n', 'c434db9eb22e2b67183e1112779a197a.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-15 12:19:28', '2023-02-15 05:19:28'),
(192, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - BLACK', 'luxury-hijab-shimmer-print---black', '9', 550, 0, 'AL-LUXHJB-PNT-BLK-G3', 'P00104', '8', 5, '', '', '', '', '<p>Introducing the luxury hijab shimmer print which gives embellished with a sparkly glitter look. The party wear hijab style is good for wearing on special occasions at home. The impt cotton satin fabric gives a shine to your hijab. The black hijab helps mix with all outfits.</p>\r\n', 'c9a0d8ebaa47b58378a307ccfa440b59.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-15 12:22:21', '2023-02-15 05:22:21'),
(193, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK _BLACK', 'luxury-hijab-stone-work-black', '9', 649, 0, 'AL-LUXHJB-BLK-E3', 'P0072', '8', 5, '', '', '', '', '<p>Check out the luxury hijab stone work that boosts confidence when worn. This party wear hijab style adds a touch of glam to your everyday wear. It is made from impt cotton+polyster allowing you a graceful look. Grey hijab is a must-have piece for your closet.</p>\r\n', '11feed459a8b0d23bf3a23c441a58e48.jpg', '', '', '', '', '', '', '13', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-15 12:25:39', '2023-02-15 05:25:39'),
(194, '24,19,1', NULL, 'HIJAB FLOWER PRINT - GREY BLACK', 'hijab-flower-print---grey-black', '68', 449, 0, 'AL-DLYHJB-GRY/BLK-G2', 'P00108', '12', 6, '', '', '', '', '<p>The hijab flower print displaying a blossomy effect looks beautiful on all outfits. It is the daily wear of hijab. The fabric is made from premium quality cotton shimmer allowing you a comfy movement. Grey black hijab is durable if taken proper care of.</p>\r\n', '912d8d171d52ef64f71db83224101dc4.jpg', '', '', '', '', '', '', '31', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-15 12:28:46', '2023-02-15 05:28:46'),
(195, '19,1,23', NULL, 'LUXURY HIJAB SHIMMER PRINT - LIGHT PINK', 'luxury-hijab-shimmer-print---light-pink', '32', 550, 0, 'AL-LUXHJB-PNT-LPNK-G3', 'P0095', '8', 5, '', '', '', '', '<p>This luxury hijab shimmer print is easily adjustable and can be worn on a day-to-day basis. Its impt cotton satin fabric is easily washable and long-lasting. This party wear hijab style gives you a bold and vibrant look. Light pink shimmer hijab is an exclusive product.</p>\r\n', '95042dd9b3cdde14b9b27ab60cf62688.jpg', '', '', '', '', '', '', '29', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-15 12:33:38', '2023-02-15 05:33:38'),
(196, '19,1,23', NULL, 'LUXURY HIJAB STONE WORK_BLUE', 'luxury-hijab-stone-workblue', '8', 600, 0, 'AL-LUXHJB-BLUE-E2', 'P0080', '8', 3, '', '', '', '', '<p>Introducing luxury hijab stone work that is ideal for special events and occasions. It is party wear hijab is decent and elegant to look. Luxury hijab is made with high-quality imported lycra. Blue luxury hijab gives grace to your look.</p>\r\n', '3daecd86850ccdec5c623c7429617ba9.jpg', '', '', '', '', '', '', '12', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-15 12:36:54', '2023-02-15 05:36:54'),
(197, '1,21,2', NULL, '3 PIECE SET - WHITE', '3-piece-set---white', '21', 2149, 0, 'AL-SET-WHT-I3', 'P0050', '1', 4, '', '', '', '', '<p>Pick a 3-piece set this new season. The latest pakistani suit makes you feel absolutely beautiful. Its fabric lawn cotton dupatta chiffon is durable and long-lasting if taken with proper care. The white 3-piece set is easily washable and looks good every time you wear it.</p>\r\n', '25ab35e19a386fabc6794812a7a5b14f.jpg', '', '', '', '', '', '', '2', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-16 05:15:56', '2023-02-15 22:15:56'),
(198, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - NAVY BLUE', 'premium-leggings---navy-blue', '2', 499, 0, 'AL-LGNS-NBLUE-RGL-C4', 'P00124', '2', 5, '', '', '', '', '<p>Check out the premium leggings that help in moisture and high temperatures control the body. This bottom wear goes with all types of top wear. This premium viscose fabric is as soft as a cloud. The navy-blue leggings help one in easy movement.</p>\r\n', 'd044a42f4c55081179da173455756558.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-16 05:19:48', '2023-02-15 22:19:48'),
(199, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - GREY', 'premium-leggings---grey', '18', 499, 0, 'AL-LGNS-GREY-RGL-C4', 'P00120', '2', 5, '', '', '', '', '<p>The premium leggings are both comfortable and fashionable. It is a bottom-wear style that provides excellent stretchability and recovery. The leggings fabric is made from premium viscose, made with cutting-edge textile technology. The grey leggings are cozy to wear.</p>\r\n', '553d1543d0678e6e96ba4add9c482c56.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-16 05:23:40', '2023-02-15 22:23:40'),
(200, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - BURGUNDY', 'premium-leggings---burgundy', '35', 499, 0, 'AL-LGNS-BRNDY-RGL-C4', 'P00122', '2', 5, '', '', '', '', '<p>Wear and enjoy the new premium leggings with t-shirts, kurtas, and long shirts. This bottom wear gives an elegant vibe when stepping out. It is made from premium viscose fabric which gives ease of movement. Burgundy legging is much soft and last considerably longer.</p>\r\n', '7228bf79221937b02e5a5c3af4db10b4.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-16 05:26:16', '2023-02-15 22:26:16'),
(202, '1,28,32', NULL, 'SUPERIOR MULTICOLOUR RUGS - MULTICOLOUR', 'superior-multicolour-rugs---multicolour', '70', 1599, 0, 'AL-PRUG-MLT-F1', 'P00195', '2', 50, '', '', '', '', '<p>The superior multicolour rugs will help your kid or pet play happily and conveniently. On the multicolor-styled rug, the dust particles on the surface are easily removed. The dense velvet fabric is soft, warm, long-lasting, flexible, and anti-static. The multicolour rug is 70*110 cm in dimension.</p>\r\n', 'a919cc27f5cd5bae9255b2505e1758b3.jpg', '', '', '', '', '', '', '21', 'Variation', '2,1', 0, '1', '', '', ' ', '2023-02-16 05:38:20', '2023-02-15 22:38:20');
INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `slug`, `color`, `regular_price`, `sale_price`, `sku`, `product_code`, `style_id`, `stock`, `hsn_code`, `custom_size`, `short_description`, `additional_info`, `description`, `photo`, `alt`, `banner_photo`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `fabric_id`, `product_type`, `products_attributes_id`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(203, '6,34,1,2', NULL, 'PREMIUM LEGGINGS - DARK TEAL', 'premium-leggings---dark-teal', '69', 499, 0, 'AL-LGNS-DTEAL-RGL-C4', 'P00121', '2', 5, '', '', '', '', '<p>The premium leggings look stunning on all body types. Bottom wear is so light, feels almost like a base layer to the skin, and is comfortable to wear. Since its fabric is made of premium viscose allowing an easy machine wash. The dark teal legging allows sitting comfortably while looking stylish.</p>\r\n', '4b6d66e094eccb5fcf53cf85da6096ff.jpg', '', '', '', '', '', '', '15', 'Variation', '2,1', 0, '1', '', '', '  ', '2023-02-16 11:10:01', '2023-02-16 04:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `name`, `code`, `status`, `createDate`, `updateDate`) VALUES
(1, 'Size', 'size', '1', '2022-11-08 07:54:26', '2022-11-08 12:24:26'),
(2, 'Color', 'color', '1', '2022-11-08 08:37:22', '2022-11-08 13:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_values`
--

CREATE TABLE `products_attributes_values` (
  `id` int(10) NOT NULL,
  `products_attribute_id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `code` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_attributes_values`
--

INSERT INTO `products_attributes_values` (`id`, `products_attribute_id`, `name`, `code`, `photo`, `createDate`, `status`, `updateDate`) VALUES
(1, 2, 'NAVY BLUE', 'navy blue', NULL, '2022-11-08 08:38:21', '1', '2022-11-08 13:08:21'),
(2, 2, 'DARK GREY', 'dark grey', '', '2022-11-08 08:38:40', '1', '2022-11-08 13:08:40'),
(3, 2, 'BOTTLE GREEN', 'bottle green', '', '2022-11-08 08:38:49', '1', '2022-11-08 13:08:49'),
(4, 2, 'SKY BLUE', 'sky blue', '', '2022-11-08 08:39:00', '1', '2022-11-08 13:09:00'),
(5, 2, 'MAHROON', 'mahroon', '', '2022-11-08 08:39:14', '1', '2022-11-08 13:09:14'),
(6, 2, 'WINE', 'wine', '', '2022-11-08 08:39:25', '1', '2022-11-08 13:09:25'),
(7, 2, 'BLUE', 'blue', '', '2022-11-08 08:39:43', '1', '2022-11-08 13:09:43'),
(8, 2, 'BLACK', 'black', '', '2022-11-08 08:40:00', '1', '2022-11-08 13:10:00'),
(9, 2, 'BLACK + GREEN', 'black   green', '', '2022-11-08 08:40:14', '1', '2022-11-08 13:10:14'),
(10, 2, 'GOLD', 'gold', '', '2022-11-08 08:40:29', '1', '2022-11-08 13:10:29'),
(11, 2, 'MUSTARD', 'mustard', '', '2022-11-08 08:40:41', '1', '2022-11-08 13:10:42'),
(12, 2, 'FAWN BEIGE', 'fawn beige', '', '2022-11-08 08:40:53', '1', '2022-11-08 13:10:53'),
(13, 2, 'SEA GREEN', 'sea green', '', '2022-11-08 08:41:07', '1', '2022-11-08 13:11:07'),
(14, 2, 'PINK', 'pink', '', '2022-11-08 08:41:20', '1', '2022-11-08 13:11:20'),
(15, 2, 'YELLOW', 'yellow', '', '2022-11-08 08:41:33', '1', '2022-11-08 13:11:33'),
(16, 2, 'BEIGE', 'beige', '', '2022-11-08 08:41:44', '1', '2022-11-08 13:11:45'),
(17, 2, 'GREY', 'grey', '', '2022-11-08 08:41:56', '1', '2022-11-08 13:11:56'),
(18, 2, 'DARK GOLD', 'dark gold', '', '2022-11-08 08:42:21', '1', '2022-11-08 13:12:21'),
(19, 2, 'MAGENTA PINK', 'magenta pink', '', '2022-11-08 08:42:30', '1', '2022-11-08 13:12:30'),
(20, 2, 'WHITE', 'white', '', '2022-11-08 08:42:41', '1', '2022-11-08 13:12:41'),
(21, 2, 'SKIN', 'skin', '', '2022-11-08 08:42:52', '1', '2022-11-08 13:12:52'),
(22, 2, 'RED', 'red', '', '2022-11-08 08:43:10', '1', '2022-11-08 13:13:10'),
(23, 2, 'CREAM', 'cream', '', '2022-11-08 08:43:19', '1', '2022-11-08 13:13:19'),
(24, 2, 'LIGHT GREY', 'light grey', '', '2022-11-08 08:43:28', '1', '2022-11-08 13:13:28'),
(25, 1, 'Regular', 'regular', '', '2022-11-08 09:53:49', '1', '2022-11-08 14:23:49'),
(26, 1, 'Small', 'small', '', '2022-11-08 09:54:26', '1', '2022-11-08 14:24:26'),
(27, 1, 'Medium', 'medium', '', '2022-11-08 09:54:42', '1', '2022-11-08 14:24:42'),
(28, 1, 'Large', 'large', '', '2022-11-08 09:54:55', '1', '2022-11-08 14:24:55'),
(29, 1, 'XL', 'xl', '', '2022-11-08 09:55:05', '1', '2022-11-08 14:25:05'),
(30, 1, 'XXL', 'xxl', '', '2022-11-08 09:55:15', '1', '2022-11-08 14:25:15'),
(31, 2, 'Royal Blue', 'royal blue', '', '2022-11-18 11:31:39', '1', '2022-11-18 16:01:39'),
(32, 2, 'Royal Grey', 'royal grey', '', '2022-11-18 11:32:03', '1', '2022-11-18 16:02:03'),
(33, 2, 'Royal Brown', 'royal brown', '', '2022-11-18 11:32:28', '1', '2022-11-18 16:02:28'),
(34, 2, 'Royal Pink', 'royal pink', '', '2022-11-18 11:32:58', '1', '2022-11-18 16:02:58'),
(35, 2, 'Royal Green ', 'royal green ', '', '2022-11-18 11:33:29', '1', '2022-11-18 16:03:29'),
(36, 1, '70*110', '70 110', '', '2022-11-18 11:36:05', '1', '2022-11-18 16:06:05'),
(37, 2, 'PEACH', 'peach', '', '2022-11-18 11:59:01', '1', '2022-11-18 16:29:01'),
(38, 2, 'DARK GREEN', 'dark green', '', '2022-11-18 11:59:23', '1', '2022-11-18 16:29:23'),
(39, 2, 'DARK PINK', 'dark pink', '', '2022-11-18 11:59:39', '1', '2022-11-18 16:29:39'),
(40, 2, 'BLACK + MAHROON', 'black   mahroon', '', '2022-11-18 11:59:51', '1', '2022-11-18 16:29:51'),
(41, 2, 'GREEN', 'green', '', '2022-11-18 12:00:05', '1', '2022-11-18 16:30:05'),
(42, 2, 'BLACK + GOLD', 'black   gold', '', '2022-11-18 12:00:23', '1', '2022-11-18 16:30:23'),
(43, 2, 'DARK PURPLE', 'dark purple', '', '2022-11-18 12:00:42', '1', '2022-11-18 16:30:42'),
(44, 2, 'BROWN', 'brown', '', '2022-11-18 12:01:03', '1', '2022-11-18 16:31:03'),
(45, 2, 'BOTTLE BLUE', 'bottle blue', '', '2022-11-18 12:01:38', '1', '2022-11-18 16:31:38'),
(46, 2, 'BURGUNDY', 'burgundy', '', '2022-11-18 12:01:50', '1', '2022-11-18 16:31:50'),
(47, 2, 'PURPLE', 'purple', '', '2022-11-18 12:02:02', '1', '2022-11-18 16:32:02'),
(48, 2, 'OFF WHITE', 'off white', '', '2022-11-18 12:02:14', '1', '2022-11-18 16:32:14'),
(49, 2, 'LIGHT GOLD', 'light gold', '', '2022-11-18 12:02:32', '1', '2022-11-18 16:32:32'),
(50, 2, 'LIGHT GREEN', 'light green', '', '2022-11-18 12:02:55', '1', '2022-11-18 16:32:55'),
(51, 2, 'CAMEL', 'camel', '', '2022-11-18 12:03:15', '1', '2022-11-18 16:33:15'),
(52, 2, 'GREEN YELLOW', 'green yellow', '', '2022-11-18 12:03:41', '1', '2022-11-18 16:33:41'),
(53, 2, 'LIGHT PINK', 'light pink', '', '2022-11-18 12:04:06', '1', '2022-11-18 16:34:06'),
(54, 2, 'BISCUIT', 'biscuit', '', '2022-11-18 12:04:23', '1', '2022-11-18 16:34:23'),
(55, 1, '175 CM * 70 CM', '175 cm   70 cm', '', '2022-11-18 12:05:27', '1', '2022-11-18 16:35:27'),
(56, 1, '176 CM * 70 CM', '176 cm   70 cm', '', '2022-11-18 12:05:47', '1', '2022-11-18 16:35:47'),
(57, 1, '177 CM * 70 CM', '177 cm   70 cm', '', '2022-11-18 12:06:02', '1', '2022-11-18 16:36:02'),
(58, 1, '175 CM * 85 CM', '175 cm   85 cm', '', '2022-11-18 12:06:15', '1', '2022-11-18 16:36:15'),
(59, 1, '180 CM * 70 CM', '180 cm   70 cm', '', '2022-12-08 07:18:26', '1', '2022-12-08 11:48:26'),
(60, 2, 'AQUA BLUE', 'aqua blue', '', '2022-12-09 11:32:07', '1', '2022-12-09 16:02:07'),
(61, 2, 'PEACH BLACK', 'peach black', '', '2023-01-24 12:05:37', '1', '2023-01-24 05:05:37'),
(62, 2, 'COOPER BROWN', 'cooper brown', '', '2023-01-25 05:54:42', '1', '2023-01-24 22:54:42'),
(63, 2, 'PISTACHIO', 'pistachio', '', '2023-01-25 08:59:38', '1', '2023-01-25 01:59:38'),
(64, 2, 'ROYAL CREAM', 'royal cream', '', '2023-01-27 05:25:26', '1', '2023-01-26 22:25:26'),
(65, 2, 'ROYAL BLACK', 'royal black', '', '2023-01-27 05:30:45', '1', '2023-01-26 22:30:45'),
(66, 2, 'ROYAL MAHROON', 'royal mahroon', '', '2023-01-27 05:30:59', '1', '2023-01-26 22:30:59'),
(67, 2, 'ROYAL WHITE', 'royal white', '', '2023-01-27 06:00:52', '1', '2023-01-26 23:00:52'),
(68, 2, 'LAVENDER', 'lavender', '', '2023-01-30 06:06:19', '1', '2023-01-29 23:06:19'),
(69, 2, 'CREAM+RED', 'cream red', '', '2023-01-30 06:13:11', '1', '2023-01-29 23:13:11'),
(70, 2, 'BABY PINK', 'baby pink', '', '2023-01-30 06:31:31', '1', '2023-01-29 23:31:31'),
(71, 2, 'LIGHT PEACH', 'light peach', '', '2023-01-30 06:48:15', '1', '2023-01-29 23:48:15'),
(72, 2, 'DARK OLIVE', 'dark olive', '', '2023-01-31 06:49:22', '1', '2023-01-30 23:49:22'),
(73, 2, 'TEAL', 'teal', '', '2023-01-31 06:57:06', '1', '2023-01-30 23:57:06'),
(74, 2, 'DARK BLUE', 'dark blue', '', '2023-01-31 07:29:53', '1', '2023-01-31 00:29:53'),
(75, 2, 'UMBER', 'umber', '', '2023-02-07 11:56:51', '1', '2023-02-07 04:56:51'),
(76, 2, 'TINE BLUE', 'tine blue', '', '2023-02-07 12:13:42', '1', '2023-02-07 05:13:42'),
(77, 2, 'YELLOW BROWN', 'yellow brown', '', '2023-02-07 12:30:25', '1', '2023-02-07 05:30:25'),
(78, 2, 'WOOD ', 'wood ', '', '2023-02-08 05:49:55', '1', '2023-02-07 22:49:55'),
(79, 2, 'GREY BLACK', 'grey black', '', '2023-02-15 12:29:40', '1', '2023-02-15 05:29:40'),
(80, 2, 'DARK TEAL', 'dark teal', '', '2023-02-16 05:29:52', '1', '2023-02-15 22:29:52'),
(81, 2, 'MULTICOLOUR', 'multicolour', '', '2023-02-16 05:34:55', '1', '2023-02-15 22:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `products_brands`
--

CREATE TABLE `products_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE `products_categories` (
  `id` int(11) NOT NULL,
  `parent_category` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `cat_slug` varchar(150) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `banner_heading` varchar(255) NOT NULL,
  `banner_description` text NOT NULL,
  `banner_label` varchar(255) NOT NULL,
  `banner_url` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_categories`
--

INSERT INTO `products_categories` (`id`, `parent_category`, `name`, `description`, `cat_slug`, `photo`, `alt`, `banner_heading`, `banner_description`, `banner_label`, `banner_url`, `status`, `meta_title`, `meta_description`, `meta_keyword`, `createDate`, `UpdateDate`) VALUES
(1, 0, 'New Arrivals ', '', 'new-arrivals', '85d7a0807d34888f21e1862d622ef6fa.png', 'Alt', '', '', '', '', '1', '', '', '', '2022-11-10 14:39:28', '2022-11-10 14:39:28'),
(2, 0, 'Women Wear', '', 'women-wear', '65169015535540428d3594c594677da5.png', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:39:44', '2022-11-10 14:39:44'),
(6, 0, 'BOTTOM WEAR', '', 'bottom-wear', 'fceebdaf1cfb32c4772e0505c330cd7a.png', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:41:16', '2022-11-10 14:41:16'),
(7, 0, 'Men Wear', '', 'men-wear', '', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:41:34', '2022-11-10 14:41:34'),
(8, 0, 'Rugs', '', 'rugs', '', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:41:53', '2022-11-10 14:41:53'),
(9, 0, 'PREMIUM VELVET RUG', '', 'velvet-rugs', '', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:42:11', '2022-11-10 14:42:11'),
(10, 8, '3D LUXURIUS', '', '3d-luxurius-rugs', '', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:42:26', '2022-11-10 14:42:26'),
(11, 0, 'LUX EXTRA', '', 'lux-extra-rugs', '', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:42:45', '2022-11-10 14:42:45'),
(12, 0, 'Abayas', '<p><strong>Discover the Best Abayas for Women at AL Pasban</strong></p>\r\n\r\n<p><strong>A Variety of Fashionable Abayas</strong></p>\r\n\r\n<p>Women&#39;s&nbsp;Abaya Dress Online&nbsp;in a variety of trendy styles are available at AL Pasban. You can find the ideal abaya to complement your individual sense of style because our abayas are made to accommodate the needs of ladies of all sizes. We have a wide selection of&nbsp;Turkish Abaya Online&nbsp;hues, designs, and cuts so you can choose the ideal abaya to suit your preferences.</p>\r\n\r\n<p><strong>Material that is at ease and breathable</strong></p>\r\n\r\n<p>Our&nbsp;Abaya Dress Online&nbsp;has fashionable designs in addition to being made of premium, cozy, and breathable materials. Our&nbsp;Turkish Abaya Online&nbsp;will keep you feeling cozy and looking wonderful whether you&#39;re doing chores around the house, going to a special event, or just hanging out.</p>\r\n\r\n<p><strong>Affordability and Shipping Free</strong></p>\r\n\r\n<p>We at AL Pasban are committed to providing our clients the best items at competitive costs. You can locate the ideal&nbsp;Black Abaya Online&nbsp;without going over your spending limit because our abayas are priced to fit any budget. Additionally, we provide free delivery on all purchases so you may get even bigger discounts.</p>\r\n\r\n<p><strong>Attire that is modest and elegant</strong></p>\r\n\r\n<p>Women who desire to appear modest and sophisticated should wear a&nbsp;Black Abaya Online. Our abayas are made to offer complete coverage, allowing you to feel secure and at ease in any situation. Our&nbsp;Embroidered Abaya&nbsp;will keep you feeling amazing whether you&#39;re relaxing around the home, running errands, or attending a special event.</p>\r\n\r\n<p>Finally, AL Pasban is the only place to go if you want a high-quality, fashionable, and comfy abaya. Our&nbsp;Embroidered Abaya&nbsp;are constructed from high-quality materials, are offered at competitive costs, and are available in a vast array of hues, designs, and patterns. You can&#39;t go wrong when you shop with AL Pasban thanks to our personalization options and free shipping.</p>\r\n', 'abayas', '7c1acae0e9a81c46922da516afd67ee5.png', 'Abaya Dress Online', '', '', '', '', '1', 'Embroidered Abaya Dress Online, Turkish Abaya Online', 'Discover a stunning collection of Turkish Abaya online at Alpasban.com Elevate your modest fashion with our stylish black Abaya & embroidered abaya that caters to all your needs.', 'Abaya Dress Online, Black Abaya Online, Turkish Abaya Online, Embroidered Abaya', '2022-11-10 14:42:59', '2022-11-10 14:42:59'),
(13, 0, 'Perfumes', '', 'perfumes', '', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:43:21', '2022-11-10 14:43:21'),
(14, 0, 'UD', '', 'ud', '', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:43:39', '2022-11-10 14:43:39'),
(15, 0, 'Mask', '', 'mask', '', '', '', '', '', '', '1', '', '', '', '2022-11-10 14:44:12', '2022-11-10 14:44:12'),
(16, 0, 'The New Collection', 'A NEW COLLECTION OF PRODUCTS HAS JUST BEEN ADDED TO OUR WEBSITE. EXPLORE THE LATEST ARRIVALS AND FIND SOMETHING PERFECT FOR YOURSELF OR A LOVED ONE TODAY!', 'the-new-collection', '', '', '', '', '', '', '1', '', '', '', '2022-11-14 10:03:32', '2022-11-14 10:03:32'),
(19, 0, 'Hijab', '<p><strong>AL Pasban: The Importance of Buying Hijab from Us</strong></p>\r\n\r\n<p>Muslim women&#39;s clothing must include the hijab, which symbolizes their religion and cultural heritage. Many women choose to wear it for stylistic and religious reasons, making it a growingly well-liked fashion accessory. To suit the needs of our customers, AL Pasban offers a wide selection of high-quality&nbsp;Designer Hijabs. We do this because we recognize the significance of the hijab in a woman&#39;s life.</p>\r\n\r\n<p><strong>Religious Significance</strong></p>\r\n\r\n<p>The hijab worn by Muslim women is required by their faith. The hijab is a representation of modesty and humility that reflects Islamic principles and values. It is a means by which women can express their dedication to upholding their moral standards and their devotion to their religion. Muslim women assume a major responsibility by deciding to wear&nbsp;Designer Hijabs, which is a personal and outward expression of their religious convictions.</p>\r\n\r\n<p><strong>Cultural Identity</strong></p>\r\n\r\n<p>In addition to its religious significance, the hijab has tremendous cultural significance. Because it is an external representation of a woman&#39;s heritage and traditions, it is typically seen as a symbol of cultural pride. Muslim women frequently&nbsp;Buy Hijab Online&nbsp;to express their cultural identity, assert their social status, and pay tribute to their ancestors.</p>\r\n\r\n<p><strong>Fashion</strong></p>\r\n\r\n<p>Many women now choose to&nbsp;Buy Hijab Online&nbsp;for both religious and aesthetic reasons, making it a growingly well-liked fashion accessory. Hijab offers a distinctive and adaptable fashion alternative, with a variety of designs, hues, and materials to select from. Hijab lends a sense of sophistication and elegance to any look, whether it is worn alone or with a more ornate attire.</p>\r\n\r\n<p><br />\r\nEventually, the&nbsp;Hijab Stoles Online&nbsp;is a crucial component of Muslim women&#39;s clothing, symbolizing their faith, cultural identity, and sense of style. At AL Pasban, we are committed to providing premium hijab goods that satisfy our client&#39;s demands and preferences. We have the things you need to stand out and express your uniqueness, whether you&#39;re looking for&nbsp;Hijab Stoles Online&nbsp;for religious or aesthetic reasons.</p>\r\n', 'hijab', '4d7ca96f7edaf0ca21776d907e69a9c9.png', 'Designer Hijabs', '', '', '', '', '1', 'Buy Designer Hijab Stoles Online', 'Get an exclusive range of Designer Hijabs at Alpasban.com. We have an attractive range of hijab stoles.  Alpasban.com is your one-stop destination to buy hijabs online.', 'Designer Hijabs, Buy Hijab Online, Hijab Stoles Online', '2022-11-14 10:03:32', '2022-11-14 10:03:32'),
(20, 0, 'TOP WEAR', '', 'top-wear', '05b8769c6c97508675521ac3bd8bfedd.png', '', '', '', '', '', '1', '', '', '', '2022-12-02 17:06:00', '2022-12-02 17:06:00'),
(21, 0, 'SETS & DRESSES', '', 'sets-dresses', '60e15ed8f2f4e475a2f43b74094920e0.png', '', '', '', '', '', '1', '', '', '', '2022-12-02 17:06:24', '2022-12-02 17:06:24'),
(22, 0, 'NIQABS', '', 'niqabs', '662675ec7b6405ba7b259b67579523c5.png', '', '', '', '', '', '1', '', '', '', '2022-12-02 17:16:00', '2022-12-02 17:16:00'),
(23, 0, 'PARTY WEAR HIJAB', '', 'party-wear-hijab', '64535d07a324704d20ba66f4c404c69a.png', '', '', '', '', '', '1', '', '', '', '2022-12-02 18:01:32', '2022-12-02 18:01:32'),
(24, 0, 'DAILY WEAR HIJAB', '', 'daily-wear-hijab', '98422b484675b3a2ea95fb36c1bb87f4.png', '', '', '', '', '', '1', '', '', '', '2022-12-02 18:02:12', '2022-12-02 18:02:12'),
(25, 0, 'COMFORT DODIYA', '', 'comfort-dodiya', '', '', '', '', '', '', '1', '', '', '', '2022-12-02 18:05:25', '2022-12-02 18:05:25'),
(26, 0, 'ELEGANCE', '', 'elegance', '', '', '', '', '', '', '1', '', '', '', '2022-12-02 18:05:45', '2022-12-02 18:05:45'),
(27, 8, 'MULTICOLOUR', '', 'multicolour', '', '', '', '', '', '', '1', '', '', '', '2022-12-02 18:05:58', '2022-12-02 18:05:58'),
(28, 0, 'PRAYER RUGS', '<p><b>AL Pasban: The Purpose of Buying Prayer Rugs from Us</b></p>\r\n\r\n<p>Islam places a strong emphasis on prayer, which is also a significant daily habit for many Muslims. For individuals who pray every day, a prayer mat is a necessary item because it offers a pristine and cozy surface. At AL Pasban, we take great pride in providing a huge selection of premium <b>Prayer Rugs Online</b> that are created to satisfy the requirements of our clients.</p>\r\n\r\n<p><b>Variety of Styles</b></p>\r\n\r\n<p>The range of styles and designs that we provide is one of the main advantages of purchasing <b>Prayer Rugs Online</b> from AL Pasban. We provide prayer carpets in both traditional and contemporary styles so you may find one that suits your needs and personal taste. Finding the ideal prayer rug is simply because of the variety of colors, designs, and materials in our collection.</p>\r\n\r\n<p><b>Easy to Clean</b></p>\r\n\r\n<p>Since a prayer rug is a daily usage item, it is crucial to pick one that is simple to clean and maintain. We at AL Pasban are aware of this requirement and provide machine-washable, hygienic <b>Prayer Mat Online</b>. This makes it simple to maintain your prayer rug&#39;s best appearance despite frequent use.</p>\r\n\r\n<p><b>Customer Satisfaction</b></p>\r\n\r\n<p>Customer satisfaction is our first goal at AL Pasban. We are committed to offering premium <b>Prayer Mat Online</b> and top-notch customer support. We have a helpful and educated staff on hand to address any queries you may have and assist you in selecting the ideal prayer mat for your requirements.</p>\r\n\r\n<p>There are many benefits to choosing AL Pasban for your <b>Namaz Mat Online</b> needs. Whether you are looking for a traditional or modern design, high-quality materials, affordable prices, or exceptional customer service, we have what you need. So why reach out to us for buying prayer rugs? Because we offer a wide range of <b>Namaz Mat Online</b> to meet the needs of our customers, and we are committed to providing the highest quality products and customer service.</p>\r\n', 'prayer-rugs', '1a74b73396475264e9151870f602c369.png', 'Prayer Rugs Online', '', '', '', '', '1', 'Prayer Namaz Mat Online | Prayer Rugs Online', 'Browse the premium collection of Prayer Namaz Mats online at Alpasban.com. We have a wide range of prayer rugs online. Shop now and elevate your prayer rituals with our high-quality Prayer Namaz Mats, with fast delivery and easy returns.', 'Prayer Rugs Online, Prayer Mat Online, Namaz Mat Online', '2022-12-08 16:15:22', '2022-12-08 16:15:22'),
(29, 0, 'TURKISH CARAVANSARY RUGS', '', 'turkish-caravansary-rugs', '', '', '', '', '', '', '1', '', '', '', '2023-01-27 04:32:47', '2023-01-27 04:32:47'),
(30, 0, 'DODIYA RUGS', '', 'dodiya-rugs', '', '', '', '', '', '', '1', '', '', '', '2023-02-07 23:32:48', '2023-02-07 23:32:48'),
(31, 0, 'ELEGANCE CHENNILE RUGS', '', 'elegance-chennile-rugs', '', '', '', '', '', '', '1', '', '', '', '2023-02-07 23:35:12', '2023-02-07 23:35:12'),
(32, 0, 'SUPERIOR MULTICOLOUR RUGS', '', 'superior-multicolour-rugs', '', '', '', '', '', '', '1', '', '', '', '2023-02-15 22:32:25', '2023-02-15 22:32:25'),
(33, 0, 'Pakistani Suit', '<p><strong>Get Your Perfect Designer Pakistani Suit Online</strong></p>\r\n\r\n<p><br />\r\nA great example of this is Pakistani suits. Pakistan is renowned for its vibrant culture and distinctive clothing. Because they combine elegance, style, and comfort, designer Pakistani suits online are a popular choice for formal occasions. If you&#39;re looking for the best designer Pakistani suit, look no further than an internet retailer like Al-Pasban.</p>\r\n\r\n<p><strong>Wide Selection of Designs</strong></p>\r\n\r\n<p>When you purchase designer Pakistani suits online from us at Al-Pasban, you have a wide selection of designs and styles to choose from. Finding the perfect suit to suit your preferences and sense of style is simple thanks to the large selection of suits available, ranging from traditional to modern. To ensure you get the right suit for the occasion, you may also select from a selection of fabrics and colors.</p>\r\n\r\n<p><strong>Convenient Shopping Experience</strong></p>\r\n\r\n<p>Online Pakistani Party Wear Suit shopping is easy and convenient. You don&#39;t need to venture out to a real store and deal with crowds because you can shop with us from the comfort of your home. You may quickly and easily compare styles and prices before placing your order with just a few clicks. This makes it simple to find the perfect suit without having to leave your home.</p>\r\n\r\n<p><strong>Affordable Prices</strong></p>\r\n\r\n<p>The cost of a designer Pakistani Party Wear Suit is reasonable when you purchase them online from us at Al-Pasban. Online retailers can offer the same high-quality suits at lower prices because their overhead expenses are frequently lower than those of conventional retailers. Additionally, you can get deals and discounts when buying online, bringing the price of your item down even more.<br />\r\nDesigner Pakistani suits are a stunning and refined option for important events, and purchasing them online from us has several advantages. You can easily choose the ideal suit thanks to the vast range of designs and styles, low pricing, and easy buying. Online shopping for designer Pakistani suits is the best option if you want a traditional or modern look.<br />\r\n&nbsp;</p>\r\n', 'pakistani-suit', '1ee5bd43d7fdfdf0716ec1a182b3d72c.png', 'Designer Pakistani Suits ', '', '', '', '', '1', 'Designer Pakistani Suits Online | Alpasban.com', 'Buy from the largest collection of Designer Pakistani Suits online at Alpasban.com. We have a wide range of attractive Pakistani Party Wear Suits. Visit our website and order now.', 'Designer Pakistani Suits Online, Pakistani Party Wear Suit', '2023-02-21 08:18:09', '2023-02-21 08:18:09'),
(34, 0, 'Leggings', '<p><strong>Why Choose AL Pasban for Your Leggings Needs?</strong></p>\r\n\r\n<p><strong>Comfortable and Stylish Leggings for All Occasions</strong></p>\r\n\r\n<p>Leggings come in a variety of fashionable and cozy styles from AL Pasban. We offer the ideal pair of Ankle Length Leggings Online for you, whether you&#39;re looking for something to wear regularly or for a special event. Our leggings are crafted from premium fabrics, making them soft, long-lasting, and cozy to wear all day.</p>\r\n\r\n<p><strong>A Versatile Clothing Item</strong></p>\r\n\r\n<p>Because of their adaptability, leggings have become a common piece of clothing. They are appropriate for any event and may be dressed forwards or backward. We have a wide selection of Ankle Length Leggings Online at AL Pasban so you can choose the ideal pair to suit your own preferences and sense of style. You can discover the perfect fit for your body type by choosing from a variety of sizes in our leggings.</p>\r\n\r\n<p><strong>Comfortable and Practical Clothing</strong></p>\r\n\r\n<p>Leggings are a fantastic choice for individuals looking for comfortable and useful clothes in addition to their adaptability. They are fashioned from materials that are flexible and soft, making them ideal for all-day wear. Our leggings will keep you cozy and stylish whether you&#39;re out and about, working out, or just relaxing at home.</p>\r\n\r\n<p><strong>Affordable Prices and Free Shipping</strong></p>\r\n\r\n<p>We at AL Pasban are committed to providing our clients the best items at competitive costs. You can get the ideal pair of Ankle Length Leggings Online without spending a fortune because our prices are flexible to meet any budget. Additionally, we provide free delivery on all purchases so you may get even bigger discounts.</p>\r\n\r\n<p>So, look no further than AL Pasban if you&#39;re seeking high-quality, fashionable, comfortable leggings. You can choose the ideal pair of leggings to go with your individual sense of style because they are constructed from high-quality fabrics and are available in a variety of colors, patterns, and styles. When you shop with AL Pasban, you can&#39;t go wrong with the low rates and free shipping.</p>\r\n', 'leggings', '75378e689ffe34b1d6dc467a29bf6a78.png', 'Ankle Length Leggings ', '', '', '', '', '1', 'Ankle Length Leggings Online', 'Browse through our latest Ankle Length Leggings Online. Our collection offers a wide variety of comfortable and stylish leggings that are perfect for any occasion.', 'Ankle Length Leggings Online', '2023-02-21 08:22:06', '2023-02-21 08:22:06'),
(35, 0, 'Kurtis', '<p><strong>The Best Place to Buy Kurtis for Women - AL Pasban</strong></p>\r\n\r\n<p><strong>Numerous Choices for Every Style</strong></p>\r\n\r\n<p>Women&#39;s kurtis are available in a wide range of styles, hues, and designs at AL Pasban. We have kurtis for any occasion, whether you&#39;re looking for a classic kurti for a formal event or a more contemporary, casual kurti for everyday use. With so many options available, you&#39;re certain to discover the ideal Printed Kurti For Women to complement your individual sense of style.</p>\r\n\r\n<p><strong>Comfortable and Durable Materials</strong></p>\r\n\r\n<p>All of our kurtis are constructed from premium fabrics, making them both comfortable and long-lasting. We offer the ideal choice for you whether you&#39;re looking for a soft cotton Printed Kurti For Women or one made of a more breathable, light fabric. You may wear our kurtis for years to come since they are built to last.</p>\r\n\r\n<p><strong>Customization Options</strong></p>\r\n\r\n<p>We at AL Pasban recognize that each woman is different from the next and has her own sense of style. For this reason, we let you customize your Long Kurti For Women. You can select your kurti&#39;s color, pattern, and style to discover the one that best reflects your individual sense of style.</p>\r\n\r\n<p><strong>Ideal for Any Occasion</strong></p>\r\n\r\n<p>Kurtis is a versatile clothing item that can be used in a variety of settings. Whether you&#39;re getting ready for a wedding or simply running errands, our kurtis will keep you feeling well and looking fantastic. You are certain to find a Long Kurti For Women that meets your demands because there is a range of them available for every occasion.</p>\r\n', 'kurtis', '77aa85307f1663b52fef1282db8980f1.png', 'Printed Kurti For Women', '', '', '', '', '1', 'Printed Kurti For Women Online', 'Explore a stunning collection of Long Kurtis for women online at Alpasban.com. Discover our Black Kurti collection, perfect for adding a touch of elegance to your wardrobe.', 'Printed Kurti For Women, Long Kurti For Women, Black Kurti For Women', '2023-02-21 08:28:19', '2023-02-21 08:28:19'),
(36, 0, 'Dubai Abayas', '<p><strong>Shop the Best Dubai Abayas at AL Pasban</strong></p>\r\n\r\n<p><strong>Discover a Wide Range of Dubai Abayas</strong></p>\r\n\r\n<p>We have a large selection of women&#39;s Dubai abayas at AL Pasban. You can find the ideal Dubai Style Abaya to complement your individual sense of style because our abayas are made to accommodate the needs of ladies of all sizes. We have a wide selection of hues, designs, and cuts so you can choose the ideal abaya to suit your preferences.</p>\r\n\r\n<p><strong>Experience the Best in Comfort and Quality</strong></p>\r\n\r\n<p>Our Dubai Style Abaya is created with premium, cozy, and breathable materials in addition to their fashionable designs. Our abayas will keep you feeling cozy and looking wonderful whether you&#39;re doing chores around the house, going to a special event, or just hanging out.</p>\r\n\r\n<p><strong>Choices for Customization</strong></p>\r\n\r\n<p>We at AL Pasban recognize that each woman is different from the next and has her own sense of style. For this reason, we let you customize your Dubai Abaya Collection. Your abaya can be customized in terms of color, pattern, and design, allowing you to pick one that perfectly matches your individual sense of style.</p>\r\n\r\n<p><strong>Embrace Dubai&#39;s culture and fashion</strong></p>\r\n\r\n<p>Dubai-made abayas are well known for their stylish patterns and fine fabrics. You may experience Dubai&#39;s culture and elegance when you buy with AL Pasban, no matter where you are in the globe. Our Dubai abayas are designed to offer full coverage, enabling you to feel secure and comfortable in any circumstance.</p>\r\n\r\n<p>Finally, look no more than AL Pasban if you&#39;re seeking for high-quality Dubai Abaya Collection that is both fashionable and cozy. Our abayas are constructed from high-quality materials, offered in a variety of hues, patterns, and designs, and are reasonably priced. When you shop with AL Pasban, you can&#39;t go wrong with our personalization options and free shipping.</p>\r\n', 'dubai-abayas', '', 'Dubai Style Abaya', '', '', '', '', '1', 'Dubai Style Abaya, Dubai Abaya Collection | Alpasban.com', 'Elevate your modest fashion with our exquisite collection of Dubai style Abayas online. Browse through our latest Dubai Abaya collection and discover the perfect piece to complement your unique style. Shop now and indulge in the glamour of Dubai fashion, with fast delivery and easy returns.', 'Dubai Style Abaya, Dubai Abaya Collection', '2023-02-21 08:37:42', '2023-02-21 08:37:42'),
(37, 0, 'Front Open Abayas', '<p><strong>Discover the Benefits of Front Open Abayas at AL Pasban</strong></p>\r\n\r\n<p><strong>Comfortable and Convenient Design</strong></p>\r\n\r\n<p>We at AL Pasban are committed to giving our clients the comfiest and most practical products we can. This is taken into account in the design of our Front Open Abaya. You can rapidly get dressed and undressed without any fuss because they are simple to put on and take off.</p>\r\n\r\n<p><strong>Flexible and Airy Material</strong></p>\r\n\r\n<p>Our Front Open Abaya features a practical design in addition to being composed of supple, breathable materials. They are therefore ideal for women who are constantly on the go. Our front-open abayas will keep you cool and comfortable whether you&#39;re doing chores around the house, going to a special event, or both.</p>\r\n\r\n<p><strong>Elegant and Fashionable Design</strong></p>\r\n\r\n<p>Every lady wants to appear her best, and at AL Pasban we acknowledge this. Because of this, we provide a broad selection of front-open abayas in a range of hues, designs, and patterns. Our front open abayas are made to be fashionable so you can look fantastic wherever you go.</p>\r\n\r\n<p><strong>Cost Saving and Free Shipping</strong></p>\r\n\r\n<p>We at AL Pasban are committed to providing our clients the best items at competitive costs. You can locate the ideal abaya without going over your budget thanks to the affordable prices of our front-open abayas. Additionally, we provide free delivery on all purchases so you may get even bigger discounts.</p>\r\n\r\n<p><strong>Perfect for All Occasions</strong></p>\r\n\r\n<p>Our Front Open Abaya is appropriate in every situation. Whether you&#39;re lounging around the house, running errands, or going out and about, our front-open abayas are designed to provide full coverage and comfort.</p>\r\n\r\n<p>Finally, check for AL Pasban if you&#39;re searching for front-open abayas that are cozy, practical, and fashionable. Our front open abayas are constructed from high-quality materials, are offered in a variety of hues, designs, and sizes, and are reasonably priced. When you shop with AL Pasban, you can&#39;t go wrong with our personalization options and free shipping.</p>\r\n', 'front-open-abayas', '9e8db4bca654387c6b87c39a7f04bf32.png', 'Front Open Abaya', '', '', '', '', '1', 'Front Open Abayas Online ', 'Get a stunning range of Front Open Abayas online at Alpasban.com. Browse our Front Open Abaya collection today and enjoy fast delivery and easy returns. ', 'Front Open Abaya', '2023-02-21 08:54:57', '2023-02-21 08:54:57'),
(38, 0, 'Palazzo', '<p><strong>AL Pasban: Your Guide to Finding the Best Chikankari Palazzo Online</strong></p>\r\n\r\n<p>Chikankari, an ancient form of needlework from India, is known for its intricate and delicate designs. Chikankari palazzos are a popular choice for people who want to add a little sophistication to their outfits. Since we understand how vital it is to provide high-quality chikankari palazzos, AL Pasban strives to offer the best selection of chikankari palazzos online.</p>\r\n\r\n<p><strong>Consider the Material</strong></p>\r\n\r\n<p>The material is one of the most crucial aspects to take into account when selecting a chikankari palazzo. Since chikankari palazzos are intended to be worn frequently, it is crucial to pick a material that is both cozy and sturdy. To make sure you can discover a palazzo that suits your needs, AL Pasban offers a variety of materials, including cotton, silk, and more.</p>\r\n\r\n<p><strong>Examine the Embroidery</strong></p>\r\n\r\n<p>Chikankari palazzos are characterized by their needlework, so it&#39;s critical to pick one with excellent stitching. When choosing the best Chikankari Palazzo Online, we at AL Pasban take great care to ensure that each one is exquisitely and skillfully stitched. Our chikankari palazzos come in a variety of designs, from classic floral patterns to modern patterns, to suit every taste.</p>\r\n\r\n<p><strong>Check for Comfort</strong></p>\r\n\r\n<p>It&#39;s critical to think about the palazzo&#39;s comfort in addition to the fabric and embroidery. A Chikankari Palazzo Online that is both comfortable to wear and allows for a complete range of sizes is what you want to choose. Our palazzos feature a casual fit that is both fashionable and useful, and they are made with comfort in mind.</p>\r\n\r\n<p>In conclusion, carefully weighing several important elements, such as material, embroidery, comfort, and customer feedback is necessary to get the best chikankari palazzo online. We at AL Pasban are dedicated to giving our customers the best choice of chikankari palazzos, delivering a variety of materials, designs, and pricing to suit their demands. Therefore, AL Pasban is the only place to turn to when looking for the greatest chikankari palazzo online.</p>\r\n', 'palazzo', 'ad6603eafbd58f73a42a4c50a02f1c4c.png', 'Chikankari Palazzo Online', '', '', '', '', '1', 'Chikankari Palazzo Online ', 'Browse a stunning collection of Chikankari Palazzo Online only at Alpasban.com. Shop now Chikankari Palazzo, and enjoy the convenience of online shopping.', 'Chikankari Palazzo Online', '2023-02-21 09:00:55', '2023-02-21 09:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `products_color`
--

CREATE TABLE `products_color` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_color`
--

INSERT INTO `products_color` (`id`, `name`, `status`, `createDate`, `updateDate`) VALUES
(2, 'NAVY BLUE', '1', '2022-12-05 09:02:01', '2022-12-05 13:32:01'),
(3, 'DARK GREY', '1', '2022-12-05 09:48:09', '2022-12-05 14:18:09'),
(4, 'BOTTLE GREEN', '1', '2022-12-05 09:48:22', '2022-12-05 14:18:22'),
(5, 'SKY BLUE', '1', '2022-12-05 09:48:33', '2022-12-05 14:18:33'),
(6, 'MAHROON', '1', '2022-12-05 09:48:56', '2022-12-05 14:18:56'),
(7, 'WINE', '1', '2022-12-05 09:49:08', '2022-12-05 14:19:08'),
(8, 'BLUE', '1', '2022-12-05 09:49:18', '2022-12-05 14:19:18'),
(9, 'BLACK', '1', '2022-12-05 09:49:26', '2022-12-05 14:19:26'),
(10, 'BLACK + GREEN', '1', '2022-12-05 09:49:40', '2022-12-05 14:19:40'),
(11, 'GOLD', '1', '2022-12-05 09:49:50', '2022-12-05 14:19:50'),
(12, 'MUSTARD', '1', '2022-12-05 09:50:02', '2022-12-05 14:20:02'),
(13, 'FAWN BEIGE', '1', '2022-12-05 09:50:13', '2022-12-05 14:20:13'),
(14, 'SEA GREEN', '1', '2022-12-05 09:50:22', '2022-12-05 14:20:22'),
(15, 'PINK', '1', '2022-12-05 09:50:30', '2022-12-05 14:20:30'),
(16, 'YELLOW', '1', '2022-12-05 09:50:39', '2022-12-05 14:20:39'),
(17, 'BEIGE', '1', '2022-12-05 09:50:48', '2022-12-05 14:20:48'),
(18, 'GREY', '1', '2022-12-05 09:50:57', '2022-12-05 14:20:57'),
(19, 'DARK GOLD', '1', '2022-12-05 09:51:16', '2022-12-05 14:21:16'),
(20, 'MAGENTA PINK', '1', '2022-12-05 09:51:25', '2022-12-05 14:21:25'),
(21, 'WHITE', '1', '2022-12-05 09:51:33', '2022-12-05 14:21:33'),
(22, 'SKIN ', '1', '2022-12-05 09:51:41', '2022-12-05 14:21:41'),
(23, 'RED', '1', '2022-12-05 09:51:55', '2022-12-05 14:21:55'),
(24, 'CREAM', '1', '2022-12-05 09:52:02', '2022-12-05 14:22:02'),
(25, 'LIGHT GREY', '1', '2022-12-05 09:52:10', '2022-12-05 14:22:10'),
(26, 'PEACH', '1', '2022-12-05 11:25:29', '2022-12-05 15:55:29'),
(27, 'OFF WHITE', '1', '2022-12-06 07:38:40', '2022-12-06 12:08:40'),
(28, 'LIGHT GOLD', '1', '2022-12-06 07:38:57', '2022-12-06 12:08:57'),
(29, 'LIGHT GREEN', '1', '2022-12-06 07:39:28', '2022-12-06 12:09:28'),
(30, 'CAMEL', '1', '2022-12-06 07:39:45', '2022-12-06 12:09:45'),
(31, 'GREEN YELLOW', '1', '2022-12-06 07:40:04', '2022-12-06 12:10:04'),
(32, 'LIGHT PINK', '1', '2022-12-06 07:40:26', '2022-12-06 12:10:26'),
(33, 'BISCUIT', '1', '2022-12-06 07:40:39', '2022-12-06 12:10:39'),
(34, 'PURPLE', '1', '2022-12-06 07:40:53', '2022-12-06 12:10:53'),
(35, 'BURGUNDY', '1', '2022-12-06 07:41:04', '2022-12-06 12:11:04'),
(36, 'BOTTLE BLUE', '1', '2022-12-06 07:41:15', '2022-12-06 12:11:15'),
(37, 'BROWN', '1', '2022-12-06 07:41:54', '2022-12-06 12:11:54'),
(38, 'ROYLE BLUE', '1', '2022-12-06 07:42:05', '2022-12-06 12:12:05'),
(39, 'DARK PURPLE', '1', '2022-12-06 07:42:18', '2022-12-06 12:12:18'),
(40, 'BLACK + GOLD', '1', '2022-12-06 07:42:38', '2022-12-06 12:12:38'),
(41, 'BLACK + MAHROON', '1', '2022-12-06 07:42:55', '2022-12-06 12:12:55'),
(42, 'DARK PINK', '1', '2022-12-06 07:43:07', '2022-12-06 12:13:07'),
(43, 'DARK GREEN', '1', '2022-12-06 07:43:19', '2022-12-06 12:13:19'),
(44, 'ROYAL GREY', '1', '2022-12-08 11:59:42', '2022-12-08 16:29:42'),
(45, 'ROYAL PINK', '1', '2022-12-08 12:38:55', '2022-12-08 17:08:55'),
(46, 'ROYAL GREEN ', '1', '2022-12-08 12:47:38', '2022-12-08 17:17:38'),
(47, 'ROYAL BROWN', '1', '2022-12-08 12:56:36', '2022-12-08 17:26:36'),
(48, 'GREEN', '1', '2022-12-09 11:10:01', '2022-12-09 15:40:01'),
(49, 'AQUA BLUE', '1', '2022-12-09 11:29:46', '2022-12-09 15:59:47'),
(50, 'PEACH BLACK', '1', '2023-01-24 12:03:36', '2023-01-24 05:03:36'),
(51, 'COOPER BROWN', '1', '2023-01-25 05:54:57', '2023-01-24 22:54:57'),
(52, 'PISTACHIO', '1', '2023-01-25 08:59:49', '2023-01-25 01:59:49'),
(53, 'ROYAL CREAM', '1', '2023-01-27 05:25:12', '2023-01-26 22:25:12'),
(54, 'ROYAL BLACK', '1', '2023-01-27 05:30:29', '2023-01-26 22:30:29'),
(55, 'ROYAL MAHROON', '1', '2023-01-27 05:31:17', '2023-01-26 22:31:17'),
(56, 'ROYAL WHITE', '1', '2023-01-27 06:00:39', '2023-01-26 23:00:39'),
(57, 'LAVENDER', '1', '2023-01-30 06:06:04', '2023-01-29 23:06:04'),
(58, 'CREAM+RED', '1', '2023-01-30 06:12:57', '2023-01-29 23:12:57'),
(59, 'BABY PINK', '1', '2023-01-30 06:31:17', '2023-01-29 23:31:17'),
(60, 'LIGHT PEACH', '1', '2023-01-30 06:48:01', '2023-01-29 23:48:01'),
(61, 'DARK OLIVE', '1', '2023-01-31 06:49:08', '2023-01-30 23:49:08'),
(62, 'TEAL', '1', '2023-01-31 06:56:53', '2023-01-30 23:56:53'),
(63, 'DARK BLUE', '1', '2023-01-31 07:29:41', '2023-01-31 00:29:41'),
(64, 'UMBER', '1', '2023-02-07 11:56:36', '2023-02-07 04:56:36'),
(65, 'TINE BLUE', '1', '2023-02-07 12:13:29', '2023-02-07 05:13:29'),
(66, 'YELLOW BROWN', '1', '2023-02-07 12:30:12', '2023-02-07 05:30:12'),
(67, 'WOOD ', '1', '2023-02-08 05:49:42', '2023-02-07 22:49:42'),
(68, 'GREY BLACK', '1', '2023-02-15 12:29:25', '2023-02-15 05:29:25'),
(69, 'DARK TEAL', '1', '2023-02-16 05:29:33', '2023-02-15 22:29:33'),
(70, 'MULTICOLOUR', '1', '2023-02-16 05:34:40', '2023-02-15 22:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `products_coupon`
--

CREATE TABLE `products_coupon` (
  `fld_id` int(11) NOT NULL,
  `fld_code` varchar(200) NOT NULL,
  `discount_type` varchar(50) NOT NULL,
  `discount_amount` double NOT NULL,
  `fld_expiry_date` date NOT NULL,
  `fld_status` tinyint(4) NOT NULL,
  `fld_upload_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_coupon`
--

INSERT INTO `products_coupon` (`fld_id`, `fld_code`, `discount_type`, `discount_amount`, `fld_expiry_date`, `fld_status`, `fld_upload_date`) VALUES
(3, 'AL2023', 'flat', 50, '2022-11-30', 1, '2023-02-17 00:00:00'),
(4, 'FIZA100', 'flat', 100, '2023-03-24', 1, '2023-02-25 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products_fabrics`
--

CREATE TABLE `products_fabrics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_fabrics`
--

INSERT INTO `products_fabrics` (`id`, `name`, `status`, `createDate`, `updateDate`) VALUES
(2, 'LAWN COTTON DUPATTA CHIFFON', '1', '2022-11-08 08:21:50', '2022-11-08 12:51:50'),
(3, 'HEAVY RAYON VISCOSE', '1', '2022-11-08 08:22:10', '2022-11-08 12:52:10'),
(4, 'CHANDERI SILK', '1', '2022-11-08 08:22:22', '2022-11-08 12:52:22'),
(5, 'VISCOSE', '1', '2022-11-08 08:22:35', '2022-11-08 12:52:35'),
(6, 'CY CRUSH', '1', '2022-11-08 08:22:46', '2022-11-08 12:52:46'),
(7, 'JAGUAR', '1', '2022-11-08 08:24:22', '2022-11-08 12:54:22'),
(8, 'CY', '1', '2022-11-08 08:24:36', '2022-11-08 12:54:36'),
(9, 'IMPORTED ZOOM', '1', '2022-11-08 08:24:48', '2022-11-08 12:54:48'),
(10, 'IMPORTED CY CRUSH', '1', '2022-11-08 08:25:01', '2022-11-08 12:55:01'),
(11, 'GEORGETTE', '1', '2022-11-08 08:25:16', '2022-11-08 12:55:16'),
(12, 'IMPORTED LYCRA', '1', '2022-11-08 08:25:29', '2022-11-08 12:55:29'),
(13, 'IMPT COTTON+POLYSTER', '1', '2022-11-08 08:25:43', '2022-11-08 12:55:43'),
(14, 'STRECHABLE SHIMMER', '1', '2022-11-08 08:25:54', '2022-11-08 12:55:54'),
(15, 'PREMIUM VISCOSE', '1', '2022-11-08 08:26:08', '2022-11-08 12:56:08'),
(16, 'HEAVY RAYON', '1', '2022-11-08 08:29:12', '2022-11-08 12:59:12'),
(17, 'IMPT NIDA', '1', '2022-11-08 08:31:37', '2022-11-08 13:01:37'),
(18, 'T = Pure Georgette', '1', '2022-11-08 10:28:41', '2022-11-08 14:58:41'),
(19, 'B = Viscose Santoon', '1', '2022-11-08 10:29:40', '2022-11-08 14:59:40'),
(21, 'Dense Velvet', '1', '2022-11-18 11:30:45', '2022-11-18 16:00:45'),
(22, 'FRONT OPEN', '1', '2022-11-18 11:50:01', '2022-11-18 16:20:01'),
(23, 'MODAL SILK', '1', '2022-11-18 11:50:23', '2022-11-18 16:20:23'),
(24, 'T=FOX GEORGETTE', '1', '2022-11-18 11:50:53', '2022-11-18 16:20:53'),
(25, 'B=SANTOON', '1', '2022-11-18 11:51:09', '2022-11-18 16:21:09'),
(26, 'D=NAZMIN', '1', '2022-11-18 11:51:21', '2022-11-18 16:21:21'),
(27, 'COTTON SATIN 95%', '1', '2022-11-18 11:51:48', '2022-11-18 16:21:48'),
(28, 'VISCOSE 5%', '1', '2022-11-18 11:52:01', '2022-11-18 16:22:01'),
(29, 'IMPT COTTON SATIN', '1', '2022-11-18 11:52:13', '2022-11-18 16:22:13'),
(30, 'CIGZI', '1', '2022-11-18 11:52:58', '2022-11-18 16:22:58'),
(31, 'COTTON SHIMMER', '1', '2022-11-18 11:53:23', '2022-11-18 16:23:24'),
(32, 'BANDHA JAKAD', '1', '2022-11-18 11:54:28', '2022-11-18 16:24:28'),
(33, 'COTTON LINEN 95%', '1', '2022-11-18 11:54:45', '2022-11-18 16:24:45'),
(34, 'MUSLIN COTTON', '1', '2022-11-18 11:55:37', '2022-11-18 16:25:37'),
(35, 'CHANDERI COTTON', '1', '2022-11-18 11:56:01', '2022-11-18 16:26:01'),
(36, 'T=PURE GEORGETTE', '1', '2022-11-18 11:56:24', '2022-11-18 16:26:24'),
(37, 'B=VISCOSE SANTOON', '1', '2022-11-18 11:56:37', '2022-11-18 16:26:37'),
(38, 'DUPATTA CHIFFON', '1', '2022-11-18 11:57:35', '2022-11-18 16:27:35'),
(39, 'PURE MUSLIN', '1', '2023-01-25 09:14:04', '2023-01-25 02:14:04'),
(40, 'LUXURY VELVET', '1', '2023-01-31 07:15:47', '2023-01-31 00:15:47'),
(41, 'TURKISH CHENNILE', '1', '2023-02-08 06:05:51', '2023-02-07 23:05:51');

-- --------------------------------------------------------

--
-- Table structure for table `products_gallery`
--

CREATE TABLE `products_gallery` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `gal_photo` varchar(255) NOT NULL,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_gallery`
--

INSERT INTO `products_gallery` (`id`, `product_id`, `gal_photo`, `createDate`, `updateDate`) VALUES
(1, 2, '74e6b4291eef41bf0a134abe053e7d9e.jpg', '2022-11-10 01:37:00', '2022-11-10 18:07:00'),
(2, 2, '9ccf4c70f766f585ba717ed0c1cba406.jpg', '2022-11-10 01:37:00', '2022-11-10 18:07:00'),
(3, 2, '082e25e051a5687b7f2c9d339dca2631.jpg', '2022-11-10 01:37:00', '2022-11-10 18:07:00'),
(4, 2, '697f2c86e8a441f063aa656a3d8c98db.jpg', '2022-11-10 01:37:00', '2022-11-10 18:07:00'),
(5, 2, '5bec29d802175f4be1f980313344af4c.jpg', '2022-11-10 01:37:00', '2022-11-10 18:07:00'),
(6, 2, '1f1de1aef8f6f560c84852042b78c780.jpg', '2022-11-10 01:37:00', '2022-11-10 18:07:00'),
(7, 3, '7c349fdbfca99c502e62f1fec4eceb24.jpg', '2022-11-10 01:43:21', '2022-11-10 18:13:21'),
(8, 3, '2b6f09309406eaa4e04709ad2101a152.jpg', '2022-11-10 01:43:21', '2022-11-10 18:13:21'),
(9, 3, 'b7f29832419f88c406d13205d9594901.jpg', '2022-11-10 01:43:21', '2022-11-10 18:13:21'),
(10, 3, '5d2fe29895fdddfde5dfb94a3b3b01c4.jpg', '2022-11-10 01:43:21', '2022-11-10 18:13:21'),
(11, 3, 'f492f9339743959c7619f6385e2d6fda.jpg', '2022-11-10 01:43:21', '2022-11-10 18:13:21'),
(16, 5, 'df056fadf71ae184cb3892b91060269f.jpg', '2022-11-10 01:47:45', '2022-11-10 18:17:45'),
(17, 5, 'f1fc693aa8f23338dab47347dfda76a2.jpg', '2022-11-10 01:47:45', '2022-11-10 18:17:45'),
(18, 5, 'db0a253dd17867b5dc2fe93dc7a8719a.jpg', '2022-11-10 01:47:45', '2022-11-10 18:17:45'),
(19, 5, '2766c330f7c635fe5dfb4e94bb0dbd06.jpg', '2022-11-10 01:47:45', '2022-11-10 18:17:45'),
(20, 5, '32c98909344cf2acb93a050e34534b6f.jpg', '2022-11-10 01:47:45', '2022-11-10 18:17:45'),
(21, 5, '84bfaec4b294c2236bf56a996a6a2466.jpg', '2022-11-10 01:47:45', '2022-11-10 18:17:45'),
(22, 6, '10ce5ab59471439a7c7592ab7fb9598d.jpg', '2022-11-10 01:50:05', '2022-11-10 18:20:05'),
(23, 6, 'cab3953ee0a1cfc6ed02773009c8a62c.jpg', '2022-11-10 01:50:05', '2022-11-10 18:20:05'),
(24, 6, 'bc2faf2e2e658018144b671e3bbe20a6.jpg', '2022-11-10 01:50:05', '2022-11-10 18:20:05'),
(25, 6, '51a0a4dc3a9c28a95f2cabde9197dc9b.jpg', '2022-11-10 01:50:05', '2022-11-10 18:20:05'),
(26, 6, '3da41ef37136f5ba079869c1506669d0.jpg', '2022-11-10 01:50:05', '2022-11-10 18:20:05'),
(27, 6, 'f19bbca829ce1bb7ff3bccdcd018380a.jpg', '2022-11-10 01:50:05', '2022-11-10 18:20:05'),
(34, 8, 'fcb0b3adc2542ae7d418c9ac9d1df68c.jpg', '2022-11-10 01:54:56', '2022-11-10 18:24:56'),
(35, 8, '6320cbc607b4a79709bf1c268cbca698.jpg', '2022-11-10 01:54:56', '2022-11-10 18:24:56'),
(36, 8, 'a06b214df9df1c12d2caec19914fe897.jpg', '2022-11-10 01:54:56', '2022-11-10 18:24:56'),
(37, 8, '614d6b8310930d1110859825f8ffd8da.jpg', '2022-11-10 01:54:56', '2022-11-10 18:24:56'),
(38, 8, '41c989f5d09a84349cc75479eefa9b5a.jpg', '2022-11-10 01:54:56', '2022-11-10 18:24:56'),
(39, 8, 'ebb0008c1309d6b9645ab185bc3907dd.jpg', '2022-11-10 01:54:56', '2022-11-10 18:24:56'),
(46, 10, '1628a2226924cdff11a184e2e841f0b7.jpg', '2022-11-10 01:59:20', '2022-11-10 18:29:20'),
(47, 10, '741d3911aa702acb4f079405b2b65d04.jpg', '2022-11-10 01:59:20', '2022-11-10 18:29:20'),
(48, 10, '26c5f8b107e44664aca9d3e23dba4615.jpg', '2022-11-10 01:59:20', '2022-11-10 18:29:20'),
(49, 10, 'cf48460186125794dec7dcdc66507189.jpg', '2022-11-10 01:59:20', '2022-11-10 18:29:20'),
(50, 11, '7607a60f12aa2976868e54470b53bef5.jpg', '2022-11-10 02:04:43', '2022-11-10 18:34:43'),
(51, 11, 'e896d3feda4f99d87ef96190e0b1382f.jpg', '2022-11-10 02:04:43', '2022-11-10 18:34:43'),
(52, 11, 'e2e26c73f384394dfe74b0d0092a87ce.jpg', '2022-11-10 02:04:43', '2022-11-10 18:34:43'),
(53, 11, '0d58fdc8dce0c6fc4f2d1be7f31d5ffc.jpg', '2022-11-10 02:04:43', '2022-11-10 18:34:43'),
(54, 12, 'a17494dab6d819a8df8c676fedfb0b45.jpg', '2022-11-10 02:07:33', '2022-11-10 18:37:33'),
(55, 12, 'f79b8563a1b153206f488789d6734617.jpg', '2022-11-10 02:07:33', '2022-11-10 18:37:33'),
(56, 12, 'a47f0926db829c2b81a7d51fa64abbb7.jpg', '2022-11-10 02:07:33', '2022-11-10 18:37:33'),
(57, 12, '9da1bcfada7ce2a8dbc846d49f75d06a.jpg', '2022-11-10 02:07:33', '2022-11-10 18:37:33'),
(58, 13, '25e150fb5dd6fde30d4644a8130ba95f.jpg', '2022-11-10 02:09:37', '2022-11-10 18:39:37'),
(59, 13, '92bbc5c9c748acb939e75d6e38d3d3cb.jpg', '2022-11-10 02:09:37', '2022-11-10 18:39:37'),
(60, 13, 'ebdc5ed5420416d7436d8830d4773129.jpg', '2022-11-10 02:09:37', '2022-11-10 18:39:37'),
(61, 13, 'f660c75da07962b2a26cd8b7587a4fa5.jpg', '2022-11-10 02:09:37', '2022-11-10 18:39:37'),
(62, 14, '967ea3ac986c4ad83ec20fc4ff18c414.jpg', '2022-11-10 02:24:32', '2022-11-10 18:54:32'),
(63, 14, 'ed1980b905ca7a1043a24abf90e51546.jpg', '2022-11-10 02:24:32', '2022-11-10 18:54:32'),
(64, 14, '0db14b1d05f899b70d27c05dc0fdac62.jpg', '2022-11-10 02:24:32', '2022-11-10 18:54:32'),
(65, 14, '7e67c2373646c103d71f827736c53d93.jpg', '2022-11-10 02:24:32', '2022-11-10 18:54:32'),
(66, 15, 'a76ecf99b629a34576287cd5324d5241.jpg', '2022-11-11 11:55:46', '2022-11-11 16:25:46'),
(67, 15, 'a6c85bc63327317a2dcfd60732083c7c.jpg', '2022-11-11 11:55:46', '2022-11-11 16:25:46'),
(68, 15, 'de48179ab1a8a2fe69bf51677dcc3f7a.jpg', '2022-11-11 11:55:46', '2022-11-11 16:25:46'),
(69, 15, '2b9bf38a6b35f03dc9a27c65e937b80f.jpg', '2022-11-11 11:55:46', '2022-11-11 16:25:46'),
(70, 15, '2103df51d5106cb44b2b2030e8881060.jpg', '2022-11-11 11:55:46', '2022-11-11 16:25:46'),
(71, 15, '22826bed75041cb3d043959e167f8d71.jpg', '2022-11-11 11:55:46', '2022-11-11 16:25:46'),
(72, 28, '04ac3cbaff5f687cff921eff48dc362c.jpg', '2022-11-30 02:05:22', '2022-11-30 18:35:22'),
(73, 28, 'aeff59b859f47cd1e27ce6e779fae454.jpg', '2022-11-30 02:05:22', '2022-11-30 18:35:22'),
(74, 28, '49c2e6de9db6420194bc89c5fe630b2b.jpg', '2022-11-30 02:05:22', '2022-11-30 18:35:22'),
(75, 28, '36ce1d333a20868466cb1ceecfb7f337.jpg', '2022-11-30 02:05:22', '2022-11-30 18:35:22'),
(76, 28, 'bdf989b9d1bcbe342ad786ad63732d22.jpg', '2022-11-30 02:05:22', '2022-11-30 18:35:22'),
(77, 27, '8ec30b0dca233c4902da72f400804d42.jpg', '2022-11-30 02:13:54', '2022-11-30 18:43:54'),
(78, 27, '538543e7e7b78ce47c6ed656e4e48e23.jpg', '2022-11-30 02:13:54', '2022-11-30 18:43:54'),
(79, 27, '945e2733bbb401c8bd9ac64c519f669e.jpg', '2022-11-30 02:13:54', '2022-11-30 18:43:54'),
(80, 27, '3290c099babce7dff1b5089add7ad15d.jpg', '2022-11-30 02:13:54', '2022-11-30 18:43:54'),
(81, 26, 'feb7e0e542e083f1c79907ab788670d9.jpg', '2022-12-02 08:01:24', '2022-12-02 12:31:24'),
(82, 26, '3b98c4b132cad4aee0da4c6a9d7646aa.jpg', '2022-12-02 08:01:24', '2022-12-02 12:31:24'),
(83, 26, 'b1ab1a2c280755b146a60e2a57bf15ec.jpg', '2022-12-02 08:01:24', '2022-12-02 12:31:24'),
(84, 26, '858a49d10ab9e6cd96dc10f424c14030.jpg', '2022-12-02 08:01:24', '2022-12-02 12:31:24'),
(85, 26, 'caee1bd54fd5be4e17780c8ee44ee0f6.jpg', '2022-12-02 08:01:24', '2022-12-02 12:31:24'),
(86, 25, '8da2737714ee4cb19249ad7badf2a264.jpg', '2022-12-02 08:10:59', '2022-12-02 12:40:59'),
(87, 25, '4a1aeb310f171b52c32ab3f849df62c8.jpg', '2022-12-02 08:10:59', '2022-12-02 12:40:59'),
(88, 25, '713a87c8cb0512a549d5837ccea843f0.jpg', '2022-12-02 08:10:59', '2022-12-02 12:40:59'),
(89, 25, 'e661f1e936bf99c5bf1e459824d8a5c8.jpg', '2022-12-02 08:10:59', '2022-12-02 12:40:59'),
(90, 24, '6446124c2f7c6b35ac123e7f0cbd171f.jpg', '2022-12-02 08:17:08', '2022-12-02 12:47:08'),
(91, 24, '6d33b6ea8291b9723712d6936afa66ab.jpg', '2022-12-02 08:17:08', '2022-12-02 12:47:08'),
(92, 24, '0b50c9a63c7cda79eeb367b3ee4a6fe3.jpg', '2022-12-02 08:17:08', '2022-12-02 12:47:08'),
(93, 24, 'd9f84f5e68c69dea256f189efc51cea0.jpg', '2022-12-02 08:17:08', '2022-12-02 12:47:08'),
(94, 24, '4f0cb0d517472f0cfafdec63b4cb040e.jpg', '2022-12-02 08:17:08', '2022-12-02 12:47:08'),
(95, 23, 'c9f27d63e462e6ce5a9befde4e45cade.jpg', '2022-12-02 08:23:09', '2022-12-02 12:53:09'),
(96, 23, '9b56440d1c34c75728bf530b89f53cbb.jpg', '2022-12-02 08:23:09', '2022-12-02 12:53:09'),
(97, 23, '0c9409b7c8e8521d8bf982e4305b78f3.jpg', '2022-12-02 08:23:09', '2022-12-02 12:53:09'),
(98, 23, 'bdd27650c291229bd3ac1513671e5b2c.jpg', '2022-12-02 08:23:09', '2022-12-02 12:53:09'),
(99, 23, '4da5639588284ce2c7b8f708df5df8ce.jpg', '2022-12-02 08:23:09', '2022-12-02 12:53:09'),
(100, 22, 'fd6da1fb8138fa4382716817d9f42290.jpg', '2022-12-02 08:33:35', '2022-12-02 13:03:35'),
(101, 22, 'ff6cf9f4c4585c35890fe7100ab06a66.jpg', '2022-12-02 08:33:35', '2022-12-02 13:03:35'),
(102, 22, '61f706d9ab58f8817f2a197b90b11a7a.jpg', '2022-12-02 08:33:35', '2022-12-02 13:03:35'),
(103, 22, '8fe262d1ca2a6946337a3f623d349f99.jpg', '2022-12-02 08:33:35', '2022-12-02 13:03:35'),
(104, 22, 'e5a5e5ea4c2e5382520f42f9d6436aba.jpg', '2022-12-02 08:33:35', '2022-12-02 13:03:35'),
(105, 22, '7ba059a03f53a555aaf5bf1eb9217c04.jpg', '2022-12-02 08:33:35', '2022-12-02 13:03:35'),
(106, 21, '944096fe6f0f767120193e46e25c5de2.jpg', '2022-12-02 08:40:24', '2022-12-02 13:10:24'),
(107, 21, '1fd947b38118c8a70d57461c332e69ef.jpg', '2022-12-02 08:40:24', '2022-12-02 13:10:24'),
(108, 21, 'c462291352e1d82f3de2bcecbdb1cadb.jpg', '2022-12-02 08:40:24', '2022-12-02 13:10:24'),
(109, 21, '91f9acea3d6ab8edfb75af50215c7de8.jpg', '2022-12-02 08:40:24', '2022-12-02 13:10:24'),
(110, 21, '6ec3699b9b15a29d6f0cb6f4fdb311cd.jpg', '2022-12-02 08:40:24', '2022-12-02 13:10:24'),
(111, 20, '2ecea860e5caa2f0b8e0f96629447925.jpg', '2022-12-02 08:47:11', '2022-12-02 13:17:11'),
(112, 20, '126b6c4c7a32e5d8de846fe778a62428.jpg', '2022-12-02 08:47:11', '2022-12-02 13:17:11'),
(113, 20, '7f98ea2d95110ed71277fad98c672646.jpg', '2022-12-02 08:47:11', '2022-12-02 13:17:11'),
(114, 20, 'b10e62cd222767f7366cab3490348498.jpg', '2022-12-02 08:47:11', '2022-12-02 13:17:11'),
(121, 33, 'fd127605a4e7db8fc6af544d813923d5.jpg', '2022-12-06 12:44:24', '2022-12-06 17:14:24'),
(122, 33, 'd980c4c5037cbc3207a26800cff58e5f.jpg', '2022-12-06 12:44:24', '2022-12-06 17:14:24'),
(123, 33, '424d722e1c2f86ced328be1703fa93c1.jpg', '2022-12-06 12:44:24', '2022-12-06 17:14:24'),
(124, 33, '2a4ee2fdaaf21da76b704287e73e31e7.jpg', '2022-12-06 12:44:24', '2022-12-06 17:14:24'),
(125, 33, 'bcbcc661b7f7c6727a9a3a115c48b146.jpg', '2022-12-06 12:44:24', '2022-12-06 17:14:24'),
(126, 33, '0273584d0d156cec1c9bdc527b2b1e46.jpg', '2022-12-06 12:44:24', '2022-12-06 17:14:24'),
(127, 30, '8a2a122f2c582fd27212cc926ef15fe9.jpg', '2022-12-06 12:59:09', '2022-12-06 17:29:09'),
(128, 30, 'a085c4463b54ab3e48b2d355521494c7.jpg', '2022-12-06 12:59:09', '2022-12-06 17:29:09'),
(129, 30, '722aae7500fc8654bcc98cfb8925cfc6.jpg', '2022-12-06 12:59:09', '2022-12-06 17:29:09'),
(130, 30, '9e64fd827e7f98aee9b7c61d30978f7e.jpg', '2022-12-06 12:59:09', '2022-12-06 17:29:09'),
(131, 30, 'a36a6fa0a4b6bc9f366235159bb476c4.jpg', '2022-12-06 12:59:09', '2022-12-06 17:29:09'),
(132, 30, '57f390ac164d44eb63e9c046d7eda28c.jpg', '2022-12-06 12:59:09', '2022-12-06 17:29:09'),
(133, 77, 'f9225cea79e905154a1c76c707a1fde4.jpg', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(134, 77, 'af18bc5e65e6f6501f868c1a516fcf71.jpg', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(135, 77, '1fa0db1120f96930a18c53a9fd9017c7.jpg', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(136, 77, '7be5b1a2735050ab6e8b2cfe7d82be15.jpg', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(137, 77, '1809f3be82d69983ebd4808ecdd75dab.jpg', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(138, 77, 'b9321111c8f1e0bf0840b673eb25af08.jpg', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(139, 32, '590d9a9aa605cb09fcce8ed30ec37eae.jpg', '2022-12-06 01:17:00', '2022-12-06 17:47:00'),
(140, 32, 'aa4afe9e12381e8a54e7e0d6688803e8.jpg', '2022-12-06 01:17:00', '2022-12-06 17:47:00'),
(141, 32, '8dede9d5b534e34b7620c9558558d634.jpg', '2022-12-06 01:17:00', '2022-12-06 17:47:00'),
(142, 32, '804e33e07425b951e0ac3077a694d460.jpg', '2022-12-06 01:17:00', '2022-12-06 17:47:00'),
(143, 32, '03f327b8e0edb7c108c1350172af17db.jpg', '2022-12-06 01:17:00', '2022-12-06 17:47:00'),
(144, 35, '5f54510ab4f666c58f0e9db164c45e79.jpg', '2022-12-06 01:49:47', '2022-12-06 18:19:47'),
(145, 35, 'dc432f62d47c70c4fa9c9e72326c1c3c.jpg', '2022-12-06 01:49:47', '2022-12-06 18:19:47'),
(146, 35, 'cad2aeda493669f587b0bbc699658882.jpg', '2022-12-06 01:49:47', '2022-12-06 18:19:47'),
(147, 35, '311b1256e4ec48477937812f4741437f.jpg', '2022-12-06 01:49:47', '2022-12-06 18:19:47'),
(148, 35, '79a5b9aff1df9dcc7d43d7a6592cee14.jpg', '2022-12-06 01:49:47', '2022-12-06 18:19:47'),
(149, 34, 'c113f4ecb9084af8fa4a481d5e29a149.jpg', '2022-12-06 01:54:33', '2022-12-06 18:24:33'),
(150, 34, 'c8ec5a4b3f058f5ed6fa0f2bdf0b4192.jpg', '2022-12-06 01:54:33', '2022-12-06 18:24:33'),
(151, 34, 'eefd0b7915798d611929119cc9f5bb4b.jpg', '2022-12-06 01:54:33', '2022-12-06 18:24:33'),
(152, 34, '4aeecd5718e5250956aedfcf7e035f2c.jpg', '2022-12-06 01:54:33', '2022-12-06 18:24:33'),
(153, 34, '50572531c120f3562f82bd73ef7f8c0e.jpg', '2022-12-06 01:54:33', '2022-12-06 18:24:33'),
(154, 38, 'b3ecb842cbab2454d167621d086c05ab.jpg', '2022-12-06 01:58:29', '2022-12-06 18:28:29'),
(155, 38, 'fb9d68ea2dad829176f0b065e8f36f8c.jpg', '2022-12-06 01:58:29', '2022-12-06 18:28:29'),
(156, 38, '194fb07b33888004600ac53b12b96f42.jpg', '2022-12-06 01:58:29', '2022-12-06 18:28:29'),
(157, 38, '780ac7dd14168bf86ce8f32c54c6a968.jpg', '2022-12-06 01:58:29', '2022-12-06 18:28:29'),
(158, 38, '246f5f3e43d29a6e3b7ba917769f640c.jpg', '2022-12-06 01:58:29', '2022-12-06 18:28:29'),
(159, 37, 'f271e8aa4d338a47454faf580706d677.jpg', '2022-12-06 02:01:13', '2022-12-06 18:31:13'),
(160, 37, '56c29aaac9b3ed704d8ee8bbe1664455.jpg', '2022-12-06 02:01:13', '2022-12-06 18:31:13'),
(161, 37, '2bbc6d6619f5bcf4fb79290203d791f1.jpg', '2022-12-06 02:01:13', '2022-12-06 18:31:13'),
(162, 37, 'e5a44071f9bcbfc5f5ebd0542ba2e252.jpg', '2022-12-06 02:01:13', '2022-12-06 18:31:13'),
(163, 37, '9468a33971c6e2b5658435fcd9804cd5.jpg', '2022-12-06 02:01:13', '2022-12-06 18:31:13'),
(164, 39, 'd28904f3930edecfdff1d4f284802ea7.jpg', '2022-12-06 02:06:53', '2022-12-06 18:36:53'),
(165, 39, '98ac208f0cac54296cce4b05b3375f58.jpg', '2022-12-06 02:06:53', '2022-12-06 18:36:53'),
(166, 39, 'ffa07f42ed9950bea03f518f1d3f457b.jpg', '2022-12-06 02:06:53', '2022-12-06 18:36:53'),
(167, 39, '6c049ad24fbb4823efc7fe67b99ef3e5.jpg', '2022-12-06 02:06:53', '2022-12-06 18:36:53'),
(168, 40, '26f999dee57b70144fe1170ba7cc00c1.jpg', '2022-12-06 02:09:35', '2022-12-06 18:39:35'),
(169, 40, 'fc87e81e5e4b94dbf20aff8e4c62382b.jpg', '2022-12-06 02:09:35', '2022-12-06 18:39:35'),
(170, 40, '1fe6d1a2fec90b7452dccbaafd4305f9.jpg', '2022-12-06 02:09:35', '2022-12-06 18:39:35'),
(171, 40, '081f91fd2eabd0164ee91931f1dc0315.jpg', '2022-12-06 02:09:35', '2022-12-06 18:39:35'),
(172, 41, '7abbac8ba5546e46d82687b5f0d7fb4e.jpg', '2022-12-06 02:12:04', '2022-12-06 18:42:04'),
(173, 41, '3e9cb23229f7b9e047faebdace68306a.jpg', '2022-12-06 02:12:04', '2022-12-06 18:42:04'),
(174, 41, 'c9b63235742d6407a9e376d8dfff296e.jpg', '2022-12-06 02:12:04', '2022-12-06 18:42:04'),
(175, 41, 'df3485c65df04e0a9a30c8f212dad61b.jpg', '2022-12-06 02:12:04', '2022-12-06 18:42:04'),
(176, 42, '56d0b6bd5fa040a350836dd898e63213.jpg', '2022-12-06 02:15:08', '2022-12-06 18:45:08'),
(177, 42, '60849e020780d766f03ca183d5305460.jpg', '2022-12-06 02:15:08', '2022-12-06 18:45:08'),
(178, 42, '3ea60deeefaf3aeb718f97aedfbe63ce.jpg', '2022-12-06 02:15:08', '2022-12-06 18:45:08'),
(179, 42, '38d9bdde5025f7fcfc240a6051ef7fa4.jpg', '2022-12-06 02:15:08', '2022-12-06 18:45:08'),
(180, 43, 'ce340f8d1c12c5aef65ccd44b6797e47.jpg', '2022-12-07 07:04:31', '2022-12-07 11:34:31'),
(181, 43, 'a846dbaa134db24616fd7bae5b3dfe9f.jpg', '2022-12-07 07:04:31', '2022-12-07 11:34:31'),
(182, 43, '4593d8546e600f3600c3017d416a83cb.jpg', '2022-12-07 07:04:31', '2022-12-07 11:34:31'),
(183, 43, '7fd0d9820641d878c36f35cb07a94c54.jpg', '2022-12-07 07:04:31', '2022-12-07 11:34:31'),
(184, 44, 'e40cf8f4d466275ccfc365c9f999554a.jpg', '2022-12-07 07:08:55', '2022-12-07 11:38:55'),
(185, 44, 'f6514e8597e10713fc519ca1d4f3274a.jpg', '2022-12-07 07:08:55', '2022-12-07 11:38:55'),
(186, 44, '6af2e96956f8e30f56215a50b6079958.jpg', '2022-12-07 07:08:55', '2022-12-07 11:38:55'),
(187, 44, '30ba026c08d7645a3926eedf713a714e.jpg', '2022-12-07 07:08:55', '2022-12-07 11:38:55'),
(188, 46, 'ec8343cf26aa7ea5597989dcff8589a0.jpg', '2022-12-07 07:11:41', '2022-12-07 11:41:41'),
(189, 46, 'bdbb9cb31788b5cbfd6cc559b5645d06.jpg', '2022-12-07 07:11:41', '2022-12-07 11:41:41'),
(190, 46, '456efee06f6bf63221863c009048fc8b.jpg', '2022-12-07 07:11:41', '2022-12-07 11:41:41'),
(191, 46, 'd2ed156c5cf74d68fb1e298366ed9ab9.jpg', '2022-12-07 07:11:41', '2022-12-07 11:41:41'),
(192, 47, 'd4b31a4b5ed13b644d09e4b2096599c4.jpg', '2022-12-07 07:13:53', '2022-12-07 11:43:53'),
(193, 47, '0a125e04c360ef69718dd303a5351c30.jpg', '2022-12-07 07:13:53', '2022-12-07 11:43:53'),
(194, 47, '3ca7e56484095c1fcb31ba40597b6365.jpg', '2022-12-07 07:13:53', '2022-12-07 11:43:53'),
(195, 47, 'b1dc189fb19240ece408e4521c4c5087.jpg', '2022-12-07 07:13:53', '2022-12-07 11:43:53'),
(196, 48, '334bda7f434ed3750a3610443d97971f.jpg', '2022-12-07 07:16:38', '2022-12-07 11:46:38'),
(197, 48, 'fc50e1ecef5cdd71e6314dc034d9acce.jpg', '2022-12-07 07:16:38', '2022-12-07 11:46:38'),
(198, 48, 'c813a20e3115de229cfe4b08d1d6b19b.jpg', '2022-12-07 07:16:38', '2022-12-07 11:46:38'),
(199, 48, '490088e09c9e7ea4694fe0e3d78ce30c.jpg', '2022-12-07 07:16:38', '2022-12-07 11:46:38'),
(200, 49, '975272ab2cd808ba132670d79e3153dd.jpg', '2022-12-07 07:18:58', '2022-12-07 11:48:58'),
(201, 49, '412c8cdbdad230a352a90fa6b4305f9b.jpg', '2022-12-07 07:18:58', '2022-12-07 11:48:58'),
(202, 49, '82ed2fbcfb690accadbd8a7fae43aad0.jpg', '2022-12-07 07:18:58', '2022-12-07 11:48:58'),
(203, 49, 'd50c297cc48015ee99f12901a3eda052.jpg', '2022-12-07 07:18:58', '2022-12-07 11:48:58'),
(204, 49, 'a8708fb3a9c8d7d5835c45e7354ed2eb.jpg', '2022-12-07 07:18:58', '2022-12-07 11:48:58'),
(205, 49, '441814613c30e2d535ae217c59ad06fc.jpg', '2022-12-07 07:18:58', '2022-12-07 11:48:58'),
(206, 50, 'ea0743c365d94c406d25554fc2101251.jpg', '2022-12-07 07:20:34', '2022-12-07 11:50:34'),
(207, 50, 'c89e55f0fc53f4da0fb1b3ae4ab60b12.jpg', '2022-12-07 07:20:34', '2022-12-07 11:50:34'),
(208, 50, '3b35d0ac6ff41ccd320eaf2fe34cfff5.jpg', '2022-12-07 07:20:34', '2022-12-07 11:50:34'),
(209, 50, '43838f808b8e91d07e0809098963fd4c.jpg', '2022-12-07 07:20:34', '2022-12-07 11:50:34'),
(210, 50, 'ee0da28cd3ec2d63a2914bbd47912773.jpg', '2022-12-07 07:20:34', '2022-12-07 11:50:34'),
(211, 50, 'cfcb86ad31a1b9d815c713d059860047.jpg', '2022-12-07 07:20:34', '2022-12-07 11:50:34'),
(212, 51, '4fc1b87fb843689a0dc52fa0826e21b2.jpg', '2022-12-07 07:23:38', '2022-12-07 11:53:38'),
(213, 51, '5165d9578e0527c1e0eb439b807b6d46.jpg', '2022-12-07 07:23:38', '2022-12-07 11:53:38'),
(214, 51, 'c5a96764d44720a23012b8236365a76c.jpg', '2022-12-07 07:23:38', '2022-12-07 11:53:38'),
(215, 51, '9e29f4de49fdad91fd532630f7c74153.jpg', '2022-12-07 07:23:38', '2022-12-07 11:53:38'),
(216, 51, 'c47be5b06cd42c6524efe4b943cccb45.jpg', '2022-12-07 07:23:38', '2022-12-07 11:53:38'),
(217, 51, '9461f4d8160945aa303bbcd0e9ccc118.jpg', '2022-12-07 07:23:38', '2022-12-07 11:53:38'),
(218, 52, 'd80284b95c059cdcfc3fd4f238f53009.jpg', '2022-12-07 07:25:48', '2022-12-07 11:55:48'),
(219, 52, 'ef59842070bf7120b749ebdb6bf59a44.jpg', '2022-12-07 07:25:48', '2022-12-07 11:55:48'),
(220, 52, 'a6ee172baf8105610e5ae2307a5796ff.jpg', '2022-12-07 07:25:48', '2022-12-07 11:55:48'),
(221, 52, '516431772700f8331ef8bc718d673f12.jpg', '2022-12-07 07:25:48', '2022-12-07 11:55:48'),
(222, 52, 'bb5356607d4a84722ba32405f6928a94.jpg', '2022-12-07 07:25:48', '2022-12-07 11:55:48'),
(223, 52, 'e5f3302ece8f089718f6b46cf4dda860.jpg', '2022-12-07 07:25:48', '2022-12-07 11:55:48'),
(224, 53, '8c79fd4a31fc8c5a8a655f0d40d4dc4d.jpg', '2022-12-07 07:29:08', '2022-12-07 11:59:08'),
(225, 53, 'c9bd2060f3c57ce5edcf0d4817a0c247.jpg', '2022-12-07 07:29:08', '2022-12-07 11:59:08'),
(226, 53, '97b4797666e0e42196947cbc2ba70ccd.jpg', '2022-12-07 07:29:08', '2022-12-07 11:59:08'),
(227, 53, '7ebd5ccf8e9d9c6e4f73efe11559bbf0.jpg', '2022-12-07 07:29:08', '2022-12-07 11:59:08'),
(228, 55, '2b9ccfbbba13419769f0df14136f7087.jpg', '2022-12-07 07:31:35', '2022-12-07 12:01:35'),
(229, 55, '86a507ce8675a459aa09a6188c4b6fcc.jpg', '2022-12-07 07:31:35', '2022-12-07 12:01:35'),
(230, 55, '716545b61344e91a3d87a7fa2edfe433.jpg', '2022-12-07 07:31:35', '2022-12-07 12:01:35'),
(231, 55, 'b8f6459478efdaef362861982c0b8d08.jpg', '2022-12-07 07:31:35', '2022-12-07 12:01:35'),
(232, 55, '75b82082138b0339ed499574de9dc922.jpg', '2022-12-07 07:31:35', '2022-12-07 12:01:35'),
(233, 54, '7ce3eed6ffcc3c37702a2a9ac77585aa.jpg', '2022-12-07 07:35:31', '2022-12-07 12:05:31'),
(234, 54, '70e5d60d0680f9c6b4bb1b5b5582c338.jpg', '2022-12-07 07:35:31', '2022-12-07 12:05:31'),
(235, 54, 'b901b4aa8784df00df761d37065fbcef.jpg', '2022-12-07 07:35:31', '2022-12-07 12:05:31'),
(236, 54, 'e7f913219c4afdf0ebcd1635048b2432.jpg', '2022-12-07 07:35:31', '2022-12-07 12:05:31'),
(237, 54, '1bf8443bfbabb509ff38de538fb7e98e.jpg', '2022-12-07 07:35:31', '2022-12-07 12:05:31'),
(238, 56, 'e1bbe79000ac269ce18c87485299c7d5.jpg', '2022-12-07 07:37:25', '2022-12-07 12:07:25'),
(239, 56, '3c758292ec3b092854d10815b726968b.jpg', '2022-12-07 07:37:25', '2022-12-07 12:07:25'),
(240, 56, 'de22e1edf1f7d07599a63c65dff34729.jpg', '2022-12-07 07:37:25', '2022-12-07 12:07:25'),
(241, 56, 'fb9a110a8fbeced791b5773999df2adb.jpg', '2022-12-07 07:37:25', '2022-12-07 12:07:25'),
(242, 56, '9cf704a28074f572333a380032e25f53.jpg', '2022-12-07 07:37:25', '2022-12-07 12:07:25'),
(243, 57, '7bcb8719a26643054a8af00bcc465eb0.jpg', '2022-12-07 07:39:20', '2022-12-07 12:09:20'),
(244, 57, '2773a790f5b22ff9a711882685287763.jpg', '2022-12-07 07:39:20', '2022-12-07 12:09:20'),
(245, 57, '788c641fb1b3a0812fd2405221258439.jpg', '2022-12-07 07:39:20', '2022-12-07 12:09:20'),
(246, 57, 'b9b28522b2db90332023647c10928bbf.jpg', '2022-12-07 07:39:20', '2022-12-07 12:09:20'),
(247, 57, 'a2feba5e31ce09585835d78169f8481d.jpg', '2022-12-07 07:39:20', '2022-12-07 12:09:20'),
(248, 58, 'bf97715191c19dd26078a8438cddf227.jpg', '2022-12-07 07:41:14', '2022-12-07 12:11:14'),
(249, 58, 'e53035269265a258a9417e48b06f34b4.jpg', '2022-12-07 07:41:14', '2022-12-07 12:11:14'),
(250, 58, 'dd1a1936e8c88c820d294480f731bedf.jpg', '2022-12-07 07:41:14', '2022-12-07 12:11:14'),
(251, 58, 'af59125e96efbc251c9154752b824511.jpg', '2022-12-07 07:41:14', '2022-12-07 12:11:14'),
(252, 58, '98031d6771fa46094ba70460f00b14f2.jpg', '2022-12-07 07:41:14', '2022-12-07 12:11:14'),
(253, 59, '235114a0b12b4e3f8c91260b444fb004.jpg', '2022-12-07 07:43:11', '2022-12-07 12:13:11'),
(254, 59, '65276649728a7387b165774d64bc6dfe.jpg', '2022-12-07 07:43:11', '2022-12-07 12:13:11'),
(255, 59, 'c1eea47c5967f0057cfb8cae19a66321.jpg', '2022-12-07 07:43:11', '2022-12-07 12:13:11'),
(256, 59, '09b5cf8ec47ac5dec3d33edd78b2c604.jpg', '2022-12-07 07:43:11', '2022-12-07 12:13:11'),
(257, 59, 'bf0347b08d6069a25eb53f609b1c72a8.jpg', '2022-12-07 07:43:11', '2022-12-07 12:13:11'),
(258, 60, '0bb452b62c99569b8c3fcd68a51b847e.jpg', '2022-12-07 07:45:03', '2022-12-07 12:15:03'),
(259, 60, 'ea3697dc71e5c7ab7b0646d6f3a7dbb7.jpg', '2022-12-07 07:45:03', '2022-12-07 12:15:03'),
(260, 60, 'b2c6440068ba12508f61d382041c9fdf.jpg', '2022-12-07 07:45:03', '2022-12-07 12:15:03'),
(261, 60, 'daf3f7c4b69078a4217d6b0e80b2431f.jpg', '2022-12-07 07:45:03', '2022-12-07 12:15:03'),
(262, 60, 'fe6d8943c92b103c3e0f8201b3cb6470.jpg', '2022-12-07 07:45:03', '2022-12-07 12:15:03'),
(263, 61, 'b8d66414ebb4386c1f61f7eefe9514ca.jpg', '2022-12-07 07:48:02', '2022-12-07 12:18:02'),
(264, 61, '2dbf2dd41adb94aa66bd88702d390a8b.jpg', '2022-12-07 07:48:02', '2022-12-07 12:18:02'),
(265, 61, '8db11ed55c85e33522d6d1ce9d0d47fc.jpg', '2022-12-07 07:48:02', '2022-12-07 12:18:02'),
(266, 61, '625a1cb974e4ef1884a73c7d6cd21e86.jpg', '2022-12-07 07:48:02', '2022-12-07 12:18:02'),
(267, 61, 'eef653d70300d7fe11929b4017acb6e2.jpg', '2022-12-07 07:48:02', '2022-12-07 12:18:02'),
(268, 61, 'abd930705761ca2fb7aa13d0ad5e773b.jpg', '2022-12-07 07:48:02', '2022-12-07 12:18:02'),
(269, 62, '65b3c03389546a3e5a1cd022fdb431f6.jpg', '2022-12-07 07:53:01', '2022-12-07 12:23:01'),
(270, 62, 'af0abbc124c6d24907be1115548d13dd.jpg', '2022-12-07 07:53:01', '2022-12-07 12:23:01'),
(271, 62, '7166baa947fe99146584c9014ddd223b.jpg', '2022-12-07 07:53:01', '2022-12-07 12:23:01'),
(272, 62, '77a93a28760c78a964aba86e9a0611f3.jpg', '2022-12-07 07:53:01', '2022-12-07 12:23:01'),
(273, 62, '8b3989c1ab95d28aaa367334770d80c9.jpg', '2022-12-07 07:53:01', '2022-12-07 12:23:01'),
(274, 62, '20501fe8f99539344450187bf39c1131.jpg', '2022-12-07 07:53:01', '2022-12-07 12:23:01'),
(275, 63, '9e7148dffed38fb505eb5ca691fc778b.jpg', '2022-12-07 07:55:14', '2022-12-07 12:25:14'),
(276, 63, '29cd91b1c0a99aa2f87ed3799725ea98.jpg', '2022-12-07 07:55:14', '2022-12-07 12:25:14'),
(277, 63, 'e5e9fc09b9eb0ede0f4dcb63830addb6.jpg', '2022-12-07 07:55:14', '2022-12-07 12:25:14'),
(278, 63, '031ef21e20e3c2791a12f082aec1031b.jpg', '2022-12-07 07:55:14', '2022-12-07 12:25:14'),
(279, 63, '6aae703a740dc699d70359f8fb480e46.jpg', '2022-12-07 07:55:14', '2022-12-07 12:25:14'),
(280, 63, 'eac59dcf991e429e14b0b1cf7dcf2159.jpg', '2022-12-07 07:55:14', '2022-12-07 12:25:14'),
(281, 64, 'b2a9d49f6dddcb8a146727a8b0b50f3e.jpg', '2022-12-07 07:57:11', '2022-12-07 12:27:11'),
(282, 64, '2d9965ed8c55a15892942d77d07c45d3.jpg', '2022-12-07 07:57:11', '2022-12-07 12:27:11'),
(283, 64, 'ca21557fb433b47c4f9ff8740720a17c.jpg', '2022-12-07 07:57:11', '2022-12-07 12:27:11'),
(284, 64, 'd99aea59a2c6ceecbd8d1bfb862d1386.jpg', '2022-12-07 07:57:11', '2022-12-07 12:27:11'),
(285, 64, '4e9a7ecf337a6f46a7efb183bd12ee34.jpg', '2022-12-07 07:57:11', '2022-12-07 12:27:11'),
(286, 64, '47d8d140331a6b19b1095e0e847a7a46.jpg', '2022-12-07 07:57:11', '2022-12-07 12:27:11'),
(287, 65, '2e62a76b5a81f48e8361d2fd64769210.jpg', '2022-12-07 07:59:33', '2022-12-07 12:29:33'),
(288, 65, '48136370657d8cbf5cc8640113d9c4e2.jpg', '2022-12-07 07:59:33', '2022-12-07 12:29:33'),
(289, 65, '122aa1aa2345cbc88b36ad324f09578f.jpg', '2022-12-07 07:59:33', '2022-12-07 12:29:33'),
(290, 65, '389edfcd1fd897b8ebb3151c8a4ae635.jpg', '2022-12-07 07:59:33', '2022-12-07 12:29:33'),
(291, 65, '03adc8d852d6787452c8bd9bf3893803.jpg', '2022-12-07 07:59:33', '2022-12-07 12:29:33'),
(292, 66, '9c5ca439c21cb5826f3ab8cf22082cf0.jpg', '2022-12-07 08:01:57', '2022-12-07 12:31:57'),
(293, 66, '8ab7909a6fa14339f18e55cdaa53c503.jpg', '2022-12-07 08:01:57', '2022-12-07 12:31:57'),
(294, 66, '100ec10c9313d932599734c5e4b95d8f.jpg', '2022-12-07 08:01:57', '2022-12-07 12:31:57'),
(295, 66, 'f54ae6216d4eb8a957027d64eb68df0a.jpg', '2022-12-07 08:01:57', '2022-12-07 12:31:57'),
(296, 66, 'e6c99c6feaf7babca75aea6e143ee3f2.jpg', '2022-12-07 08:01:57', '2022-12-07 12:31:57'),
(297, 66, '89831e0eeaca5b55eee413977c357199.jpg', '2022-12-07 08:01:57', '2022-12-07 12:31:57'),
(298, 67, 'b1a7945df189f1f3da4166596abee46a.jpg', '2022-12-07 08:03:54', '2022-12-07 12:33:54'),
(299, 67, 'b3d4f6aad5412ecf8172666ae680450d.jpg', '2022-12-07 08:03:54', '2022-12-07 12:33:54'),
(300, 67, 'ce59e3950a87bf79cf6944b883bf1408.jpg', '2022-12-07 08:03:54', '2022-12-07 12:33:54'),
(301, 67, '10e4486391aee6f9ff890baaaf4e5996.jpg', '2022-12-07 08:03:54', '2022-12-07 12:33:54'),
(302, 67, '223821f3dcd579e8265f89ef3518ba3e.jpg', '2022-12-07 08:03:54', '2022-12-07 12:33:54'),
(303, 68, '363ecf4f3b5d062697976e10ff7d7829.jpg', '2022-12-07 08:05:59', '2022-12-07 12:35:59'),
(304, 68, '6657dccc40361f8325a99afbde7e6c9b.jpg', '2022-12-07 08:05:59', '2022-12-07 12:35:59'),
(305, 68, 'f8bdfcf1d4a536438d38446c5e9f50f1.jpg', '2022-12-07 08:05:59', '2022-12-07 12:35:59'),
(306, 68, 'f9d369119f1f7554e93281863e31179d.jpg', '2022-12-07 08:05:59', '2022-12-07 12:35:59'),
(307, 68, 'b3e9a29d63524f71fecf76911538a78b.jpg', '2022-12-07 08:05:59', '2022-12-07 12:35:59'),
(308, 68, '1040818e0fe228b2dbd331e6b83589a8.jpg', '2022-12-07 08:05:59', '2022-12-07 12:35:59'),
(309, 69, 'd6953a70b38568a7cdb86c44406b6a1e.jpg', '2022-12-07 08:08:07', '2022-12-07 12:38:07'),
(310, 69, 'c93d02f7ea4e3e7af9ebda75e58a3cea.jpg', '2022-12-07 08:08:07', '2022-12-07 12:38:07'),
(311, 69, '38d2c9b15caf697432e2a0462fa3dd85.jpg', '2022-12-07 08:08:07', '2022-12-07 12:38:07'),
(312, 69, 'faf470dad3f5549126956df7f3a2dedf.jpg', '2022-12-07 08:08:07', '2022-12-07 12:38:07'),
(313, 69, 'f6785397aeb5b056570a956051981f91.jpg', '2022-12-07 08:08:07', '2022-12-07 12:38:07'),
(314, 70, '5450cfa3a103d58a006e31b863f835fc.jpg', '2022-12-07 08:10:24', '2022-12-07 12:40:24'),
(315, 70, '5be24b4f9b82e0dfb2efea99fc2feb88.jpg', '2022-12-07 08:10:24', '2022-12-07 12:40:24'),
(316, 70, '695fab177909b769f35b8e97388454d8.jpg', '2022-12-07 08:10:24', '2022-12-07 12:40:24'),
(317, 70, '6677934a500d5a2f96ca813f0e217032.jpg', '2022-12-07 08:10:24', '2022-12-07 12:40:24'),
(318, 70, '5ec04a737985054ba8766197adc48329.jpg', '2022-12-07 08:10:24', '2022-12-07 12:40:24'),
(319, 70, 'fc75b100f3ffc24ed3dcaa8b17dc1a40.jpg', '2022-12-07 08:10:24', '2022-12-07 12:40:24'),
(320, 71, '24c1248fb4e8376457a3f704bd21716c.jpg', '2022-12-07 08:12:31', '2022-12-07 12:42:31'),
(321, 71, 'fabd751b366368d6a6311eb54d6f9c5a.jpg', '2022-12-07 08:12:31', '2022-12-07 12:42:31'),
(322, 71, '50f07930ea2433368e00270b710f61d7.jpg', '2022-12-07 08:12:31', '2022-12-07 12:42:31'),
(323, 71, '02bd3e095ac1a931bbd950fdfd54eb0f.jpg', '2022-12-07 08:12:31', '2022-12-07 12:42:31'),
(324, 71, 'adacdbb3261a6662e4f396eee858157a.jpg', '2022-12-07 08:12:31', '2022-12-07 12:42:31'),
(325, 71, '922133e65e5cadc1f670969267085347.jpg', '2022-12-07 08:12:31', '2022-12-07 12:42:31'),
(326, 76, 'ddb87dd726f86805d1a848708a86fabb.jpg', '2022-12-07 08:14:30', '2022-12-07 12:44:30'),
(327, 76, 'd550e8ac96d8bae49fe08bb1a0b14d19.jpg', '2022-12-07 08:14:30', '2022-12-07 12:44:30'),
(328, 76, '6376387c8f01ff6d2778d0628eb55536.jpg', '2022-12-07 08:14:30', '2022-12-07 12:44:30'),
(329, 76, '9fe15053b958e1217f4a6267bcf3a2de.jpg', '2022-12-07 08:14:30', '2022-12-07 12:44:30'),
(330, 76, 'afb58e482bd80ea4ced7056831e258ac.jpg', '2022-12-07 08:14:30', '2022-12-07 12:44:30'),
(331, 75, '0ec0c8729aaf36c51e7c25c1befd9605.jpg', '2022-12-07 08:16:42', '2022-12-07 12:46:42'),
(332, 75, 'a2b5af1d592c7081c0aa84bc8ff08a64.jpg', '2022-12-07 08:16:42', '2022-12-07 12:46:42'),
(333, 75, '5e56ce501790513d57ddcadf3e6c0c8c.jpg', '2022-12-07 08:16:42', '2022-12-07 12:46:42'),
(334, 75, 'e3b7825cb1fbec35682a6ebe0bb8e51c.jpg', '2022-12-07 08:16:42', '2022-12-07 12:46:42'),
(335, 74, 'df193970c36d5a4e9fe31c943aed1e72.jpg', '2022-12-07 08:18:57', '2022-12-07 12:48:57'),
(336, 74, '74945edcb57071c66a68e55d98b2258a.jpg', '2022-12-07 08:18:57', '2022-12-07 12:48:57'),
(337, 74, '5ce6e498542785e6fed4904cabb71d4d.jpg', '2022-12-07 08:18:57', '2022-12-07 12:48:57'),
(338, 74, '83501e3ae2798c74d791f3eb39591c22.jpg', '2022-12-07 08:18:57', '2022-12-07 12:48:57'),
(339, 73, '5def7aa48d524c595f803bd14d51cd9b.jpg', '2022-12-07 08:21:08', '2022-12-07 12:51:08'),
(340, 73, 'c58bb37d50bedac11daac93dd067c5a6.jpg', '2022-12-07 08:21:08', '2022-12-07 12:51:08'),
(341, 73, 'b5d2706f3134543029cb41b9af542dab.jpg', '2022-12-07 08:21:08', '2022-12-07 12:51:08'),
(342, 73, 'a86263efe3f05642a2a71d5e2ffa29ff.jpg', '2022-12-07 08:21:08', '2022-12-07 12:51:08'),
(343, 73, '5d3be825336963675abeccd8e808769d.jpg', '2022-12-07 08:21:08', '2022-12-07 12:51:08'),
(344, 73, '1f7986f9ad52fcd5cad28ebc6decbee0.jpg', '2022-12-07 08:21:08', '2022-12-07 12:51:08'),
(345, 29, '91d3ae72eb57a0675d1631d517bf93fa.jpg', '2022-12-07 08:34:13', '2022-12-07 13:04:13'),
(346, 29, '18a9368d53f3322e80ca9b51890f65c1.jpg', '2022-12-07 08:34:13', '2022-12-07 13:04:13'),
(347, 29, '95ad26c0d39cc9e834d57171c60456df.jpg', '2022-12-07 08:34:13', '2022-12-07 13:04:13'),
(348, 29, '0ef2b956b9febdd423998030a4d9339a.jpg', '2022-12-07 08:34:13', '2022-12-07 13:04:13'),
(349, 29, '725c8693450e4e437cba441ccafb4022.jpg', '2022-12-07 08:34:13', '2022-12-07 13:04:13'),
(356, 72, '3495e70053947c872ef1175a7548e0d1.jpg', '2022-12-07 12:41:14', '2022-12-07 17:11:14'),
(357, 72, 'c3435e5fe4c2714dd3c1e0debbbf50b2.jpg', '2022-12-07 12:41:14', '2022-12-07 17:11:14'),
(358, 72, 'cc2a7065219cd7700801286729fb4176.jpg', '2022-12-07 12:41:14', '2022-12-07 17:11:14'),
(359, 72, '78ec4d1f623f641abe6da6f58cd70526.jpg', '2022-12-07 12:41:14', '2022-12-07 17:11:14'),
(360, 72, '2e906f1d3fca65959885f138f400071b.jpg', '2022-12-07 12:41:14', '2022-12-07 17:11:14'),
(361, 72, '910aac60f2934e512263448d5347fbb6.jpg', '2022-12-07 12:41:14', '2022-12-07 17:11:14'),
(367, 102, '2cd2a48973dd9a38a38b38de14dfb3e0.jpg', '2022-12-08 01:00:56', '2022-12-08 17:30:56'),
(368, 102, '6153f727351e68f2d8a4421012c2c2ad.jpg', '2022-12-08 01:00:56', '2022-12-08 17:30:56'),
(369, 102, '183d254b7308fc1792ebf42d7deb80a5.jpg', '2022-12-08 01:00:56', '2022-12-08 17:30:56'),
(370, 102, 'd1b94f57a4fa613b9ff4412b7a028a07.jpg', '2022-12-08 01:00:56', '2022-12-08 17:30:56'),
(371, 102, '3b6ecfdc3c0d220b2f62619ea26851b2.jpg', '2022-12-08 01:00:56', '2022-12-08 17:30:56'),
(372, 105, '78719232718ef4bdbbf8a8ebd26ee792.jpg', '2022-12-08 01:03:23', '2022-12-08 17:33:23'),
(373, 105, 'b5f881f6ee9223bbf8e35a2a41f0a17d.jpg', '2022-12-08 01:03:23', '2022-12-08 17:33:23'),
(374, 105, 'c38722fe278561a55b26745d9b9bde30.jpg', '2022-12-08 01:03:23', '2022-12-08 17:33:23'),
(375, 105, 'c4dafb35a01d1300b5222c9d640caa4d.jpg', '2022-12-08 01:03:23', '2022-12-08 17:33:23'),
(376, 105, 'e227b83872fe4f3214701329f7d982e3.jpg', '2022-12-08 01:03:23', '2022-12-08 17:33:23'),
(377, 108, '51cc624963c07c78839db191c6fcb229.jpg', '2022-12-08 01:05:41', '2022-12-08 17:35:41'),
(378, 108, '45ba886c4cd8d55d0fd617589e90cd0d.jpg', '2022-12-08 01:05:41', '2022-12-08 17:35:41'),
(379, 108, 'd7abc421060be518ebb9137e54d42871.jpg', '2022-12-08 01:05:41', '2022-12-08 17:35:41'),
(380, 108, 'ff3fa556ab90b164d2617aeef7db1aee.jpg', '2022-12-08 01:05:41', '2022-12-08 17:35:41'),
(381, 108, 'e34a655b8bc0c35ce63d5b47489a5d5a.jpg', '2022-12-08 01:05:41', '2022-12-08 17:35:41'),
(382, 106, '1106f6bcdd87c04412075b04712c8498.jpg', '2022-12-08 01:09:28', '2022-12-08 17:39:28'),
(383, 106, '5dda1f69dd0ffe986720f4ae67155ec8.jpg', '2022-12-08 01:09:28', '2022-12-08 17:39:28'),
(384, 106, '47319dd3b35bc4d6259bb809ce19af02.jpg', '2022-12-08 01:09:28', '2022-12-08 17:39:28'),
(385, 106, 'a08c6f764353c62a0b4fb7b6cb439b86.jpg', '2022-12-08 01:09:28', '2022-12-08 17:39:28'),
(386, 106, '74ca2aa38901053d50a4817b7366b5ff.jpg', '2022-12-08 01:09:28', '2022-12-08 17:39:28'),
(387, 109, '4db5990c7d6d41eb0e5d76ef71e5c156.jpg', '2022-12-08 01:11:56', '2022-12-08 17:41:56'),
(388, 109, '85bca9fbaa412950f0cf094e0af0fe22.jpg', '2022-12-08 01:11:56', '2022-12-08 17:41:56'),
(389, 109, 'c4a2512f86e4ab5e26d2011f0949dffd.jpg', '2022-12-08 01:11:56', '2022-12-08 17:41:56'),
(390, 109, '90ddaffe5f70bfa0b81f5c01980c30c2.jpg', '2022-12-08 01:11:56', '2022-12-08 17:41:56'),
(391, 109, '09ea824bf5c6c82af42227dc77313b66.jpg', '2022-12-08 01:11:56', '2022-12-08 17:41:56'),
(392, 111, '16792f713ff5769c49e5492776c5975e.jpg', '2022-12-08 01:14:47', '2022-12-08 17:44:47'),
(393, 111, '64c66286dc36370363de6fb3982679af.jpg', '2022-12-08 01:14:47', '2022-12-08 17:44:47'),
(394, 111, '0050d94ef2a34011516cba7a1219b7f5.jpg', '2022-12-08 01:14:47', '2022-12-08 17:44:47'),
(395, 111, '35fe4dc4da4f4354c0003da4953cdc45.jpg', '2022-12-08 01:14:47', '2022-12-08 17:44:47'),
(396, 111, '6c81a9fd8901593dd80d9fe109dfb3a8.jpg', '2022-12-08 01:14:47', '2022-12-08 17:44:47'),
(397, 113, '4ab57bd4cfb003b8c58189038c6d429f.jpg', '2022-12-08 01:17:21', '2022-12-08 17:47:21'),
(398, 113, 'cfc6615eba3ba3d98b40934c77fd4f55.jpg', '2022-12-08 01:17:21', '2022-12-08 17:47:21'),
(399, 113, '07876509ad7ad2e5cc6d2cfb601c219f.jpg', '2022-12-08 01:17:21', '2022-12-08 17:47:21'),
(400, 113, '486a6727d2762020280f92fa013b29b2.jpg', '2022-12-08 01:17:21', '2022-12-08 17:47:21'),
(401, 113, '076f5d3c2bf9d1b2b2edbddd52965bc8.jpg', '2022-12-08 01:17:21', '2022-12-08 17:47:21'),
(402, 103, '6fc39e76731de763d077a0f94a5a0b4e.jpg', '2022-12-08 01:19:48', '2022-12-08 17:49:48'),
(403, 103, 'f7f233f91649ef58ebc8b585c76648db.jpg', '2022-12-08 01:19:48', '2022-12-08 17:49:48'),
(404, 103, '901f49dd6cbe0145c4513dfafdd410b9.jpg', '2022-12-08 01:19:48', '2022-12-08 17:49:48'),
(405, 103, '4dfa1ca135ad5bab75e42bcdfd51ddd0.jpg', '2022-12-08 01:19:48', '2022-12-08 17:49:48'),
(406, 112, '9f6b1836207334e33f9361f833795256.jpg', '2022-12-08 01:22:04', '2022-12-08 17:52:04'),
(407, 112, '2bc36e8838e0f38dae569abe1b956eee.jpg', '2022-12-08 01:22:04', '2022-12-08 17:52:04'),
(408, 112, '49e157850b92f0d6d353e14311c0c180.jpg', '2022-12-08 01:22:04', '2022-12-08 17:52:04'),
(409, 112, '3cf5ad1184ecb656dc4bed0e7a9e9248.jpg', '2022-12-08 01:22:04', '2022-12-08 17:52:04'),
(410, 112, '43a93226caf73952baf532cbbc6d6455.jpg', '2022-12-08 01:22:04', '2022-12-08 17:52:04'),
(411, 107, '97b9832a8465769e1b2f915e47bc0b31.jpg', '2022-12-08 01:40:33', '2022-12-08 18:10:33'),
(412, 107, 'f808efd1f6415a5063a325a5f31f1992.jpg', '2022-12-08 01:40:33', '2022-12-08 18:10:33'),
(413, 107, '5b4439c9994945bcdaeef8ec7b84ed69.jpg', '2022-12-08 01:40:33', '2022-12-08 18:10:33'),
(414, 107, '14be5845a1cea56a81804e8cdf6a3c75.jpg', '2022-12-08 01:40:33', '2022-12-08 18:10:33'),
(415, 107, '05ac139f0afaff59fe65116419aa446c.jpg', '2022-12-08 01:40:33', '2022-12-08 18:10:33'),
(416, 110, 'a9ce10a8c96672144e04f3f25f704018.jpg', '2022-12-08 01:42:56', '2022-12-08 18:12:56'),
(417, 110, 'e600dc400dcdb531c1ead76339362705.jpg', '2022-12-08 01:42:56', '2022-12-08 18:12:56'),
(418, 110, '9409c4ef506d4612ac4a4c188ed5a69d.jpg', '2022-12-08 01:42:56', '2022-12-08 18:12:56'),
(419, 110, 'a08060d6e93d01f0ac0a19ced1b54a95.jpg', '2022-12-08 01:42:56', '2022-12-08 18:12:56'),
(420, 110, '1b3e33cc8914415a38bab0ebf9389a63.jpg', '2022-12-08 01:42:56', '2022-12-08 18:12:56'),
(421, 104, '4267cafe8c128ac35111ae08cc64b197.jpg', '2022-12-08 01:45:12', '2022-12-08 18:15:12'),
(422, 104, '59638d207552fdd52d228e5408370d27.jpg', '2022-12-08 01:45:12', '2022-12-08 18:15:12'),
(423, 104, 'ff1d7e1dc1848dc609fbb690c205a861.jpg', '2022-12-08 01:45:12', '2022-12-08 18:15:12'),
(424, 104, 'e87bc387ea3e34dbaa7fac90db415125.jpg', '2022-12-08 01:45:12', '2022-12-08 18:15:12'),
(425, 104, '8798d22a0ee9f8a283c829a888258ec5.jpg', '2022-12-08 01:45:12', '2022-12-08 18:15:12'),
(426, 78, 'e5585312bdc95e45fcf1104c8eacaf9f.jpg', '2022-12-08 01:56:57', '2022-12-08 18:26:57'),
(427, 78, '26c5fff134cef485cabf0fe68b82a9ee.jpg', '2022-12-08 01:56:57', '2022-12-08 18:26:57'),
(428, 78, 'dbab8734b72437d22d4b2e462b4314b0.jpg', '2022-12-08 01:56:57', '2022-12-08 18:26:57'),
(429, 78, '7753c3a468845e156b2805b1941ff586.jpg', '2022-12-08 01:56:57', '2022-12-08 18:26:57'),
(430, 78, '7820f3da82068707b03e3cfbad7069fb.jpg', '2022-12-08 01:56:57', '2022-12-08 18:26:57'),
(431, 78, 'eb3d223380f00f4a5b0301f9b68ca52b.jpg', '2022-12-08 01:56:57', '2022-12-08 18:26:57'),
(432, 79, 'bf36250f37c208fa09bbdc10f68faaf1.jpg', '2022-12-08 02:00:15', '2022-12-08 18:30:15'),
(433, 79, 'b8aa9f883ed30a0bc5995868bccca4ed.jpg', '2022-12-08 02:00:15', '2022-12-08 18:30:15'),
(434, 79, '428e8e978da584dcda8486f8d6ecf7ec.jpg', '2022-12-08 02:00:15', '2022-12-08 18:30:15'),
(435, 79, '74f134b684c4b2bad2d34ed96df6c39e.jpg', '2022-12-08 02:00:15', '2022-12-08 18:30:15'),
(436, 79, '7660efbd9f59ef0ce289ca544fe5b67e.jpg', '2022-12-08 02:00:15', '2022-12-08 18:30:15'),
(437, 79, 'a498e48a169acbb0cfc42b8846729cef.jpg', '2022-12-08 02:00:15', '2022-12-08 18:30:15'),
(438, 80, '707fda0e62b3976e16909a1b1d9e0a6e.jpg', '2022-12-08 02:03:42', '2022-12-08 18:33:42'),
(439, 80, '1349a686f0199c2390c2eb8498383314.jpg', '2022-12-08 02:03:42', '2022-12-08 18:33:42'),
(440, 80, '84f7dd5e2cec539209b0b90ad45a8135.jpg', '2022-12-08 02:03:42', '2022-12-08 18:33:42'),
(441, 80, '7dd03027d2a993b341e6214e2cb026b3.jpg', '2022-12-08 02:03:42', '2022-12-08 18:33:42'),
(442, 80, '36c5962d56823ce1075c21c16c302db0.jpg', '2022-12-08 02:03:42', '2022-12-08 18:33:42'),
(443, 80, 'be10dc239bd04cfb64407bda33b9f9e4.jpg', '2022-12-08 02:03:42', '2022-12-08 18:33:42'),
(444, 81, 'd8ccd68c639a09042497f9cc6e31cc61.jpg', '2022-12-08 02:06:19', '2022-12-08 18:36:19'),
(445, 81, '437e7707a980e4efe3c0e00751b10c19.jpg', '2022-12-08 02:06:19', '2022-12-08 18:36:19'),
(446, 81, '1290ea665f48957b50634cd000ab732a.jpg', '2022-12-08 02:06:19', '2022-12-08 18:36:19'),
(447, 81, '627c28daa508a820c02ab23a20f77759.jpg', '2022-12-08 02:06:19', '2022-12-08 18:36:19'),
(448, 81, '3e6426cd83533e86cd9670c786add1b5.jpg', '2022-12-08 02:06:19', '2022-12-08 18:36:19'),
(449, 81, 'd89cae41b14cf95e75ea214b2725adb3.jpg', '2022-12-08 02:06:19', '2022-12-08 18:36:19'),
(450, 82, '71946e973bce045a16e473466953cb65.jpg', '2022-12-08 02:08:41', '2022-12-08 18:38:41'),
(451, 82, '81c2da6b73c4968964db14cfe7a1ceec.jpg', '2022-12-08 02:08:41', '2022-12-08 18:38:41'),
(452, 82, 'f52e466366ecf8f36d3279b16a2e35cc.jpg', '2022-12-08 02:08:41', '2022-12-08 18:38:41'),
(453, 82, '0a39d6f7783d6c37ed3f9eb85f8930cb.jpg', '2022-12-08 02:08:41', '2022-12-08 18:38:41'),
(454, 82, '4affab03d3d851a4430b6564dff18737.jpg', '2022-12-08 02:08:41', '2022-12-08 18:38:41'),
(455, 83, '09d9091ed6858e98847fc48c5738da7f.jpg', '2022-12-08 02:10:59', '2022-12-08 18:40:59'),
(456, 83, '2d515659dc32309f31cdb7abd8247260.jpg', '2022-12-08 02:10:59', '2022-12-08 18:40:59'),
(457, 83, 'c0da3429fbea87693db8e7ead8d4efd6.jpg', '2022-12-08 02:10:59', '2022-12-08 18:40:59'),
(458, 83, 'c6b4ae8cb919bceb65e403081a079cf3.jpg', '2022-12-08 02:10:59', '2022-12-08 18:40:59'),
(459, 83, '70b306d3635e1c91ef03800482036be8.jpg', '2022-12-08 02:10:59', '2022-12-08 18:40:59'),
(460, 84, '0614324fc7bd47b23c450f8c9ed754f5.jpg', '2022-12-08 02:13:50', '2022-12-08 18:43:50'),
(461, 84, '6023d07aa30994e316305e5aa9f1cfea.jpg', '2022-12-08 02:13:50', '2022-12-08 18:43:50'),
(462, 84, 'e78a0c1d9feac9c42c44c1d12f19a520.jpg', '2022-12-08 02:13:50', '2022-12-08 18:43:50'),
(463, 84, '05b68f0cfa2e104261b2727fcdcfe2f6.jpg', '2022-12-08 02:13:50', '2022-12-08 18:43:50'),
(464, 84, '1b622cfda2f44321ce553509259bfb14.jpg', '2022-12-08 02:13:50', '2022-12-08 18:43:50'),
(465, 85, 'ac1ecf4808868d1fa48bc229f880201e.jpg', '2022-12-09 05:46:58', '2022-12-09 10:16:58'),
(466, 85, 'db06616c1be5e51d909a2b0545481e20.jpg', '2022-12-09 05:46:58', '2022-12-09 10:16:58'),
(467, 85, '9c67da6c2fccbe77cfea9ea099544e9e.jpg', '2022-12-09 05:46:58', '2022-12-09 10:16:58'),
(468, 85, '8907e950d07503b328f199803076e88e.jpg', '2022-12-09 05:46:58', '2022-12-09 10:16:58'),
(469, 85, '7c1feed38679e0645262fd256ae051fa.jpg', '2022-12-09 05:46:58', '2022-12-09 10:16:58'),
(470, 86, 'f7102b4950c39e7864de5ed9653e90b9.jpg', '2022-12-09 05:50:17', '2022-12-09 10:20:17'),
(471, 86, 'de1e95f67d221b01c87fb10a7e99e991.jpg', '2022-12-09 05:50:17', '2022-12-09 10:20:17'),
(472, 86, 'c7d13fba7dcc40ee751d98d8a6ac904b.jpg', '2022-12-09 05:50:17', '2022-12-09 10:20:17'),
(473, 86, '4559ef226fb776a6aa3e89acefa51da8.jpg', '2022-12-09 05:50:17', '2022-12-09 10:20:17'),
(474, 87, 'd2df986ff20549cb431d93c223cbada7.jpg', '2022-12-09 05:58:20', '2022-12-09 10:28:20'),
(475, 87, '1cdc60871f7264d36f75815839700a32.jpg', '2022-12-09 05:58:20', '2022-12-09 10:28:20'),
(476, 87, '9d427e332742c567ce69d6844724909f.jpg', '2022-12-09 05:58:20', '2022-12-09 10:28:20'),
(477, 87, '42fa54f86136865cc4a97e17511cf18d.jpg', '2022-12-09 05:58:20', '2022-12-09 10:28:20'),
(478, 88, 'f305c0f2f9d742a63c3ef2e4982b4727.jpg', '2022-12-09 06:00:24', '2022-12-09 10:30:24'),
(479, 88, 'c301142ac28a1208cb0503efb426651c.jpg', '2022-12-09 06:00:24', '2022-12-09 10:30:24'),
(480, 88, 'f89734c2e97edbb97a3e0b25a0c54df1.jpg', '2022-12-09 06:00:24', '2022-12-09 10:30:24'),
(481, 88, '8d6913bd20300841fe79ea4c08eb5752.jpg', '2022-12-09 06:00:24', '2022-12-09 10:30:24'),
(482, 89, '743366e3535a22481e9706d049b9299e.jpg', '2022-12-09 06:07:44', '2022-12-09 10:37:44'),
(483, 89, '03dc4a17ef08bb3a58c8c80a2931e331.jpg', '2022-12-09 06:07:44', '2022-12-09 10:37:44'),
(484, 89, '533b7b1144c3e24f3c54138339f3e73f.jpg', '2022-12-09 06:07:44', '2022-12-09 10:37:44'),
(485, 89, 'd818d46fc8660b65290c4eb7f4ccd4f2.jpg', '2022-12-09 06:07:44', '2022-12-09 10:37:44'),
(486, 90, '9a8846500a3dffa18e5001ec9fd3fb61.jpg', '2022-12-09 06:10:05', '2022-12-09 10:40:05'),
(487, 90, '941abcbc06bd5b9f5b500c855a74c7a9.jpg', '2022-12-09 06:10:05', '2022-12-09 10:40:05'),
(488, 90, 'aa8448b0c22b918cc17695f11d43236f.jpg', '2022-12-09 06:10:05', '2022-12-09 10:40:05'),
(489, 90, '6b1cde3bcfac1a309d6446928b4a2d65.jpg', '2022-12-09 06:10:05', '2022-12-09 10:40:05'),
(490, 91, '9713b23a8fa460bc263ce7219800b97b.jpg', '2022-12-09 06:12:09', '2022-12-09 10:42:09'),
(491, 91, '2bed02945c464f206e1b0e83bb220010.jpg', '2022-12-09 06:12:09', '2022-12-09 10:42:09'),
(492, 91, 'f1476536889734f89f7aa564dfa8c3e5.jpg', '2022-12-09 06:12:09', '2022-12-09 10:42:09'),
(493, 91, '2fb5ffa5e74fcffbcfab47808b23a3d4.jpg', '2022-12-09 06:12:09', '2022-12-09 10:42:09'),
(494, 92, '49ce062e731ef0e9fbf4a0cf09f10e52.jpg', '2022-12-09 06:14:14', '2022-12-09 10:44:14'),
(495, 92, '041df30a3d368a1a594f2e219af3cf3e.jpg', '2022-12-09 06:14:14', '2022-12-09 10:44:14'),
(496, 92, '4ecf829d406a759ab2013eb3ce387e33.jpg', '2022-12-09 06:14:14', '2022-12-09 10:44:14'),
(497, 92, 'b993f00f89b1df7e9b5e7d44a4c5b564.jpg', '2022-12-09 06:14:14', '2022-12-09 10:44:14'),
(498, 93, '92400a84a61c1ff84b54ea16134a0401.jpg', '2022-12-09 06:16:14', '2022-12-09 10:46:14'),
(499, 93, '29ec90da23a7aa76b3ceafc4274aa323.jpg', '2022-12-09 06:16:14', '2022-12-09 10:46:14'),
(500, 93, '27693f633f2aa1c4a72b2a8dfcb346ca.jpg', '2022-12-09 06:16:14', '2022-12-09 10:46:14'),
(501, 93, 'ee8d24304d7a2969ff5f5606ef139331.jpg', '2022-12-09 06:16:14', '2022-12-09 10:46:14'),
(502, 94, 'ce9e0cca45c7cc87b467e6b0207b264a.jpg', '2022-12-09 06:20:48', '2022-12-09 10:50:48'),
(503, 94, '3ef076aaa828f877e20e1c7db8648086.jpg', '2022-12-09 06:20:48', '2022-12-09 10:50:48'),
(504, 94, 'f2bdb1a8ed0a665c9f9d33da60c0bb9b.jpg', '2022-12-09 06:20:48', '2022-12-09 10:50:48'),
(505, 94, '606096ce5ed4643546d9f32c536e950e.jpg', '2022-12-09 06:20:48', '2022-12-09 10:50:48'),
(506, 95, '75e3a1c264f590ec8eeef7439585c419.jpg', '2022-12-09 06:22:30', '2022-12-09 10:52:30'),
(507, 95, '377e1d958fb5ceb0b131735484cdd5ad.jpg', '2022-12-09 06:22:30', '2022-12-09 10:52:30'),
(508, 95, 'e810e58d10a86187c11ebcbb64759c14.jpg', '2022-12-09 06:22:30', '2022-12-09 10:52:30'),
(509, 95, 'ec4540a287cf990e6cb812e70a35f079.jpg', '2022-12-09 06:22:30', '2022-12-09 10:52:30'),
(510, 97, 'dde347b88a4778409ce1cb6dc9c33efa.jpg', '2022-12-09 06:24:58', '2022-12-09 10:54:58'),
(511, 97, '3b4830adda5f08511733cb30e6311784.jpg', '2022-12-09 06:24:58', '2022-12-09 10:54:58'),
(512, 97, '164af1a292991c51df789786f6cf8bb3.jpg', '2022-12-09 06:24:58', '2022-12-09 10:54:58'),
(513, 97, '013c706836fc78415e5386106401c388.jpg', '2022-12-09 06:24:58', '2022-12-09 10:54:58'),
(514, 97, '26c218b0d60c63bde0d3404911afd187.jpg', '2022-12-09 06:24:58', '2022-12-09 10:54:58'),
(515, 97, 'a4573ced286a5491bfbc205df81a5e41.jpg', '2022-12-09 06:24:58', '2022-12-09 10:54:58'),
(516, 96, '97719c4c64527ad43e9596b3b12dbb83.jpg', '2022-12-09 06:27:00', '2022-12-09 10:57:00'),
(517, 96, 'cdbc70d5b8d897fc5dd1c2507c8159cb.jpg', '2022-12-09 06:27:00', '2022-12-09 10:57:00'),
(518, 96, '5a9e925d0bc3b11c69900b3b74092fcf.jpg', '2022-12-09 06:27:00', '2022-12-09 10:57:00'),
(519, 96, '36f3ba44f43e92353d4efb592724c5a4.jpg', '2022-12-09 06:27:00', '2022-12-09 10:57:00'),
(520, 98, '805e12865656e422d918dc5f49b8cdb4.jpg', '2022-12-09 06:29:38', '2022-12-09 10:59:38'),
(521, 98, '22a00a54554e233be1c576ba7579850a.jpg', '2022-12-09 06:29:38', '2022-12-09 10:59:38'),
(522, 98, 'b413ebd47bd535e3a85afc9c2b811d4a.jpg', '2022-12-09 06:29:38', '2022-12-09 10:59:38'),
(523, 98, 'c160f26a38e1da1c92662abaed70f3a5.jpg', '2022-12-09 06:29:38', '2022-12-09 10:59:38'),
(524, 98, 'de2a39cbeaa0c6f0fc8171737f5df510.jpg', '2022-12-09 06:29:38', '2022-12-09 10:59:38'),
(525, 98, 'ec0a314373714cd131116c2158c09571.jpg', '2022-12-09 06:29:38', '2022-12-09 10:59:38'),
(526, 99, '26526461959c7ec58ffdee9b4a85a02b.jpg', '2022-12-09 06:34:48', '2022-12-09 11:04:48'),
(527, 99, '1647976ae5c4a0eb65109fef6894a04b.jpg', '2022-12-09 06:34:48', '2022-12-09 11:04:48'),
(528, 99, 'b5490f1a8a9e7189f9b376441cf9e0a8.jpg', '2022-12-09 06:34:48', '2022-12-09 11:04:48'),
(529, 99, 'c6a8c8d01e498ed3ed133842ebe54b8c.jpg', '2022-12-09 06:34:48', '2022-12-09 11:04:48'),
(530, 99, '7bc1ae21d49d5630e9b7195979727c4e.jpg', '2022-12-09 06:34:48', '2022-12-09 11:04:48'),
(531, 99, 'aa3ba87401dcf737ed193a6d37270107.jpg', '2022-12-09 06:34:48', '2022-12-09 11:04:48'),
(532, 100, '9a09a790a7fe3a606f20854bc0d6460a.jpg', '2022-12-09 06:37:11', '2022-12-09 11:07:11'),
(533, 100, '7105793be34a87bb4ed452e7121758c5.jpg', '2022-12-09 06:37:11', '2022-12-09 11:07:11'),
(534, 100, '55bb200a897f56290a0aedb9564139bc.jpg', '2022-12-09 06:37:11', '2022-12-09 11:07:11'),
(535, 100, '8622178c4733c3891029a2ca476ea33c.jpg', '2022-12-09 06:37:11', '2022-12-09 11:07:11'),
(536, 101, '136a51043a4b37aaced8a4ee084cb22c.jpg', '2022-12-09 06:39:00', '2022-12-09 11:09:00'),
(537, 101, '3105197fb403ac6b1f3cbcbda43c1ef2.jpg', '2022-12-09 06:39:00', '2022-12-09 11:09:00'),
(538, 101, '19bd4b8a46cfbdb3ec975a728d4fc092.jpg', '2022-12-09 06:39:00', '2022-12-09 11:09:00'),
(539, 101, '08522e95a6ba8f4e0a658282995b14c2.jpg', '2022-12-09 06:39:00', '2022-12-09 11:09:00'),
(540, 114, '6c8d12ec8d59ee4bb3b59a8e08fa3411.jpg', '2022-12-09 11:29:11', '2022-12-09 15:59:11'),
(541, 114, '84e11663c596c6b3f74bbcfd1c8a8136.jpg', '2022-12-09 11:29:11', '2022-12-09 15:59:11'),
(542, 114, '145bafa79edab30a9db6efa751e83207.jpg', '2022-12-09 11:29:11', '2022-12-09 15:59:11'),
(543, 114, '195e2685b99cf5fde35d0f695c1dfacf.jpg', '2022-12-09 11:29:11', '2022-12-09 15:59:11'),
(544, 114, '84d953e5c59b47bb56e64eaf007734fd.jpg', '2022-12-09 11:29:11', '2022-12-09 15:59:11'),
(545, 114, '18105ee01687917189ee63395d6fbe3b.jpg', '2022-12-09 11:29:11', '2022-12-09 15:59:11'),
(552, 115, 'a4cdbb579e8386304688e9edeb2a3f72.jpg', '2023-01-24 10:24:57', '2023-01-24 03:24:57'),
(553, 115, '61f03b55b00d89ee56479407c3abb4d9.jpg', '2023-01-24 10:24:57', '2023-01-24 03:24:57'),
(554, 115, 'd57b625366b3e8b8fbcda8594aa6e148.jpg', '2023-01-24 10:24:57', '2023-01-24 03:24:57'),
(555, 115, 'd01f87359bb533e28a7d2d035934ed81.jpg', '2023-01-24 10:24:57', '2023-01-24 03:24:57'),
(556, 115, '4cfebe5cf1bb312b8603015c49620148.jpg', '2023-01-24 10:24:57', '2023-01-24 03:24:57'),
(557, 115, '574d02cba8c65f8c3dd783c4f2776277.jpg', '2023-01-24 10:24:57', '2023-01-24 03:24:57'),
(558, 116, 'f6012f9578ed953cffef40fcebc296ce.jpg', '2023-01-24 10:31:00', '2023-01-24 03:31:00'),
(559, 116, '5ce17e20c951e3b55f63a978935f8cdb.jpg', '2023-01-24 10:31:00', '2023-01-24 03:31:00'),
(560, 116, 'c0a0515fa961ea31ec08d6a9e4030ef0.jpg', '2023-01-24 10:31:00', '2023-01-24 03:31:00'),
(561, 116, 'c71a64d8e45e5538b21ed4cf0831bae7.jpg', '2023-01-24 10:31:00', '2023-01-24 03:31:00'),
(562, 116, '148bf75d0570dead48cec25ffa5de142.jpg', '2023-01-24 10:31:00', '2023-01-24 03:31:00'),
(563, 116, '8e9e1a6b41c0a2b4fb5a583a94417ee1.jpg', '2023-01-24 10:31:00', '2023-01-24 03:31:00'),
(564, 116, '3a13ba806057a1909315a346a3bac7f7.jpg', '2023-01-24 10:31:00', '2023-01-24 03:31:00');
INSERT INTO `products_gallery` (`id`, `product_id`, `gal_photo`, `createDate`, `updateDate`) VALUES
(565, 117, '4f7db74fae20ff89c49442db29d8e904.jpg', '2023-01-24 10:37:37', '2023-01-24 03:37:37'),
(566, 117, '4570a35f1600c815137d4bbc222a77ef.jpg', '2023-01-24 10:37:37', '2023-01-24 03:37:37'),
(567, 117, '4b839f2ca607e4ea97d8e233839238c8.jpg', '2023-01-24 10:37:37', '2023-01-24 03:37:37'),
(568, 117, '2fc6c558f31ea4f017270535af72a296.jpg', '2023-01-24 10:37:37', '2023-01-24 03:37:37'),
(569, 118, '622a0170807a00fc4bd94cac010f9c46.jpg', '2023-01-24 10:44:54', '2023-01-24 03:44:54'),
(570, 118, 'fd04176fb485824b18f6c3c7331e71a7.jpg', '2023-01-24 10:44:54', '2023-01-24 03:44:54'),
(571, 118, 'd2026040b0a7a9f538623e62b1cc285c.jpg', '2023-01-24 10:44:54', '2023-01-24 03:44:54'),
(572, 118, 'be649a3ef7b8b989757c21aa65c761f0.jpg', '2023-01-24 10:44:54', '2023-01-24 03:44:54'),
(573, 119, '9e2bc53894159dba4bd7b91608e5ced9.jpg', '2023-01-24 10:49:07', '2023-01-24 03:49:07'),
(574, 119, '258817bae30c87c28652bfba46d6fbc4.jpg', '2023-01-24 10:49:07', '2023-01-24 03:49:07'),
(575, 119, '194778e002a293bf33f3a6c8d52edd74.jpg', '2023-01-24 10:49:07', '2023-01-24 03:49:07'),
(576, 119, '850941cf9583d6f90386ce625d512b4c.jpg', '2023-01-24 10:49:07', '2023-01-24 03:49:07'),
(577, 120, 'ec4cd60891b515472cf55ac4ba0c680d.jpg', '2023-01-24 10:53:19', '2023-01-24 03:53:19'),
(578, 120, 'dde1543dedf99f642aab4747faedf39c.jpg', '2023-01-24 10:53:19', '2023-01-24 03:53:19'),
(579, 120, 'e863cefa3d34219e2deefc06217551c0.jpg', '2023-01-24 10:53:19', '2023-01-24 03:53:19'),
(580, 120, '69cb58a5b236183438f105b82245ce50.jpg', '2023-01-24 10:53:19', '2023-01-24 03:53:19'),
(581, 121, '749e4edb6e2931e3b15be3714fd8050e.jpg', '2023-01-24 10:57:16', '2023-01-24 03:57:16'),
(582, 121, 'eb4e94854e3992530c747a9843056ef2.jpg', '2023-01-24 10:57:16', '2023-01-24 03:57:16'),
(583, 121, 'f10902eda415b632dae2ccad237cf35f.jpg', '2023-01-24 10:57:16', '2023-01-24 03:57:16'),
(584, 121, '7af428362ee91a08280efadb03f19aa9.jpg', '2023-01-24 10:57:16', '2023-01-24 03:57:16'),
(585, 122, 'bca718f07e76c189e5441172a12c428b.jpg', '2023-01-24 11:08:21', '2023-01-24 04:08:21'),
(586, 122, '50ee60fd760bdfd6bce3fb00627edc68.jpg', '2023-01-24 11:08:21', '2023-01-24 04:08:21'),
(587, 122, '06de8dae7d1d8b6dc4eed6f4d62960d8.jpg', '2023-01-24 11:08:21', '2023-01-24 04:08:21'),
(588, 122, 'c43fc0989b499e3a80ffb85d88e99744.jpg', '2023-01-24 11:08:21', '2023-01-24 04:08:21'),
(589, 123, '4d436364ce74336c4b594502a76c09fd.jpg', '2023-01-24 11:55:27', '2023-01-24 04:55:27'),
(590, 123, '77614c0524045e73e17ff8c5389348ff.jpg', '2023-01-24 11:55:27', '2023-01-24 04:55:27'),
(591, 123, '56a55088f23ec3a56e470392def2e221.jpg', '2023-01-24 11:55:27', '2023-01-24 04:55:27'),
(592, 123, '823b7708a8e6d740fbb08a6a8a551bd4.jpg', '2023-01-24 11:55:27', '2023-01-24 04:55:27'),
(593, 123, '9fea701f5d13751e5f15d96062c212e8.jpg', '2023-01-24 11:55:27', '2023-01-24 04:55:27'),
(594, 124, '8de97ecb4dcc00786babf2f8d53cd44a.jpg', '2023-01-24 12:03:00', '2023-01-24 05:03:00'),
(595, 124, '5474c2c51bbf0289971539cc18957317.jpg', '2023-01-24 12:03:00', '2023-01-24 05:03:00'),
(596, 124, 'f883f1d7ad69144e430fa9e398fa1ac0.jpg', '2023-01-24 12:03:00', '2023-01-24 05:03:00'),
(597, 124, '24342496deae63bc60de05c87687f0e8.jpg', '2023-01-24 12:03:00', '2023-01-24 05:03:00'),
(598, 125, '121c7afcddcdaa4016f49d1092355dd6.jpg', '2023-01-25 08:58:01', '2023-01-25 01:58:01'),
(599, 125, 'c6cb87ffd753ae00391fd01717b942e3.jpg', '2023-01-25 08:58:01', '2023-01-25 01:58:01'),
(600, 125, 'd104c4b64cd27f115c1704a2f3c052e7.jpg', '2023-01-25 08:58:01', '2023-01-25 01:58:01'),
(601, 125, '9833d68169d1790363623ae12af59fd7.jpg', '2023-01-25 08:58:01', '2023-01-25 01:58:01'),
(602, 126, 'bb510d170d1b98b9a8277efe6c771909.jpg', '2023-01-25 09:12:22', '2023-01-25 02:12:22'),
(603, 126, 'cecb94cccdba42d091c6c366585497a0.jpg', '2023-01-25 09:12:22', '2023-01-25 02:12:22'),
(604, 126, '5347d5e3102ddf8d51710cc0ee5b6d0b.jpg', '2023-01-25 09:12:22', '2023-01-25 02:12:23'),
(605, 126, 'e6d4a2ad25c813071f339711f9781b80.jpg', '2023-01-25 09:12:22', '2023-01-25 02:12:23'),
(606, 126, '0fc0168652aabb08345d199c0e3321cb.jpg', '2023-01-25 09:12:22', '2023-01-25 02:12:23'),
(607, 127, '724288743635333c0e1dada95608e356.jpg', '2023-01-25 10:10:39', '2023-01-25 03:10:39'),
(608, 127, '94c842d62ee393dc210246b645134d42.jpg', '2023-01-25 10:10:39', '2023-01-25 03:10:39'),
(609, 127, 'df0e4383c201bda1cc68ad68c129a24d.jpg', '2023-01-25 10:10:39', '2023-01-25 03:10:39'),
(610, 127, 'c5a28eb5df3da6bbb17b93dd455e1db3.jpg', '2023-01-25 10:10:39', '2023-01-25 03:10:39'),
(611, 127, '480e2f61316faab79d77b236c1323450.jpg', '2023-01-25 10:10:39', '2023-01-25 03:10:39'),
(612, 128, '63b582e457c74a84c4f58af5670946af.jpg', '2023-01-25 11:14:47', '2023-01-25 04:14:47'),
(613, 128, 'f02078ad28ed3c9cd6f84414b8d26de4.jpg', '2023-01-25 11:14:47', '2023-01-25 04:14:47'),
(614, 128, '4d596308a232e8f58ef29ae9aeb54314.jpg', '2023-01-25 11:14:47', '2023-01-25 04:14:47'),
(615, 128, '5caf652fdd0b625aac52a62733d99320.jpg', '2023-01-25 11:14:47', '2023-01-25 04:14:48'),
(616, 128, 'c6d33813cc4eb082914ab9cfe7a182f9.jpg', '2023-01-25 11:14:47', '2023-01-25 04:14:48'),
(617, 129, '1094a2012283e32736b3f60f988989f4.jpg', '2023-01-27 06:06:21', '2023-01-26 23:06:21'),
(618, 129, '63bae90d565337dac58e383e3a02668b.jpg', '2023-01-27 06:06:21', '2023-01-26 23:06:21'),
(619, 129, '0726d169b586b03df8e10572c89b0028.jpg', '2023-01-27 06:06:21', '2023-01-26 23:06:21'),
(620, 129, '82acade3725c17f2e2d53d1066565864.jpg', '2023-01-27 06:06:21', '2023-01-26 23:06:21'),
(621, 129, '30f4e251f3b9be2d64169ad46a02eb0f.jpg', '2023-01-27 06:06:21', '2023-01-26 23:06:21'),
(622, 130, '22359c95026c3966e0e85c1bbcd71a45.jpg', '2023-01-27 06:26:13', '2023-01-26 23:26:13'),
(623, 130, '023b3ffdcc6b47c9de962fac0f0cc3b7.jpg', '2023-01-27 06:26:13', '2023-01-26 23:26:13'),
(624, 130, 'd67731f9c27a35eedaceedce97067795.jpg', '2023-01-27 06:26:13', '2023-01-26 23:26:13'),
(625, 130, '5ffd754c97f946a2f79d079d0a3f7896.jpg', '2023-01-27 06:26:13', '2023-01-26 23:26:13'),
(626, 130, '6333c4171ed30cbe8a3b3cadedc334a4.jpg', '2023-01-27 06:26:13', '2023-01-26 23:26:13'),
(627, 132, 'fdf242b39d25b328a66c16eb18151d35.jpg', '2023-01-27 06:35:41', '2023-01-26 23:35:41'),
(628, 132, '77dee0d4ed9eb2da0f9e4a493ef787b8.jpg', '2023-01-27 06:35:41', '2023-01-26 23:35:41'),
(629, 132, '828b7c21ff4eda034e7d76a7797bef8b.jpg', '2023-01-27 06:35:41', '2023-01-26 23:35:41'),
(630, 132, '384018753264f6f6e3c8080351b40325.jpg', '2023-01-27 06:35:41', '2023-01-26 23:35:41'),
(631, 132, '5607d04aa642ce592d0f17a519748bb8.jpg', '2023-01-27 06:35:41', '2023-01-26 23:35:41'),
(632, 133, 'c288b1c04549ab5ac33d8a8a723ae231.jpg', '2023-01-27 06:39:36', '2023-01-26 23:39:36'),
(633, 133, 'd72c420e0b1936ed03504e3e187a33f8.jpg', '2023-01-27 06:39:36', '2023-01-26 23:39:36'),
(634, 133, '57fbfc66b85a51d01fa0e8da46a58da5.jpg', '2023-01-27 06:39:36', '2023-01-26 23:39:36'),
(635, 133, 'a9d9ac5968dbfa7f6b2e813f6313ce85.jpg', '2023-01-27 06:39:36', '2023-01-26 23:39:36'),
(636, 133, 'baa43ada2e092e980c5be5f925ee2bb3.jpg', '2023-01-27 06:39:36', '2023-01-26 23:39:36'),
(637, 133, '707baf0f1aa11d06bdcdf20dcedc88b3.jpg', '2023-01-27 06:39:36', '2023-01-26 23:39:36'),
(638, 133, '2007248210153a2233b1f72ecbd81a99.jpg', '2023-01-27 06:39:36', '2023-01-26 23:39:36'),
(639, 134, '059beb570b828b57517427d1b9d7f73e.jpg', '2023-01-27 06:42:58', '2023-01-26 23:42:58'),
(640, 134, '94dfc76993bd67faf7851808d827f83c.jpg', '2023-01-27 06:42:58', '2023-01-26 23:42:58'),
(641, 134, 'd85ef88330e023917f45a5d3082784a7.jpg', '2023-01-27 06:42:58', '2023-01-26 23:42:58'),
(642, 134, 'c6d5e8cb426c73f875e21d8f7869caff.jpg', '2023-01-27 06:42:58', '2023-01-26 23:42:58'),
(643, 134, 'e5d002a82f5ee11e69dd93de3ba1d370.jpg', '2023-01-27 06:42:58', '2023-01-26 23:42:59'),
(644, 135, '4d73fdc5858cbb627db101074f729e7b.jpg', '2023-01-27 06:45:24', '2023-01-26 23:45:24'),
(645, 135, '286fb4acc797f86033439140eeb944e3.jpg', '2023-01-27 06:45:24', '2023-01-26 23:45:24'),
(646, 135, '04bf0504ce849ccebf2856ec6feb0b31.jpg', '2023-01-27 06:45:24', '2023-01-26 23:45:24'),
(647, 135, 'b3b11c9fe6ccd5737560970bd24f1ae3.jpg', '2023-01-27 06:45:24', '2023-01-26 23:45:24'),
(648, 135, 'dd97bfbee323ff4eb8c81ae46a75b815.jpg', '2023-01-27 06:45:24', '2023-01-26 23:45:24'),
(649, 136, '8f47506d4bd04ac803a3221e7012b03d.jpg', '2023-01-27 06:48:48', '2023-01-26 23:48:48'),
(650, 136, '955371b37b941b652bcb5aac87584501.jpg', '2023-01-27 06:48:48', '2023-01-26 23:48:48'),
(651, 136, '7b78f51edb856265fd672b8a203eb8c7.jpg', '2023-01-27 06:48:48', '2023-01-26 23:48:48'),
(652, 136, 'd15f908b8b23a5bfcf692b7725647563.jpg', '2023-01-27 06:48:48', '2023-01-26 23:48:48'),
(653, 136, '4abd4fe5f605fa75092888376ee4341b.jpg', '2023-01-27 06:48:48', '2023-01-26 23:48:48'),
(654, 137, 'a975b793b89ae38dc011a1e75295af76.jpg', '2023-01-27 06:52:32', '2023-01-26 23:52:32'),
(655, 137, 'a9f0fa1d57c504e2c33740c241fa4266.jpg', '2023-01-27 06:52:32', '2023-01-26 23:52:32'),
(656, 137, 'f84d5de34a7ec34d649cb202468178a3.jpg', '2023-01-27 06:52:32', '2023-01-26 23:52:32'),
(657, 137, 'cf234f5b0e969fbd002c5ea18da76386.jpg', '2023-01-27 06:52:32', '2023-01-26 23:52:32'),
(658, 137, '819b37eded7dfe2df39c81b5ecdf9352.jpg', '2023-01-27 06:52:32', '2023-01-26 23:52:32'),
(659, 138, '15088291acb490fb521980ad9e6d723a.jpg', '2023-01-27 06:55:01', '2023-01-26 23:55:02'),
(660, 138, 'df47519d711d41bd509cd4ab152ac67c.jpg', '2023-01-27 06:55:01', '2023-01-26 23:55:02'),
(661, 138, '344e888f7efa91c8d000d4f61701c75a.jpg', '2023-01-27 06:55:01', '2023-01-26 23:55:02'),
(662, 138, '7696b37d2f8885ab50eb24e4e4f20593.jpg', '2023-01-27 06:55:01', '2023-01-26 23:55:02'),
(663, 138, 'a0ba9b807fd22c483656930eeab3a8d6.jpg', '2023-01-27 06:55:01', '2023-01-26 23:55:02'),
(664, 140, 'b9d62118a78600156001289d47fc9a19.jpg', '2023-01-27 07:11:56', '2023-01-27 00:11:56'),
(665, 140, 'd04603f263f2306f7202a033f65cae4b.jpg', '2023-01-27 07:11:56', '2023-01-27 00:11:56'),
(666, 140, '5983819da7438973227549ecd4df3e0b.jpg', '2023-01-27 07:11:56', '2023-01-27 00:11:56'),
(667, 140, '271e1c16105e248e5540da0fb7889825.jpg', '2023-01-27 07:11:56', '2023-01-27 00:11:56'),
(668, 141, '9d6cdbd06b53cb1cadbbb536f7629218.jpg', '2023-01-27 07:19:47', '2023-01-27 00:19:47'),
(669, 141, 'bc52bbdaee3d224f928664cca9bff051.jpg', '2023-01-27 07:19:47', '2023-01-27 00:19:47'),
(670, 141, '50ae319ed7ab8e1fe4938f955700c72d.jpg', '2023-01-27 07:19:47', '2023-01-27 00:19:47'),
(671, 141, '54eb41f34bd08630e130e1467b6f6b76.jpg', '2023-01-27 07:19:47', '2023-01-27 00:19:47'),
(672, 142, '119fc5604072b9a9b2f224df94fa8dc3.jpg', '2023-01-27 07:26:12', '2023-01-27 00:26:12'),
(673, 142, 'a9572fe6129490732ddfae755efd8aa2.jpg', '2023-01-27 07:26:12', '2023-01-27 00:26:12'),
(674, 142, '9f58ce0012483cd3a8d874f4facb7e35.jpg', '2023-01-27 07:26:12', '2023-01-27 00:26:12'),
(675, 142, '1143723f4238c7dc11d2ef94bbb6e1e6.jpg', '2023-01-27 07:26:12', '2023-01-27 00:26:12'),
(676, 143, '6453e1de846a672051bee6fdb388e866.jpg', '2023-01-27 07:37:47', '2023-01-27 00:37:47'),
(677, 143, '14fbfe54046b8efd84b8e9ab8db2e311.jpg', '2023-01-27 07:37:47', '2023-01-27 00:37:48'),
(678, 143, '86ddc20c1dcb2ea8be88be0b7e983d0c.jpg', '2023-01-27 07:37:47', '2023-01-27 00:37:48'),
(679, 143, 'c5d4cfb96ea035a61a0d5d8918a471f2.jpg', '2023-01-27 07:37:47', '2023-01-27 00:37:48'),
(684, 131, '06dd0af31175dc9b5e14adb58866909f.jpg', '2023-01-27 07:54:46', '2023-01-27 00:54:47'),
(685, 131, '2c7c9f446ee8a6280962d41c12b22df5.jpg', '2023-01-27 07:54:46', '2023-01-27 00:54:47'),
(686, 131, '7794ea8c5d7c2677f1d3a14ec52f92db.jpg', '2023-01-27 07:54:46', '2023-01-27 00:54:47'),
(687, 131, '7d2c3b8f290bd9f7497b8dd6dc88140f.jpg', '2023-01-27 07:54:46', '2023-01-27 00:54:47'),
(688, 131, '06ced27386c65bfbcd99763971c5a159.jpg', '2023-01-27 07:54:46', '2023-01-27 00:54:47'),
(689, 145, '2756369affd37485ce6e00273f3e8039.jpg', '2023-01-27 08:53:46', '2023-01-27 01:53:46'),
(690, 145, 'a47923f8d91fe0dfeadc259336ba3f70.jpg', '2023-01-27 08:53:46', '2023-01-27 01:53:46'),
(691, 145, '16fbd05ef95a0528e1ae5be371af4acf.jpg', '2023-01-27 08:53:46', '2023-01-27 01:53:46'),
(692, 144, '9ec0cb957b85ddb8fbfb1969e91d4170.jpg', '2023-01-27 09:18:00', '2023-01-27 02:18:00'),
(693, 144, '2bbdc7ca10bb9df370f01e0f238fde12.jpg', '2023-01-27 09:18:00', '2023-01-27 02:18:00'),
(694, 144, '4c53077a2b414ab72ef21f9c02983d6e.jpg', '2023-01-27 09:18:00', '2023-01-27 02:18:00'),
(695, 144, '265a84e24eb2fa12e61e6ec7fbe9175a.jpg', '2023-01-27 09:18:00', '2023-01-27 02:18:00'),
(696, 139, '1f2e882660bf3e71469de31778ad9ca0.jpg', '2023-01-27 10:07:30', '2023-01-27 03:07:30'),
(697, 139, '1b5dc569d8dc92e01a62b71ac31aa621.jpg', '2023-01-27 10:07:30', '2023-01-27 03:07:30'),
(698, 139, '87847199e20836fa85b07df7071e3e10.jpg', '2023-01-27 10:07:30', '2023-01-27 03:07:30'),
(699, 146, '01c2c0c6e31858ab061f21f1ab24acf7.jpg', '2023-01-30 07:37:24', '2023-01-30 00:37:24'),
(700, 146, '603166ab4010093695d4c241b1f8da83.jpg', '2023-01-30 07:37:24', '2023-01-30 00:37:24'),
(701, 146, '89115a009bc8473de7ee8e98937420a6.jpg', '2023-01-30 07:37:24', '2023-01-30 00:37:24'),
(702, 146, '1bbd66ea3fd6eac42bc2516e560a545b.jpg', '2023-01-30 07:37:24', '2023-01-30 00:37:24'),
(703, 146, 'ed4685b7082566db047082d307360490.jpg', '2023-01-30 07:37:24', '2023-01-30 00:37:24'),
(704, 147, '90fef30e5205dca9904e2bdbe25e744a.jpg', '2023-01-30 07:40:23', '2023-01-30 00:40:23'),
(705, 147, '966d791ef55167635fb20082925d7c20.jpg', '2023-01-30 07:40:23', '2023-01-30 00:40:23'),
(706, 147, '693e35c612c9086e8230defd704e2941.jpg', '2023-01-30 07:40:23', '2023-01-30 00:40:23'),
(707, 147, 'de12dc7da0a39a8f926caac766ed5a30.jpg', '2023-01-30 07:40:23', '2023-01-30 00:40:23'),
(708, 147, '127bd499339ae566602fbb6653eafc59.jpg', '2023-01-30 07:40:23', '2023-01-30 00:40:23'),
(709, 147, '8000f99f06dc70b407c193bdf2f6af63.jpg', '2023-01-30 07:40:23', '2023-01-30 00:40:23'),
(710, 148, 'd0849cadda87fb6a753e852d572f6553.jpg', '2023-01-30 07:41:50', '2023-01-30 00:41:50'),
(711, 148, '9b45c02a437f33d5f29bb2b77603d63f.jpg', '2023-01-30 07:41:50', '2023-01-30 00:41:50'),
(712, 148, '59c4d43a388b6378ec8a9e4ec12687a5.jpg', '2023-01-30 07:41:50', '2023-01-30 00:41:50'),
(713, 148, '3469e3c8a6e0d9f8f89b1ef359e099c5.jpg', '2023-01-30 07:41:50', '2023-01-30 00:41:50'),
(714, 149, '6b68e2e652e603a82736ebdceaf18679.jpg', '2023-01-30 07:43:07', '2023-01-30 00:43:07'),
(715, 149, 'a0136d9a5ef2ebc6eba1563072b177cf.jpg', '2023-01-30 07:43:07', '2023-01-30 00:43:07'),
(716, 149, 'eb993b2331c3643fad426c451fdc8573.jpg', '2023-01-30 07:43:07', '2023-01-30 00:43:07'),
(717, 149, '6125c4ad4594e6edcc4d3a399afb3e93.jpg', '2023-01-30 07:43:07', '2023-01-30 00:43:07'),
(718, 150, 'a9d02d5d8bf2a3276a458e442854ff0c.jpg', '2023-01-30 07:44:15', '2023-01-30 00:44:15'),
(719, 150, 'b3d396bc8c4f9e9ac13a53613077bfe3.jpg', '2023-01-30 07:44:15', '2023-01-30 00:44:15'),
(720, 150, '8a437f764d3a4cd59798cef1d0fa807d.jpg', '2023-01-30 07:44:15', '2023-01-30 00:44:15'),
(721, 150, '1514d38df33f80f48f349cba9120a1d2.jpg', '2023-01-30 07:44:15', '2023-01-30 00:44:15'),
(722, 151, 'bad6ce2cc1acc4e7ebda339f632065ef.jpg', '2023-01-30 07:46:39', '2023-01-30 00:46:39'),
(723, 151, '14f15f363dd5b0ca9b00f94bfe0d6159.jpg', '2023-01-30 07:46:39', '2023-01-30 00:46:39'),
(724, 151, '38c75707725d0c683bf704d42b564cc2.jpg', '2023-01-30 07:46:39', '2023-01-30 00:46:39'),
(725, 151, '3b1f9351a6b426c2b2ca8bd707b7e96c.jpg', '2023-01-30 07:46:39', '2023-01-30 00:46:39'),
(726, 152, '5b31fdf047d0f8e3c34c7fd2b2a00048.jpg', '2023-01-30 07:47:56', '2023-01-30 00:47:56'),
(727, 152, 'f604b6bbc32c5154e439ee22fcf008eb.jpg', '2023-01-30 07:47:56', '2023-01-30 00:47:56'),
(728, 152, 'aa775a41129297112ee9559ea4ada23e.jpg', '2023-01-30 07:47:56', '2023-01-30 00:47:56'),
(729, 152, '8c8d04317ee6692601b79a2465e1437c.jpg', '2023-01-30 07:47:56', '2023-01-30 00:47:56'),
(730, 153, 'bf8a93014ca178317a93befc9943ed18.jpg', '2023-01-30 07:49:16', '2023-01-30 00:49:16'),
(731, 153, 'e5a51ad1aad72e345a57b1ae1aadc83e.jpg', '2023-01-30 07:49:16', '2023-01-30 00:49:16'),
(732, 153, 'a6b51d3c36484e727b9d5308364bcbd8.jpg', '2023-01-30 07:49:16', '2023-01-30 00:49:16'),
(733, 153, '7d0d6672ee4616f1f70c8df47eefbced.jpg', '2023-01-30 07:49:16', '2023-01-30 00:49:16'),
(734, 154, '9962b5ef886a2184cd6241f5d531202c.jpg', '2023-01-30 07:50:36', '2023-01-30 00:50:36'),
(735, 154, '0753471620130b677efefdfc2959e2cf.jpg', '2023-01-30 07:50:36', '2023-01-30 00:50:36'),
(736, 154, 'c06dff4cfac9c225800a121a70ad1541.jpg', '2023-01-30 07:50:36', '2023-01-30 00:50:36'),
(737, 154, '182fe85afd6cba620d6503ea5cb9905b.jpg', '2023-01-30 07:50:36', '2023-01-30 00:50:36'),
(738, 155, '99e2d86ffa4d64a68267e5c67cf76c8c.jpg', '2023-01-30 07:53:13', '2023-01-30 00:53:13'),
(739, 155, '3c6e70f0f2f86ddb4d8d2e604c513a80.jpg', '2023-01-30 07:53:13', '2023-01-30 00:53:13'),
(740, 155, '915bad65c9723a50db100bec0ff286e8.jpg', '2023-01-30 07:53:13', '2023-01-30 00:53:13'),
(741, 155, '2186180bd5a3c698ba054110de649c5d.jpg', '2023-01-30 07:53:13', '2023-01-30 00:53:13'),
(742, 156, 'fe40e6ff618b79d1abd97e44d8ef4f31.jpg', '2023-01-30 07:54:18', '2023-01-30 00:54:18'),
(743, 156, '1b002fde9796609a58195d6f07e65152.jpg', '2023-01-30 07:54:18', '2023-01-30 00:54:18'),
(744, 156, '8c2e9315fe5c5604e46c104ef9ece6b5.jpg', '2023-01-30 07:54:18', '2023-01-30 00:54:18'),
(745, 156, 'f36f99baa55e8924b9e15220d2f0df69.jpg', '2023-01-30 07:54:18', '2023-01-30 00:54:18'),
(746, 157, 'dffe7b0dc6198c2b1c420d48629fea95.jpg', '2023-01-31 07:04:52', '2023-01-31 00:04:52'),
(747, 157, 'a5220dda9f5fac8a7f575ee5ace8272c.jpg', '2023-01-31 07:04:52', '2023-01-31 00:04:52'),
(748, 157, 'dac7944d5ee5f5041087f13bbf201651.jpg', '2023-01-31 07:04:52', '2023-01-31 00:04:52'),
(749, 157, 'a02d87834cd92729e2cca4dd16afeaa9.jpg', '2023-01-31 07:04:52', '2023-01-31 00:04:52'),
(750, 157, '18c4a733c749ea97e6391c5f4b63f24a.jpg', '2023-01-31 07:04:52', '2023-01-31 00:04:52'),
(751, 157, '91c9ef65d4a50d54096970c4ed971ebd.jpg', '2023-01-31 07:04:52', '2023-01-31 00:04:52'),
(752, 158, '4c7033472f2b3f8257d02ba3f9748990.jpg', '2023-01-31 07:06:01', '2023-01-31 00:06:01'),
(753, 158, '9be1f1848f99d3103dbdb6ac4f6e38ac.jpg', '2023-01-31 07:06:01', '2023-01-31 00:06:01'),
(754, 158, '6ae0a0636022656c8879cf5f04cdaa3c.jpg', '2023-01-31 07:06:01', '2023-01-31 00:06:01'),
(755, 158, 'f53ba215f2ad6ee779e45da5204a3ee5.jpg', '2023-01-31 07:06:01', '2023-01-31 00:06:01'),
(756, 159, 'c50ac87d4599950e90b9ca2837437f29.jpg', '2023-01-31 07:06:59', '2023-01-31 00:06:59'),
(757, 159, '134bc6aa855c505b9ee411e9a2e02fea.jpg', '2023-01-31 07:06:59', '2023-01-31 00:06:59'),
(758, 159, 'aa2c1fdfb219cdab7b42fc97cf8dc222.jpg', '2023-01-31 07:06:59', '2023-01-31 00:06:59'),
(759, 159, '28eabd45be5464647a4c506878ebee40.jpg', '2023-01-31 07:06:59', '2023-01-31 00:06:59'),
(760, 160, '39a59230d5946b754719abcfce8f889e.jpg', '2023-01-31 07:07:49', '2023-01-31 00:07:49'),
(761, 160, 'ec8a5ddf9ede627222b7a4504606a2e4.jpg', '2023-01-31 07:07:49', '2023-01-31 00:07:49'),
(762, 160, '4cdea093eea7c24757e50d5863e6e177.jpg', '2023-01-31 07:07:49', '2023-01-31 00:07:49'),
(763, 160, '8b38086ef35ec9bd90810a18fe20ba41.jpg', '2023-01-31 07:07:49', '2023-01-31 00:07:49'),
(764, 161, '2f28966ff2b3914c9b296a09d66c6c23.jpg', '2023-01-31 07:09:41', '2023-01-31 00:09:41'),
(765, 161, '3afcf6454b9c66a12c19524b0fdc9849.jpg', '2023-01-31 07:09:41', '2023-01-31 00:09:41'),
(766, 161, '2ed07e34e2ab67955cbb9dbb01696195.jpg', '2023-01-31 07:09:41', '2023-01-31 00:09:41'),
(767, 161, '4edb4d4f57995d6be128447650604303.jpg', '2023-01-31 07:09:41', '2023-01-31 00:09:41'),
(768, 162, 'efb448ccc2de7fc87564139ed23f37c9.jpg', '2023-01-31 08:52:07', '2023-01-31 01:52:07'),
(769, 162, '3b6eb1e5f8c7d770d06f34b7914bb510.jpg', '2023-01-31 08:52:07', '2023-01-31 01:52:07'),
(770, 162, '903f0fd3cc8bf0d9169fe3b512a7dccc.jpg', '2023-01-31 08:52:07', '2023-01-31 01:52:07'),
(771, 162, '4347deec91926d7a62b07cde5c2d3882.jpg', '2023-01-31 08:52:07', '2023-01-31 01:52:07'),
(772, 162, 'b1ce7e075f3c8312acae648e0581856a.jpg', '2023-01-31 08:52:07', '2023-01-31 01:52:07'),
(773, 163, '74146f69dd8368007bb3240133aed799.jpg', '2023-01-31 08:52:54', '2023-01-31 01:52:54'),
(774, 163, '6f20f30613c832496f47c54c26b7a3e2.jpg', '2023-01-31 08:52:54', '2023-01-31 01:52:54'),
(775, 163, 'c2a54a8d5624cbfe52037eb1a5ea0203.jpg', '2023-01-31 08:52:54', '2023-01-31 01:52:54'),
(776, 163, 'e4be6c13a7fb0b44328d877dde0b3fd3.jpg', '2023-01-31 08:52:54', '2023-01-31 01:52:54'),
(777, 163, '361380d324e66156a7a2632e1594bf80.jpg', '2023-01-31 08:52:54', '2023-01-31 01:52:54'),
(778, 164, 'f953f7ddbbb9b1f60c8994ba58aed934.jpg', '2023-01-31 08:53:34', '2023-01-31 01:53:34'),
(779, 164, 'd73996f5b5aad183d958a48f69b4949b.jpg', '2023-01-31 08:53:34', '2023-01-31 01:53:34'),
(780, 164, 'd3bb9e3c8064ae7e733562fa1990c7d8.jpg', '2023-01-31 08:53:34', '2023-01-31 01:53:34'),
(781, 164, '457985c48c270a9059916cb514f01023.jpg', '2023-01-31 08:53:34', '2023-01-31 01:53:34'),
(782, 164, 'fd80ef1c9edd1865b03db53bac8b1209.jpg', '2023-01-31 08:53:34', '2023-01-31 01:53:34'),
(783, 165, 'dcb23c82c6510fa7dd5b1eef55eea0ae.jpg', '2023-01-31 08:54:18', '2023-01-31 01:54:18'),
(784, 165, 'bc6662dfdd782b78a97751efd61e2e88.jpg', '2023-01-31 08:54:18', '2023-01-31 01:54:18'),
(785, 165, 'b64a11fbb33d25d84b21989016bba421.jpg', '2023-01-31 08:54:18', '2023-01-31 01:54:18'),
(786, 165, '4f2b072ac64277f4b6a234582cebead3.jpg', '2023-01-31 08:54:18', '2023-01-31 01:54:18'),
(787, 165, 'd9655c11614ba317707d201ac2e7d547.jpg', '2023-01-31 08:54:18', '2023-01-31 01:54:18'),
(788, 166, '77589e32fa98cc9f4ef7a533b03e27af.jpg', '2023-01-31 08:55:05', '2023-01-31 01:55:05'),
(789, 166, '4296a469686097c5be76f40f788c066f.jpg', '2023-01-31 08:55:05', '2023-01-31 01:55:05'),
(790, 166, 'a85f6f84744028cf3ca9ce4071634da2.jpg', '2023-01-31 08:55:05', '2023-01-31 01:55:05'),
(791, 166, '41ed49493e76397089da343a9674dd10.jpg', '2023-01-31 08:55:05', '2023-01-31 01:55:05'),
(792, 166, '420700a48871fc21e6320e6d493a460e.jpg', '2023-01-31 08:55:05', '2023-01-31 01:55:05'),
(793, 167, 'c1ca7ee54e54b3f053d4c4c12c162140.jpg', '2023-01-31 08:55:45', '2023-01-31 01:55:45'),
(794, 167, '6fbab25869d8a22166410b26148fc597.jpg', '2023-01-31 08:55:45', '2023-01-31 01:55:45'),
(795, 167, 'feaaaf7ec6fdc4088fababed7491ff07.jpg', '2023-01-31 08:55:45', '2023-01-31 01:55:45'),
(796, 167, 'cc9704390d51ee216a596bd83ad995d3.jpg', '2023-01-31 08:55:45', '2023-01-31 01:55:45'),
(797, 167, '9b05db2c9c66dabecc2b3f49f8e55a24.jpg', '2023-01-31 08:55:45', '2023-01-31 01:55:45'),
(798, 168, 'd191840b4840bdd3dd950114f596596a.jpg', '2023-02-07 12:40:33', '2023-02-07 05:40:33'),
(799, 168, '9ad4323ab87d5846d6eb4dde274e3ad7.jpg', '2023-02-07 12:40:33', '2023-02-07 05:40:33'),
(800, 168, '55ef0301d2f9c0e663c36e75644076bf.jpg', '2023-02-07 12:40:33', '2023-02-07 05:40:33'),
(801, 168, '5e0ddc6ce98e396cc84a9be6cd0b3969.jpg', '2023-02-07 12:40:33', '2023-02-07 05:40:33'),
(802, 168, '5764c60cdf6217238a3f70922f1f306d.jpg', '2023-02-07 12:40:33', '2023-02-07 05:40:33'),
(803, 168, 'c9e0b723d597ff6b6bcf8e681d395c94.jpg', '2023-02-07 12:40:33', '2023-02-07 05:40:33'),
(804, 169, '9047fb68696a69d22f714df9e65749ee.jpg', '2023-02-07 12:41:24', '2023-02-07 05:41:24'),
(805, 169, '85db00619ba985a647600c6947832ced.jpg', '2023-02-07 12:41:24', '2023-02-07 05:41:24'),
(806, 169, 'a75617ac1a5f71f14e6b9e9cf49a6618.jpg', '2023-02-07 12:41:24', '2023-02-07 05:41:24'),
(807, 169, '8c0e8e36ec1ea20ae5388f779e81e80e.jpg', '2023-02-07 12:41:24', '2023-02-07 05:41:24'),
(808, 169, 'e7d8259d5f458ef818096ec7b263dd42.jpg', '2023-02-07 12:41:24', '2023-02-07 05:41:24'),
(809, 170, 'f0e7601771be52f4b0237e547cc9c9eb.jpg', '2023-02-07 12:42:20', '2023-02-07 05:42:20'),
(810, 170, 'b291efae137162c1bcc81c57e031d44a.jpg', '2023-02-07 12:42:20', '2023-02-07 05:42:20'),
(811, 170, '2dc9abea4c218a36fb9ee798094a18a3.jpg', '2023-02-07 12:42:20', '2023-02-07 05:42:20'),
(812, 170, 'e6b982080035a84b898135a93f2ecbab.jpg', '2023-02-07 12:42:20', '2023-02-07 05:42:20'),
(813, 171, 'fcae80e65ef712f48dd9931a8aba976c.jpg', '2023-02-07 12:43:12', '2023-02-07 05:43:12'),
(814, 171, '904d4b7a69b869d79558f8891a1888b0.jpg', '2023-02-07 12:43:12', '2023-02-07 05:43:12'),
(815, 171, '8f6a97434f4210f5585f712cda88a66f.jpg', '2023-02-07 12:43:12', '2023-02-07 05:43:12'),
(816, 171, '2fdfb5cb190fb35693adf01b6b490883.jpg', '2023-02-07 12:43:12', '2023-02-07 05:43:12'),
(817, 172, '200e7a7533a441768fd7930a3338fbd6.jpg', '2023-02-07 12:43:58', '2023-02-07 05:43:58'),
(818, 172, 'a2f9eb008b97bb83b3a9cd93a7a2fdcd.jpg', '2023-02-07 12:43:58', '2023-02-07 05:43:58'),
(819, 172, 'cded77df9b8eff0bba8cb62cd06e03e2.jpg', '2023-02-07 12:43:58', '2023-02-07 05:43:58'),
(820, 172, '08a2d13ef3d0825a9e02020da5558949.jpg', '2023-02-07 12:43:58', '2023-02-07 05:43:58'),
(821, 173, '8c240273e65ab7652aafbbb21682c64d.jpg', '2023-02-07 12:44:55', '2023-02-07 05:44:55'),
(822, 173, '483810ef45b1d017eff3fbc8f1f2411f.jpg', '2023-02-07 12:44:55', '2023-02-07 05:44:55'),
(823, 173, 'f4768d5a8c56bf12ce4bfb34d53692c7.jpg', '2023-02-07 12:44:55', '2023-02-07 05:44:55'),
(824, 173, 'a0ab789b91debe49ce85c8403c26b606.jpg', '2023-02-07 12:44:55', '2023-02-07 05:44:55'),
(825, 174, 'ffe2efa27c6c0237efafae5242cf7c1d.jpg', '2023-02-07 12:45:46', '2023-02-07 05:45:46'),
(826, 174, '535afac798c6c5d95fc4388e3c315f72.jpg', '2023-02-07 12:45:46', '2023-02-07 05:45:46'),
(827, 174, '3bbe902130972f1e0f7238e980cd95f4.jpg', '2023-02-07 12:45:46', '2023-02-07 05:45:46'),
(828, 174, '7b860552c9e34606b406423806142ee9.jpg', '2023-02-07 12:45:46', '2023-02-07 05:45:46'),
(829, 176, 'f121b35b339dbbd7e9e0beca96e13a51.jpg', '2023-02-07 12:48:12', '2023-02-07 05:48:12'),
(830, 176, '91eba2845ebda13e9591ac3a8ad9b227.jpg', '2023-02-07 12:48:12', '2023-02-07 05:48:12'),
(831, 176, 'f35b2bddd07fef1f12fe0f50f5b6e3e5.jpg', '2023-02-07 12:48:12', '2023-02-07 05:48:12'),
(832, 176, '4b9bf0c8607b0ef41bc005e65779f1df.jpg', '2023-02-07 12:48:12', '2023-02-07 05:48:12'),
(833, 177, 'ba6added470f5fcf64d5991c0efd6e42.jpg', '2023-02-07 12:48:58', '2023-02-07 05:48:58'),
(834, 177, '6c4be8f25dfe96cc12b9207cf96829af.jpg', '2023-02-07 12:48:58', '2023-02-07 05:48:58'),
(835, 177, '106d451d4febea15dfa7cae4354841e5.jpg', '2023-02-07 12:48:58', '2023-02-07 05:48:58'),
(836, 177, '99cdb16a818e68590b4ea51bbbdbd5a0.jpg', '2023-02-07 12:48:58', '2023-02-07 05:48:58'),
(837, 178, '64f13cfe2b11e97a3a5221925127ac7b.jpg', '2023-02-07 12:49:53', '2023-02-07 05:49:53'),
(838, 178, 'dfa04fed54e28f6a42e3456b251cb43e.jpg', '2023-02-07 12:49:53', '2023-02-07 05:49:53'),
(839, 178, 'c5898dc54c10927939b938516b4e282b.jpg', '2023-02-07 12:49:53', '2023-02-07 05:49:53'),
(840, 178, '086d2d057d00623693759f96a1e423c4.jpg', '2023-02-07 12:49:53', '2023-02-07 05:49:53'),
(841, 175, '73c9f18883b928bcf0344c969d960910.jpg', '2023-02-07 01:00:25', '2023-02-07 06:00:25'),
(842, 175, '5e5d5deae182df789f5430cc965e63e9.jpg', '2023-02-07 01:00:25', '2023-02-07 06:00:25'),
(843, 175, 'a932494d23b77d413a792c99154ab251.jpg', '2023-02-07 01:00:25', '2023-02-07 06:00:25'),
(844, 175, 'fcc6dd15ce562cd3e6f5582663dc8738.jpg', '2023-02-07 01:00:25', '2023-02-07 06:00:25'),
(845, 179, 'e786d9831ee77f3d7059126451e6c364.jpg', '2023-02-08 06:10:53', '2023-02-07 23:10:53'),
(846, 179, '620a80ae10f0d5ee16a7ca48cb838777.jpg', '2023-02-08 06:10:53', '2023-02-07 23:10:53'),
(847, 179, 'cbacf3021a7e64e3b10bfbf777020e99.jpg', '2023-02-08 06:10:53', '2023-02-07 23:10:53'),
(848, 179, '559cc823c23a7a6d7025337bef547efc.jpg', '2023-02-08 06:10:53', '2023-02-07 23:10:53'),
(849, 179, 'c49180630d81a09eb6c29ad54f2bfe5c.jpg', '2023-02-08 06:10:53', '2023-02-07 23:10:53'),
(850, 179, '60a436e45a6fe5609bef9b93c32bc189.jpg', '2023-02-08 06:10:53', '2023-02-07 23:10:53'),
(851, 180, '97fd6bc16d85c4ebba6e6319bc284c04.jpg', '2023-02-08 06:11:48', '2023-02-07 23:11:48'),
(852, 180, 'bbb1b5b2a0e82ec502ba233823fd4525.jpg', '2023-02-08 06:11:48', '2023-02-07 23:11:48'),
(853, 180, '4614a808f362c24edf4641b54961c2a6.jpg', '2023-02-08 06:11:48', '2023-02-07 23:11:48'),
(854, 180, '68c74dde6b6d7b6615ab8fc616678bfa.jpg', '2023-02-08 06:11:48', '2023-02-07 23:11:48'),
(855, 181, '1458b9dc5a8c22caf5d70eff4be1638e.jpg', '2023-02-08 06:12:37', '2023-02-07 23:12:37'),
(856, 181, '57d4937112c75cdcf09d6103abd6cc5b.jpg', '2023-02-08 06:12:37', '2023-02-07 23:12:37'),
(857, 181, 'e7d60760e873c79a05fd7c5db398d691.jpg', '2023-02-08 06:12:37', '2023-02-07 23:12:37'),
(858, 181, '646d6ffff42c12e9a0d0eb7c9d43492c.jpg', '2023-02-08 06:12:37', '2023-02-07 23:12:37'),
(859, 182, '4c61e7899dde0cc192d23693c3174942.jpg', '2023-02-08 06:13:23', '2023-02-07 23:13:23'),
(860, 182, 'c5d76104aec8b9f0818112a87852f037.jpg', '2023-02-08 06:13:23', '2023-02-07 23:13:23'),
(861, 182, '989219bf5f6b1e506e67e8303a1f77fa.jpg', '2023-02-08 06:13:23', '2023-02-07 23:13:23'),
(862, 182, 'c260c4ff1a42d0c291f29afd8dff491f.jpg', '2023-02-08 06:13:23', '2023-02-07 23:13:23'),
(863, 183, 'cd13095b0ec880e1c6620ad5687d49c9.jpg', '2023-02-08 06:14:35', '2023-02-07 23:14:35'),
(864, 183, '0382bfe09d12ef19a73f2f107cbf1c21.jpg', '2023-02-08 06:14:35', '2023-02-07 23:14:35'),
(865, 183, '849c96b79c09d806af9d7517f44a2848.jpg', '2023-02-08 06:14:35', '2023-02-07 23:14:35'),
(866, 183, '72f003b158c7958b775bce1a1d3c372f.jpg', '2023-02-08 06:14:35', '2023-02-07 23:14:35'),
(867, 184, '2ccb6535bb07505f0c6cae0d8fb4fe85.jpg', '2023-02-08 06:21:36', '2023-02-07 23:21:37'),
(868, 184, '0b2c358a9ba7330a41286d92ccd6c195.jpg', '2023-02-08 06:21:36', '2023-02-07 23:21:37'),
(869, 184, '805cc36006ea02f8bccf52c3ef628c27.jpg', '2023-02-08 06:21:36', '2023-02-07 23:21:37'),
(870, 184, '51c3bf831acce7a540ba1c13c1feed23.jpg', '2023-02-08 06:21:36', '2023-02-07 23:21:37'),
(871, 184, 'b2efec34220a6c3f7a9458aada0684b2.jpg', '2023-02-08 06:21:36', '2023-02-07 23:21:37'),
(872, 185, 'a976443e243e13ee2da3cf6e577d5d35.jpg', '2023-02-08 06:26:19', '2023-02-07 23:26:19'),
(873, 185, 'b12b516b1a9f965744f276b5e397270d.jpg', '2023-02-08 06:26:19', '2023-02-07 23:26:19'),
(874, 185, 'b4c2283ca3a58f4cd8048fd5014c4ad3.jpg', '2023-02-08 06:26:19', '2023-02-07 23:26:19'),
(875, 185, '2185eb64da6161e5a2fd2acf2df7cbb7.jpg', '2023-02-08 06:26:19', '2023-02-07 23:26:19'),
(876, 185, '9ad2e0229bdb147d602051ec1ea40d2b.jpg', '2023-02-08 06:26:19', '2023-02-07 23:26:19'),
(877, 188, '33d13a0a8a48a72ebcb1d985aa57df00.jpg', '2023-02-15 08:55:50', '2023-02-15 01:55:50'),
(878, 188, '8752ad0c2b44d52de7e09416610e95c0.jpg', '2023-02-15 08:55:50', '2023-02-15 01:55:50'),
(879, 188, '27d98480e3400f6df988a5c037d91147.jpg', '2023-02-15 08:55:50', '2023-02-15 01:55:50'),
(880, 188, 'eca12106679e0bd2f2dc88874b40a8f5.jpg', '2023-02-15 08:55:50', '2023-02-15 01:55:50'),
(881, 187, '261531c89b8ee254d7a2bc1d28e551f2.jpg', '2023-02-15 09:00:41', '2023-02-15 02:00:41'),
(882, 187, '284531d612db46e9f2f74eacccb2eb18.jpg', '2023-02-15 09:00:41', '2023-02-15 02:00:41'),
(883, 187, '273f8238533f0a3b2a1e18d64b2212c5.jpg', '2023-02-15 09:00:41', '2023-02-15 02:00:41'),
(884, 187, '8705e845e73815805c89eb8dd1c8c497.jpg', '2023-02-15 09:00:41', '2023-02-15 02:00:41'),
(885, 187, '9fb6bfe0b8e43a446e056bd69cea702a.jpg', '2023-02-15 09:00:41', '2023-02-15 02:00:41'),
(886, 187, '79f60f839dd7dd6335d1f63b603b847f.jpg', '2023-02-15 09:00:41', '2023-02-15 02:00:41'),
(887, 186, 'c27420fe222e42aa8b896c879ddd592f.jpg', '2023-02-15 09:01:47', '2023-02-15 02:01:47'),
(888, 186, '99dd3939fdf2daf52bea671aebae690d.jpg', '2023-02-15 09:01:47', '2023-02-15 02:01:47'),
(889, 186, '211dbc1da1019fb939526b8374451f1e.jpg', '2023-02-15 09:01:47', '2023-02-15 02:01:47'),
(890, 186, '5776771a9822856acf3b45d793273972.jpg', '2023-02-15 09:01:47', '2023-02-15 02:01:47'),
(891, 186, '4b9df539ede9b3a2d09f391fd048c0bb.jpg', '2023-02-15 09:01:47', '2023-02-15 02:01:47'),
(892, 186, 'fdf47998d41d739fe1d07aba6a47409d.jpg', '2023-02-15 09:01:47', '2023-02-15 02:01:47'),
(893, 196, '58363ff5fd5e43fd4b0cc467f0e9c418.jpg', '2023-02-15 12:38:24', '2023-02-15 05:38:24'),
(894, 196, '6c13ea4e5a1ca55e91f8c779550405bc.jpg', '2023-02-15 12:38:24', '2023-02-15 05:38:24'),
(895, 196, '84b29fed1728990321179dcedd50cb0d.jpg', '2023-02-15 12:38:24', '2023-02-15 05:38:24'),
(896, 196, 'edb90acbf3e7cf3fd4fdc5e0ad08991d.jpg', '2023-02-15 12:38:24', '2023-02-15 05:38:24'),
(897, 195, 'a869b4d0308cd1406b6ee34bdfe9fd94.jpg', '2023-02-15 12:39:48', '2023-02-15 05:39:48'),
(898, 195, 'a439458b7e21b3d0efeb92ac4519a438.jpg', '2023-02-15 12:39:48', '2023-02-15 05:39:48'),
(899, 195, 'e3ffc3fea8e4f2e810a9bf948fc43fff.jpg', '2023-02-15 12:39:48', '2023-02-15 05:39:48'),
(900, 195, 'ade55000676566f11b00a93afb89c4ca.jpg', '2023-02-15 12:39:48', '2023-02-15 05:39:48'),
(901, 195, '359b3b4b726800dc69b2663de59d856f.jpg', '2023-02-15 12:39:48', '2023-02-15 05:39:48'),
(902, 194, 'f091ca1fccdd177317e7cde91a7daaa4.jpg', '2023-02-15 12:50:38', '2023-02-15 05:50:38'),
(903, 194, '78923492e0a831d8f46ceb1b17643b08.jpg', '2023-02-15 12:50:38', '2023-02-15 05:50:38'),
(904, 194, '5122e5fa35961739bcf6914c4733563c.jpg', '2023-02-15 12:50:38', '2023-02-15 05:50:38'),
(905, 194, '564a192926f66d0f83be781b28e3dd4b.jpg', '2023-02-15 12:50:38', '2023-02-15 05:50:38'),
(906, 193, 'c114c3ef9c0749d2f9c3b1613b4f3738.jpg', '2023-02-15 12:51:58', '2023-02-15 05:51:58'),
(907, 193, 'beb6f13e68d7c1a09666ff272f5fe937.jpg', '2023-02-15 12:51:58', '2023-02-15 05:51:58'),
(908, 193, '783a5f332fc8596f8632ff5ffc56c1d6.jpg', '2023-02-15 12:51:58', '2023-02-15 05:51:58'),
(909, 193, 'c685799b4aa5f17eee8b48c03b8d0832.jpg', '2023-02-15 12:51:58', '2023-02-15 05:51:58'),
(910, 192, '923247c1875d5518cb76256c421af42e.jpg', '2023-02-15 12:53:12', '2023-02-15 05:53:12'),
(911, 192, '42fd1f1efaf55369086af6eba8840f4e.jpg', '2023-02-15 12:53:12', '2023-02-15 05:53:12'),
(912, 192, 'c416e1a87a89f6458d1971a9027eaceb.jpg', '2023-02-15 12:53:12', '2023-02-15 05:53:12'),
(913, 192, '66fbbe19c92e9012b8d0eb728fa00cea.jpg', '2023-02-15 12:53:12', '2023-02-15 05:53:12'),
(914, 191, '80d6a62ff04e9660c382d9b019300c2d.jpg', '2023-02-15 12:55:43', '2023-02-15 05:55:43'),
(915, 191, 'eb0efb1c9d22614f694bf8b038d20b9a.jpg', '2023-02-15 12:55:43', '2023-02-15 05:55:43'),
(916, 191, 'ffc9f10ef218aad078d113690720d5b1.jpg', '2023-02-15 12:55:43', '2023-02-15 05:55:43'),
(917, 191, '3014a15c37169c0fa2ddedfcb5f628dd.jpg', '2023-02-15 12:55:43', '2023-02-15 05:55:43'),
(918, 190, '960d9d0cbc1f5beab4efddb0c2f01532.jpg', '2023-02-15 12:56:48', '2023-02-15 05:56:48'),
(919, 190, 'b975932f555b2d437f9552b738862055.jpg', '2023-02-15 12:56:48', '2023-02-15 05:56:48'),
(920, 190, '2afc9084c2900ab0692d53457696fb28.jpg', '2023-02-15 12:56:48', '2023-02-15 05:56:48'),
(921, 190, 'e6432a08255a965994159cc088e8dfd7.jpg', '2023-02-15 12:56:48', '2023-02-15 05:56:48'),
(922, 189, '9a0fbd68ba2c1b27cc4d2b37cc131541.jpg', '2023-02-15 01:00:00', '2023-02-15 06:00:00'),
(923, 189, 'c58695911579e545abdd2ea4c40585e4.jpg', '2023-02-15 01:00:00', '2023-02-15 06:00:00'),
(924, 189, 'f5a918fad50e13ad37de26149cb8a219.jpg', '2023-02-15 01:00:00', '2023-02-15 06:00:00'),
(925, 189, '52709f1cc588d7f6d7fb3dd1c3c65caf.jpg', '2023-02-15 01:00:00', '2023-02-15 06:00:00'),
(926, 200, 'd42b263e8c65766e94c63cf51117c787.jpg', '2023-02-16 05:49:14', '2023-02-15 22:49:14'),
(927, 200, 'd122e6241bf905c5a081e7aaadf01b02.jpg', '2023-02-16 05:49:14', '2023-02-15 22:49:14'),
(928, 200, '57bace063cc597f64d91b35a10bfc60f.jpg', '2023-02-16 05:49:14', '2023-02-15 22:49:14'),
(929, 200, '390b4f703ddf99b745faad8f5396d2c3.jpg', '2023-02-16 05:49:14', '2023-02-15 22:49:14'),
(930, 199, 'bf5890eebc5684e52157c6c78e2c8bee.jpg', '2023-02-16 05:50:14', '2023-02-15 22:50:14'),
(931, 199, '064fbd518db43714cd21859bacbabe81.jpg', '2023-02-16 05:50:14', '2023-02-15 22:50:14'),
(932, 199, '99aea4b08ccb14c9285b07b966dd14e4.jpg', '2023-02-16 05:50:14', '2023-02-15 22:50:14'),
(933, 199, 'a1b2f22c173ba53e6b46cb93577554f8.jpg', '2023-02-16 05:50:14', '2023-02-15 22:50:14'),
(934, 198, 'fb1b040a6ab2545699d04e97e33096ba.jpg', '2023-02-16 05:51:18', '2023-02-15 22:51:18'),
(935, 198, 'f6168e3ca43518a15d7ec78cebe6e738.jpg', '2023-02-16 05:51:18', '2023-02-15 22:51:18'),
(936, 198, '62ebdac3c6bc0972fad683f6d4be74e3.jpg', '2023-02-16 05:51:18', '2023-02-15 22:51:18'),
(937, 198, '0cfbbae16a4a6cbdc98ffee807da2a0e.jpg', '2023-02-16 05:51:18', '2023-02-15 22:51:18'),
(938, 197, '1e3cd00bddd086cc602e539356819240.jpg', '2023-02-16 05:52:31', '2023-02-15 22:52:31'),
(939, 197, '221585c265cea90b84cc7a72b8bfd142.jpg', '2023-02-16 05:52:31', '2023-02-15 22:52:31'),
(940, 197, '81b4c98f7fcf0ae2e7f1884a79303f17.jpg', '2023-02-16 05:52:31', '2023-02-15 22:52:31'),
(941, 197, '17d5532db01a062149552041e5620ceb.jpg', '2023-02-16 05:52:31', '2023-02-15 22:52:31'),
(942, 197, '768066a04588da883964922e423a1f68.jpg', '2023-02-16 05:52:31', '2023-02-15 22:52:31'),
(943, 197, '20a8ebee5912256d37928f2d1481196a.jpg', '2023-02-16 05:52:31', '2023-02-15 22:52:31'),
(944, 202, '37b9192f469693d1464856b3c9798b25.jpg', '2023-02-16 06:01:09', '2023-02-15 23:01:09'),
(945, 202, '59c05b46ffab81ca294bbc9f96f23282.jpg', '2023-02-16 06:01:09', '2023-02-15 23:01:09'),
(946, 202, 'f6c5f0c993abb792438ef7e491b9de42.jpg', '2023-02-16 06:01:09', '2023-02-15 23:01:09'),
(947, 202, '94824df738c9b3688e36ad3a94097e8f.jpg', '2023-02-16 06:01:09', '2023-02-15 23:01:09'),
(948, 202, 'a3ae1b97336817738546e33438d5fdf9.jpg', '2023-02-16 06:01:09', '2023-02-15 23:01:09'),
(949, 203, 'c103cc1b20723f6630bd59df01bc8105.jpg', '2023-02-16 11:11:11', '2023-02-16 04:11:11'),
(950, 203, '9f4c9c99d47502e6a3671a652c75d2ce.jpg', '2023-02-16 11:11:11', '2023-02-16 04:11:11'),
(951, 203, '75c8a6616a7e15477fd966ac3b6953bd.jpg', '2023-02-16 11:11:11', '2023-02-16 04:11:11'),
(952, 203, '70df39b37f9fd4622ad07dbd2ea892f6.jpg', '2023-02-16 11:11:11', '2023-02-16 04:11:11'),
(953, 19, 'e8bf0cd345df94abecd05382bbc2f591.jpg', '2023-02-22 01:09:19', '2023-02-22 06:09:19'),
(954, 19, '6cd1db2e652e0f161ca3a9617875a9ce.jpg', '2023-02-22 01:09:19', '2023-02-22 06:09:19'),
(955, 19, '8290e4c2589a691bbafd0f7440294de3.jpg', '2023-02-22 01:09:19', '2023-02-22 06:09:19'),
(956, 19, '9c45db9e3e72c3375442bfe3029ae1ca.jpg', '2023-02-22 01:09:19', '2023-02-22 06:09:19'),
(957, 19, 'a9e7741275d9c8729ac9189288bbf142.jpg', '2023-02-22 01:09:19', '2023-02-22 06:09:19'),
(958, 19, 'a267e2f6e12a0eb90f2fc2a12f1d8e77.jpg', '2023-02-22 01:09:19', '2023-02-22 06:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `products_old`
--

CREATE TABLE `products_old` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_old`
--

INSERT INTO `products_old` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `createDate`, `updateDate`) VALUES
(1, 1, 'DELL Inspiron 15 7000 15.6', '<p>15-inch laptop ideal for gamers. Featuring the latest Intel&reg; processors for superior gaming performance, and life-like NVIDIA&reg; GeForce&reg; graphics and an advanced thermal cooling design.</p>\r\n', 'dell-inspiron-15-7000-15-6', 899, 'dell-inspiron-15-7000-15-6.jpg', '2018-07-09', 2, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(2, 1, 'MICROSOFT Surface Pro 4 & Typecover - 128 GB', '<p>Surface Pro 4 powers through everything you need to do, while being lighter than ever before</p>\r\n\r\n<p>The 12.3 PixelSense screen has extremely high contrast and low glare so you can work through the day without straining your eyes</p>\r\n\r\n<p>keyboard is not included and needed to be purchased separately</p>\r\n\r\n<p>Features an Intel Core i5 6th Gen (Skylake) Core,Wireless: 802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible Bluetooth 4.0 wireless technology</p>\r\n\r\n<p>Ships in Consumer packaging.</p>\r\n', 'microsoft-surface-pro-4-typecover-128-gb', 799, 'microsoft-surface-pro-4-typecover-128-gb.jpg', '2018-05-10', 3, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(3, 1, 'DELL Inspiron 15 5000 15.6', '<p>Dell&#39;s 15.6-inch, midrange notebook is a bland, chunky block. It has long been the case that the Inspiron lineup lacks any sort of aesthetic muse, and the Inspiron 15 5000 follows this trend. It&#39;s a plastic, silver slab bearing Dell&#39;s logo in a mirror sheen.</p>\r\n\r\n<p>Lifting the lid reveals the 15.6-inch, 1080p screen surrounded by an almost offensively thick bezel and a plastic deck with a faux brushed-metal look. There&#39;s a fingerprint reader on the power button, and the keyboard is a black collection of island-style keys.</p>\r\n', 'dell-inspiron-15-5000-15-6', 599, 'dell-inspiron-15-5000-15-6.jpg', '2018-05-12', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(4, 1, 'LENOVO Ideapad 320s-14IKB 14\" Laptop - Grey', '<p>- Made for portability with a slim, lightweight chassis design&nbsp;<br />\r\n<br />\r\n- Powerful processing helps you create and produce on the go&nbsp;<br />\r\n<br />\r\n- Full HD screen ensures crisp visuals for movies, web pages, photos and more&nbsp;<br />\r\n<br />\r\n- Enjoy warm, sparkling sound courtesy of two Harman speakers and Dolby Audio&nbsp;<br />\r\n<br />\r\n- Fast data transfer and high-quality video connection with USB-C and HDMI ports&nbsp;<br />\r\n<br />\r\nThe Lenovo&nbsp;<strong>IdeaPad 320s-14IKB 14&quot; Laptop</strong>&nbsp;is part of our Achieve range, which has the latest tech to help you develop your ideas and work at your best. It&#39;s great for editing complex documents, business use, editing photos, and anything else you do throughout the day.</p>\r\n', 'lenovo-ideapad-320s-14ikb-14-laptop-grey', 399, 'lenovo-ideapad-320s-14ikb-14-laptop-grey.jpg', '2018-05-10', 3, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(5, 3, 'APPLE 9.7\" iPad - 32 GB, Gold', '<p>9.7 inch Retina Display, 2048 x 1536 Resolution, Wide Color and True Tone Display</p>\r\n\r\n<p>Apple iOS 9, A9X chip with 64bit architecture, M9 coprocessor</p>\r\n\r\n<p>12 MP iSight Camera, True Tone Flash, Panorama (up to 63MP), Four-Speaker Audio</p>\r\n\r\n<p>Up to 10 Hours of Battery Life</p>\r\n\r\n<p>iPad Pro Supports Apple Smart Keyboard and Apple Pencil</p>\r\n', 'apple-9-7-ipad-32-gb-gold', 339, 'apple-9-7-ipad-32-gb-gold.jpg', '2018-07-09', 3, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(6, 1, 'DELL Inspiron 15 5000 15', '<p>15-inch laptop delivering an exceptional viewing experience, a head-turning finish and an array of options designed to elevate your entertainment, wherever you go.</p>\r\n', 'dell-inspiron-15-5000-15', 449.99, 'dell-inspiron-15-5000-15.jpg', '2022-10-12', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(7, 3, 'APPLE 10.5\" iPad Pro - 64 GB, Space Grey (2017)', '<p>4K video recording at 30 fps</p>\r\n\r\n<p>12-megapixel camera</p>\r\n\r\n<p>Fingerprint resistant coating</p>\r\n\r\n<p>Antireflective coating</p>\r\n\r\n<p>Face Time video calling</p>\r\n', 'apple-10-5-ipad-pro-64-gb-space-grey-2017', 619, 'apple-10-5-ipad-pro-64-gb-space-grey-2017.jpg', '0000-00-00', 0, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(8, 1, 'ASUS Transformer Mini T102HA 10.1\" 2 in 1 - Silver', '<p>Versatile Windows 10 device with keyboard and pen included, 2-in-1 functionality: use as both laptop and tablet.Update Windows periodically to ensure that your applications have the latest security settings.</p>\r\n\r\n<p>All day battery life, rated up to 11 hours of video playback; 128GB Solid State storage. Polymer Battery.With up to 11 hours between charges, you can be sure that Transformer Mini T102HA will be right there whenever you need it. You can charge T102HA via its micro USB port, so you can use a mobile charger or any power bank with a micro USB connector.</p>\r\n', 'asus-transformer-mini-t102ha-10-1-2-1-silver', 549.99, 'asus-transformer-mini-t102ha-10-1-2-1-silver.jpg', '0000-00-00', 0, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(9, 2, 'PC SPECIALIST Vortex Core Lite Gaming PC', '<p>- Top performance for playing eSports and more&nbsp;<br />\r\n<br />\r\n- NVIDIA GeForce GTX graphics deliver smooth visuals&nbsp;<br />\r\n<br />\r\n- GeForce Experience delivers updates straight to your PC&nbsp;<br />\r\n<br />\r\nThe PC Specialist&nbsp;<strong>Vortex Core Lite&nbsp;</strong>is part of our Gaming range, bringing you the most impressive PCs available today. It has spectacular graphics and fast processing performance to suit the most exacting players.</p>\r\n', 'pc-specialist-vortex-core-lite-gaming-pc', 599.99, 'pc-specialist-vortex-core-lite-gaming-pc.jpg', '0000-00-00', 0, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(10, 2, 'DELL Inspiron 5675 Gaming PC - Recon Blue', '<p>All-new gaming desktop featuring powerful AMD Ryzen&trade; processors, graphics ready for VR, LED lighting and a meticulous design for optimal cooling.</p>\r\n', 'dell-inspiron-5675-gaming-pc-recon-blue', 599.99, 'dell-inspiron-5675-gaming-pc-recon-blue.jpg', '2018-05-10', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(11, 2, 'HP Barebones OMEN X 900-099nn Gaming PC', '<p>What&#39;s inside matters.</p>\r\n\r\n<p>Without proper cooling, top tierperformance never reaches its fullpotential.</p>\r\n\r\n<p>Nine lighting zones accentuate theaggressive lines and smooth blackfinish of this unique galvanized steelcase.</p>\r\n', 'hp-barebones-omen-x-900-099nn-gaming-pc', 489.98, 'hp-barebones-omen-x-900-099nn-gaming-pc.jpg', '2018-05-12', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(12, 2, 'ACER Aspire GX-781 Gaming PC', '<p>- GTX 1050 graphics card lets you play huge games in great resolutions&nbsp;<br />\r\n<br />\r\n- Latest generation Core&trade; i5 processor can handle demanding media software&nbsp;<br />\r\n<br />\r\n- Superfast SSD storage lets you load programs in no time&nbsp;<br />\r\n<br />\r\nThe Acer&nbsp;<strong>Aspire&nbsp;GX-781 Gaming PC&nbsp;</strong>is part of our Gaming range, which offers the most powerful PCs available today. It has outstanding graphics and processing performance to suit the most demanding gamer.</p>\r\n', 'acer-aspire-gx-781-gaming-pc', 749.99, 'acer-aspire-gx-781-gaming-pc.jpg', '2018-05-12', 3, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(13, 2, 'HP Pavilion Power 580-015na Gaming PC', '<p>Features the latest quad core Intel i5 processor and discrete graphics. With this power, you&rsquo;re ready to take on any activity from making digital art to conquering new worlds in VR.</p>\r\n\r\n<p>Choose the performance and storage you need. Boot up in seconds with to 128 GB SSD.</p>\r\n\r\n<p>Ditch the dull grey box, this desktop comes infused with style. A new angular bezel and bold green and black design give your workspace just the right amount of attitude.</p>\r\n\r\n<p>Up to 3 times faster performance - GeForce GTX 10-series graphics cards are powered by Pascal to deliver twice the performance of previous-generation graphics cards.</p>\r\n', 'hp-pavilion-power-580-015na-gaming-pc', 799.99, 'hp-pavilion-power-580-015na-gaming-pc.jpg', '2018-05-12', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(14, 2, 'LENOVO Legion Y520 Gaming PC', '<p>- Multi-task with ease thanks to Intel&reg; i5 processor&nbsp;<br />\r\n<br />\r\n- Prepare for battle with NVIDIA GeForce GTX graphics card&nbsp;<br />\r\n<br />\r\n- VR ready for the next-generation of immersive gaming and entertainment<br />\r\n<br />\r\n- Tool-less upgrade helps you personalise your system to your own demands&nbsp;<br />\r\n<br />\r\nPart of our Gaming range, which features the most powerful PCs available today, the Lenovo&nbsp;<strong>Legion Y520 Gaming PC</strong>&nbsp;has superior graphics and processing performance to suit the most demanding gamer.</p>\r\n', 'lenovo-legion-y520-gaming-pc', 899.99, 'lenovo-legion-y520-gaming-pc.jpg', '2018-05-10', 13, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(15, 2, 'PC SPECIALIST Vortex Minerva XT-R Gaming PC', '<p>- NVIDIA GeForce GTX graphics for stunning gaming visuals<br />\r\n<br />\r\n- Made for eSports with a speedy 7th generation Intel&reg; Core&trade; i5 processor<br />\r\n<br />\r\n- GeForce technology lets you directly update drivers, record your gaming and more<br />\r\n<br />\r\nThe PC Specialist&nbsp;<strong>Vortex Minerva XT-R Gaming PC</strong>&nbsp;is part of our Gaming range, which offers the most powerful PCs available. Its high-performance graphics and processing are made to meet the needs of serious gamers.</p>\r\n', 'pc-specialist-vortex-minerva-xt-r-gaming-pc', 999.99, 'pc-specialist-vortex-minerva-xt-r-gaming-pc.jpg', '2018-07-09', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(16, 2, 'PC SPECIALIST Vortex Core II Gaming PC', '<p>Processor: Intel&reg; CoreTM i3-6100 Processor- Dual-core- 3.7 GHz- 3 MB cache</p>\r\n\r\n<p>Memory (RAM): 8 GB DDR4 HyperX, Storage: 1 TB HDD, 7200 rpm</p>\r\n\r\n<p>Graphics card: NVIDIA GeForce GTX 950 (2 GB GDDR5), Motherboard: ASUS H110M-R</p>\r\n\r\n<p>USB: USB 3.0 x 3- USB 2.0 x 5, Video interface: HDMI x 1- DisplayPort x 1- DVI x 2, Audio interface: 3.5 mm jack, Optical disc drive: DVD/RW, Expansion card slot PCIe: (x1) x 2</p>\r\n\r\n<p>Sound: 5.1 Surround Sound support PSU Corsair: VS350, 350W, Colour: Black- Green highlights, Box contents: PC Specialist Vortex Core- AC power cable</p>\r\n', 'pc-specialist-vortex-core-ii-gaming-pc', 649.99, 'pc-specialist-vortex-core-ii-gaming-pc.jpg', '2018-05-10', 2, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(17, 3, 'AMAZON Fire 7 Tablet with Alexa (2017) - 8 GB, Black', '<p>The next generation of our best-selling Fire tablet ever - now thinner, lighter, and with longer battery life and an improved display. More durable than the latest iPad</p>\r\n\r\n<p>Beautiful 7&quot; IPS display with higher contrast and sharper text, a 1.3 GHz quad-core processor, and up to 8 hours of battery life. 8 or 16 GB of internal storage and a microSD slot for up to 256 GB of expandable storage.</p>\r\n', 'amazon-fire-7-tablet-alexa-2017-8-gb-black', 49.99, 'amazon-fire-7-tablet-alexa-2017-8-gb-black.jpg', '2018-05-12', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(18, 3, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 16 GB, Black', '<p>Take your personal assistant with you wherever you go with this Amazon Fire HD 8 tablet featuring Alexa voice-activated cloud service. The slim design of the tablet is easy to handle, and the ample 8-inch screen is ideal for work or play. This Amazon Fire HD 8 features super-sharp high-definition graphics for immersive streaming.</p>\r\n', 'amazon-fire-hd-8-tablet-alexa-2017-16-gb-black', 79.99, 'amazon-fire-hd-8-tablet-alexa-2017-16-gb-black.jpg', '2018-05-12', 2, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(19, 3, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 32 GB, Black', '<p>The next generation of our best-reviewed Fire tablet, with up to 12 hours of battery life, a vibrant 8&quot; HD display, a 1.3 GHz quad-core processor, 1.5 GB of RAM, and Dolby Audio. More durable than the latest iPad.</p>\r\n\r\n<p>16 or 32 GB of internal storage and a microSD slot for up to 256 GB of expandable storage.</p>\r\n', 'amazon-fire-hd-8-tablet-alexa-2017-32-gb-black', 99.99, 'amazon-fire-hd-8-tablet-alexa-2017-32-gb-black.jpg', '2018-05-10', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(20, 3, 'APPLE 9.7\" iPad - 32 GB, Space Grey', '<p>9.7-inch Retina display, wide color and true tone</p>\r\n\r\n<p>A9 third-generation chip with 64-bit architecture</p>\r\n\r\n<p>M9 motion coprocessor</p>\r\n\r\n<p>1.2MP FaceTime HD camera</p>\r\n\r\n<p>8MP iSight camera</p>\r\n\r\n<p>Touch ID</p>\r\n\r\n<p>Apple Pay</p>\r\n', 'apple-9-7-ipad-32-gb-space-grey', 339, 'apple-9-7-ipad-32-gb-space-grey.jpg', '2018-05-12', 1, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(27, 1, 'Dell XPS 15 9560', '<p>The world&rsquo;s smallest 15.6-inch performance laptop packs powerhouse performance and a stunning InfinityEdge display &mdash; all in our most powerful XPS laptop. Featuring the latest Intel&reg; processors.</p>\r\n\r\n<h2>Operating system</h2>\r\n\r\n<p><strong>Available with Windows 10 Home&nbsp;</strong>- Get the best combination of Windows features you know and new improvements you&#39;ll love.</p>\r\n\r\n<h2>Innovation that inspires.</h2>\r\n\r\n<p>When you&rsquo;re at the forefront of ingenuity, you get noticed. That&rsquo;s why it&rsquo;s no surprise the XPS 15 was honored. The winning streak continues.</p>\r\n\r\n<h2>Meet the smallest 15.6-inch laptop on the planet.</h2>\r\n\r\n<p><strong>The world&rsquo;s only 15.6-inch InfinityEdge display*:</strong>&nbsp;The virtually borderless display maximizes screen space by accommodating a 15.6-inch display inside a laptop closer to the size of a 14-inch, thanks to a bezel measuring just 5.7mm.<br />\r\n&nbsp;<br />\r\n<strong>Operating System: Windows 10 Pro.</strong><br />\r\n<br />\r\n<strong>One-of-a-kind design:</strong>&nbsp;Measuring in at a slim 11-17mm and starting at just 4 pounds (1.8 kg) with a solid state drive, the XPS 15 is one of the world&rsquo;s lightest 15-inch performance-class laptop.</p>\r\n\r\n<h2>A stunning view, wherever you go.</h2>\r\n\r\n<p><strong>Dazzling detail:</strong>&nbsp;With the UltraSharp 4K Ultra HD display (3840 x 2160), you can see each detail of every pixel without needing to zoom in. And with 6 million more pixels than Full HD and 3 million more than the MacBook Pro, you can edit images with pinpoint accuracy without worrying about blurriness or jagged lines.<br />\r\n<br />\r\n<strong>Industry-leading color:</strong>&nbsp;The XPS 15 is the only laptop with 100% Adobe RGB color, covering a wider color gamut and producing shades of color outside conventional panels so you can see more of what you see in real life. And with over 1 billion colors, images appear smoother and color gradients are amazingly lifelike with more depth and dimension. Included is Dell PremierColor software, which automatically remaps content not already in Adobe RGB format for onscreen colors that appear amazingly accurate and true to life.<br />\r\n<br />\r\n<strong>Easy collaboration:</strong>&nbsp;See your screen from nearly every angle with an IGZO IPS panel, providing a wide viewing angle of up to 170&deg;.&nbsp;<br />\r\n<br />\r\n<strong>Brighten your day:</strong>&nbsp;With 350 nit brightness, it&rsquo;s brighter than a typical laptop.<br />\r\n<br />\r\n<strong>Touch-friendly:</strong>&nbsp;Tap, swipe and pinch your way around the screen. The optional touch display lets you interact naturally with your technology.</p>\r\n', 'dell-xps-15-9560', 1599, 'dell-xps-15-9560.jpg', '2018-07-09', 9, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(28, 4, 'Samsung Note 8', '<p>See the bigger picture and communicate in a whole new way. With the Galaxy Note8 in your hand, bigger things are just waiting to happen.&nbsp;</p>\r\n\r\n<h3>The Infinity Display that&#39;s larger than life.&nbsp;</h3>\r\n\r\n<p>More screen means more space to do great things. Go big with the Galaxy Note8&#39;s 6.3&quot; screen. It&#39;s the largest ever screen on a Note device and it still fits easily in your hand.</p>\r\n\r\n<p>*Infinity Display: a near bezel-less, full-frontal glass, edge-to-edge screen.</p>\r\n\r\n<p>*Screen measured diagonally as a full rectangle without accounting for the rounded corners.</p>\r\n\r\n<p>Use the S Pen to express yourself in ways that make a difference. Draw your own emojis to show how you feel or write a message on a photo and send it as a handwritten note. Do things that matter with the S Pen.</p>\r\n\r\n<p>*Image simulated for illustration purpose only.</p>\r\n', 'samsung-note-8', 829, 'samsung-note-8.jpg', '0000-00-00', 0, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49'),
(29, 4, 'Samsung Galaxy S9+ [128 GB]', '<h2>The revolutionary camera that adapts like the human eye.&nbsp;</h2>\r\n\r\n<h3>Capture stunning pictures in bright daylight and super low light.</h3>\r\n\r\n<p>Our category-defining Dual Aperture lens adapts like the human eye. It&#39;s able to automatically switch between various lighting conditions with ease&mdash;making your photos look great whether it&#39;s bright or dark, day or night.</p>\r\n\r\n<p>*Dual Aperture supports F1.5 and F2.4 modes. Installed on the rear camera (Galaxy S9)/rear wide camera (Galaxy S9+).</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.samsung.com/global/galaxy/galaxy-s9/images/galaxy-s9_slow_gif_visual_l.jpg\" style=\"height:464px; width:942px\" />Add music. Make GIFs. Get likes</p>\r\n\r\n<p>Super Slow-mo lets you see the things you could have missed in the blink of an eye. Set the video to music or turn it into a looping GIF, and share it with a tap. Then sit back and watch the reactions roll in.</p>\r\n', 'samsung-galaxy-s9-128-gb', 889.99, 'samsung-galaxy-s9-128-gb.jpg', '2018-07-09', 3, '1', '', '', '', '2022-11-01 17:20:49', '2022-11-01 17:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `products_styles`
--

CREATE TABLE `products_styles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_styles`
--

INSERT INTO `products_styles` (`id`, `name`, `status`, `createDate`, `updateDate`) VALUES
(1, 'PAKISTANI SUIT', '1', '2022-11-08 08:19:00', '2022-11-08 12:49:00'),
(2, 'BOTTOM WEAR', '1', '2022-11-08 08:19:17', '2022-11-08 12:49:17'),
(3, 'FLOWER PRINT', '1', '2022-11-08 08:19:32', '2022-11-08 12:49:32'),
(4, 'TREE DESIGN', '1', '2022-11-08 08:19:47', '2022-11-08 12:49:47'),
(5, 'FRONT CLOSE', '1', '2022-11-08 08:20:02', '2022-11-08 12:50:02'),
(6, 'FRONT OPEN', '1', '2022-11-08 08:20:18', '2022-11-08 12:50:18'),
(7, 'NIQAB ABAYA', '1', '2022-11-08 08:20:32', '2022-11-08 12:50:32'),
(8, 'PARTY WEAR HIJAB', '1', '2022-11-08 08:20:48', '2022-11-08 12:50:48'),
(9, 'Premium ', '1', '2022-11-18 11:30:14', '2022-11-18 16:00:14'),
(10, 'BATIK PRINT KURTI', '1', '2022-11-18 12:07:46', '2022-11-18 16:37:46'),
(11, 'JILBAB 3 PCS', '1', '2022-11-18 12:08:11', '2022-11-18 16:38:11'),
(12, 'DAILY WEAR HIJAB', '1', '2022-11-18 12:08:40', '2022-11-18 16:38:40'),
(13, 'BATIK PRINT HANDWORK', '1', '2022-11-18 12:08:58', '2022-11-18 16:38:58'),
(14, 'FORWARD LINNING', '1', '2022-11-18 12:09:10', '2022-11-18 16:39:10'),
(15, 'LINNING', '1', '2022-11-18 12:09:23', '2022-11-18 16:39:23'),
(16, 'ZHUMMAR', '1', '2022-11-18 12:09:37', '2022-11-18 16:39:37'),
(17, 'LEAVES PRINT', '1', '2022-11-18 12:09:49', '2022-11-18 16:39:49'),
(18, 'BATIK PRINT', '1', '2022-11-18 12:10:02', '2022-11-18 16:40:02'),
(19, ' NECK HAND WORK', '1', '2022-11-18 12:10:23', '2022-11-18 16:40:23'),
(20, 'DIYA DESIGN', '1', '2023-01-25 09:14:22', '2023-01-25 02:14:22'),
(21, '3D CARAVANSARY', '1', '2023-01-27 05:05:15', '2023-01-26 22:05:15'),
(22, 'VINE DESIGN', '1', '2023-01-27 07:34:49', '2023-01-27 00:34:49'),
(23, 'LUX EXTRA VELVET', '1', '2023-01-31 07:15:32', '2023-01-31 00:15:32'),
(24, 'DENSE VELVET', '1', '2023-02-08 06:05:21', '2023-02-07 23:05:21'),
(25, 'CHENNILE', '1', '2023-02-08 06:05:35', '2023-02-07 23:05:35'),
(26, 'MULTICOLOUR', '1', '2023-02-16 05:38:42', '2023-02-15 22:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `products_tags`
--

CREATE TABLE `products_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `createDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_variations`
--

CREATE TABLE `products_variations` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `variation_type` varchar(50) NOT NULL,
  `variation_value` varchar(10) DEFAULT NULL,
  `attr_attrvalue` text,
  `variation_regular_price` double NOT NULL,
  `variation_sale_price` double NOT NULL,
  `variation_stock` int(10) DEFAULT NULL,
  `variation_sku` varchar(255) NOT NULL,
  `variation_product_code` varchar(255) NOT NULL,
  `variation_fabric` varchar(255) NOT NULL,
  `variation_custom_size` text,
  `variation_description` text NOT NULL,
  `variation_photo` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_variations`
--

INSERT INTO `products_variations` (`id`, `product_id`, `variation_type`, `variation_value`, `attr_attrvalue`, `variation_regular_price`, `variation_sale_price`, `variation_stock`, `variation_sku`, `variation_product_code`, `variation_fabric`, `variation_custom_size`, `variation_description`, `variation_photo`, `createDate`, `updateDate`) VALUES
(3, 2, '2,1', '1,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"1\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2650, 0, 5, 'AL-SET-NVYBL-I2', 'P0060', '19,26,18', 'LENGTH: 43, SHOULDER: 17-18, BUST: 42, WAIST: 40, HIP: 44, SLEEVES: 18-19, OUTSEAM: 30, INSEAM: 28', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(4, 2, '2,1', '1,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"1\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2650, 0, 5, 'AL-SET-NVYBL-I2', 'P0060', '19,26,18', 'LENGTH: 43, SHOULDER: 17-18, BUST: 44, WAIST: 42, HIP: 46, SLEEVES: 18-19, OUTSEAM: 30, INSEAM: 28', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(7, 3, '2,1', '1,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"1\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 749, 0, 5, 'AL-PLZ-CKN-NBLUE-RGL-D1', 'P00160', '3', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-11-08 01:57:01', '2022-11-08 18:27:01'),
(11, 11, '2,1', '8,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 3, 'AL-LUXHJB-BLK-E1', 'P0084', '12', '175 CM * 70 CM', '', '', '2022-11-08 02:18:18', '2022-11-08 18:48:18'),
(13, 13, '2,1', '11,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"11\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 3, 'AL-LGNS-MSTRD-RGL-D4', 'P00129', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2022-11-09 07:10:04', '2022-11-09 11:40:04'),
(15, 14, '2,1', '13,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"13\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 6, 'AL-PLZ-CHK-SGRN-RGL-D2', 'P00145', '16', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-11-10 12:48:45', '2022-11-10 17:18:45'),
(28, 12, '2,1', '10,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"10\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 599, 0, 10, 'AL-SMRPNTS-GLD-RGL-C1', 'P00141', '', 'OUTSEAM - 35, INSEAM - 25', '', '', '2022-11-10 01:09:58', '2022-11-10 17:39:58'),
(43, 19, '2,1', '6,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2999, 0, 5, 'AL-ABY-JGR-WINE-RGL-B3', 'P0016', '', '', '', '', '2022-11-18 12:13:51', '2022-11-18 16:43:51'),
(62, 20, '2,1', '8,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 849, 0, 5, 'AL-PNTS-BLK-3SZ-D3', 'P00133', '', 'OUTSEAM - 37, INSEAM - 26', '1', '', '2022-11-18 01:05:14', '2022-11-18 17:35:14'),
(66, 21, '2,1', '39,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"39\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-DPNK-G3', 'P0099', '29', '175 CM * 70 CM', '', '', '2022-11-18 01:14:31', '2022-11-18 17:44:31'),
(74, 8, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2050, 0, 5, 'AL-ABY-BLK-RGL-B4', 'P0007', '', 'LENGTH - 56, BUST - 48, SLEEVES -  21', '', '', '2022-11-10 01:09:58', '2022-11-10 17:39:58'),
(76, 23, '2,1', '7,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"7\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1450, 0, 5, 'AL-ABY-JGR-BLUE-RGL-A3', 'P0011', '', 'LENTH - 56, BUST - 46, SLEEVES - 22', '', '', '2022-11-18 01:26:01', '2022-11-18 17:56:01'),
(83, 27, '2,1', '8,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-BLK-G1', 'P00116', '31', '175 CM * 85 CM', '', '', '2022-11-18 01:50:43', '2022-11-18 18:20:43'),
(90, 5, '2,1', '7,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"7\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2250, 0, 5, 'AL-BT-ABY-BLUE-RGL-B2', 'P0029', '', 'LENGTH - 56', '', '', '2022-11-10 01:09:58', '2022-11-10 17:39:58'),
(92, 28, '2,1', '48,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"48\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 650, 0, 4, 'AL-FLXPNT1-OFWHT-RGL-C2', 'P00134', '', 'OUTSEAM - 37, INSEAM - 24', '', '', '2022-11-18 02:15:37', '2022-11-18 18:45:37'),
(98, 20, '2,1', '8,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 849, 0, 5, 'AL-PNTS-BLK-3SZ-D3-8', 'P00133', '', 'OUTSEAM - 37, INSEAM - 26', '2', '', '2022-12-02 08:45:28', '2022-12-02 13:15:28'),
(99, 20, '2,1', '8,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 849, 0, 5, 'AL-PNTS-BLK-3SZ-D3', 'P00133', '', 'OUTSEAM - 37, INSEAM - 26', '3', '', '2022-12-02 08:45:28', '2022-12-02 13:15:28'),
(100, 29, '2,1', '6,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1799, 0, 5, 'AL-KURTI-WNE-J3', 'P0043', '', 'LENGTH -  46, SHOULDER - 14,  BUST -  36,  WAIST - 34, HIP - 38, SLEEVES - 17', '', '', '2022-12-05 08:05:57', '2022-12-05 12:35:57'),
(101, 29, '2,1', '6,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1799, 0, 5, 'AL-KURTI-WNE-J3', 'P0043', '', 'LENGTH -  46, SHOULDER - 14,  BUST -  38,  WAIST - 36, HIP - 40, SLEEVES - 17', '', '', '2022-12-05 08:05:57', '2022-12-05 12:35:57'),
(102, 29, '2,1', '6,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1799, 0, 5, 'AL-KURTI-WNE-J3', 'P0043', '', 'LENGTH -  46, SHOULDER - 16,  BUST -  40,  WAIST - 38, HIP - 42, SLEEVES - 17', '', '', '2022-12-05 08:05:57', '2022-12-05 12:35:57'),
(103, 29, '2,1', '6,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1799, 0, 5, 'AL-KURTI-WNE-J3', 'P0043', '', 'LENGTH -  46, SHOULDER - 16,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 17', '', '', '2022-12-05 08:05:57', '2022-12-05 12:35:57'),
(104, 30, '2,1', '3,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"3\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2670, 0, 5, 'AL-SET-BGRN-H3', 'P0055', '', 'LENGTH -  40, SHOULDER - 15,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 20, OUTSEAM - 41, INSEAM - 28', '', '', '2022-12-05 08:34:43', '2022-12-05 13:04:43'),
(107, 32, '2,1', '40,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"40\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1950, 0, 5, 'AL-ABY-BL/MRN-RGL-A4', 'P0002', '', 'LENGTH - 54', '', '', '2022-12-05 10:10:28', '2022-12-05 14:40:29'),
(108, 33, '2,1', '37,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"37\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2999, 0, 5, 'AL-ABY-JGR-PCH-RGL-A3', 'P0015', '', 'LENGTH - 56, BUST - 42, SLEEVES - 22', '', '', '2022-12-05 11:24:54', '2022-12-05 15:54:54'),
(109, 34, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1450, 0, 5, 'AL-ABY-JGR-BLACK-RGL-A3', 'P0012', '', 'LENGTH - 56, BUST - 46, SLEEVES - 22', '', '', '2022-12-05 11:35:58', '2022-12-05 16:05:58'),
(110, 35, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2299, 0, 5, 'AL-ABY-BLK-RGL-A4', 'P0005', '', '', '', '', '2022-12-05 11:52:30', '2022-12-05 16:22:30'),
(111, 35, '2,1', '8,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2299, 0, 4, 'AL-ABY-BLK-RGL-A4', 'P0005', '', '', '', '', '2022-12-05 11:52:30', '2022-12-05 16:22:30'),
(112, 37, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2350, 0, 5, 'AL-ABY-BLK-RGL-A4', 'P0003', '', '', '', '', '2022-12-05 12:02:11', '2022-12-05 16:32:11'),
(113, 37, '2,1', '8,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2350, 0, 5, 'AL-ABY-BLK-RGL-A4', 'P0003', '', '', '', '', '2022-12-05 12:02:11', '2022-12-05 16:32:11'),
(114, 38, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 749, 0, 6, 'AL-PLZ-CKN-BLK-RGL-D1', 'P00157', '', '', '', '', '2022-12-05 12:12:47', '2022-12-05 16:42:47'),
(115, 39, '2,1', '43,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"43\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-DPRPL-G3', 'P00103', '', '175 CM * 70 CM', '', '', '2022-12-05 12:42:06', '2022-12-05 17:12:06'),
(116, 40, '2,1', '31,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"31\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-RBLUE-G3', 'P00101', '', '175 CM * 70 CM', '', '', '2022-12-05 12:58:07', '2022-12-05 17:28:07'),
(117, 41, '2,1', '44,56', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"44\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"56\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-BRN-G3', 'P00102', '', '176 CM * 70 CM', '', '', '2022-12-05 01:19:53', '2022-12-05 17:49:53'),
(118, 42, '2,1', '6,57', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"57\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-WNE-G3', 'P0096', '', '177 CM * 70 CM', '', '', '2022-12-05 01:23:08', '2022-12-05 17:53:08'),
(119, 43, '2,1', '7,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"7\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-BLUE-G2', 'P00113', '', '175 CM * 85 CM', '', '', '2022-12-05 01:35:51', '2022-12-05 18:05:51'),
(120, 44, '2,1', '17,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"17\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-GREY-G3', 'P0098', '29', '175 CM * 70 CM', '', '', '2022-12-05 01:40:28', '2022-12-05 18:10:28'),
(122, 46, '2,1', '17,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"17\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-GREY-G1', 'P00117', '31', '175 CM * 85 CM', '', '', '2022-12-05 01:55:46', '2022-12-05 18:25:46'),
(123, 47, '2,1', '3,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"3\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-BGRN-G2', 'P00112', '', '175 CM * 85 CM', '', '', '2022-12-06 05:48:07', '2022-12-06 10:18:07'),
(124, 48, '2,1', '6,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-WNE-G1', 'P00115', '', '175 CM * 85 CM', '', '', '2022-12-06 06:21:40', '2022-12-06 10:51:40'),
(125, 49, '2,1', '45,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"45\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2627, 0, 5, 'AL-SET-BBLUE-H3', 'P0057', '', 'LENGTH - 40, SHOULDER - 15,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 20, OUTSEAM - 41, INSEAM - 28', '', '', '2022-12-06 06:27:06', '2022-12-06 10:57:06'),
(126, 50, '2,1', '46,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"46\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2627, 0, 5, 'AL-SET-BRGNDY-H3', 'P0056', '', 'LENGTH - 40, SHOULDER - 15,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 20, OUTSEAM - 41, INSEAM - 28', '', '', '2022-12-06 06:32:30', '2022-12-06 11:02:30'),
(127, 51, '2,1', '47,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"47\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 2650, 0, 20, 'AL-SET-PRPL-I4', 'P0044', '', 'LENGTH - 46, SHOULDER - 14,  BUST -  38,  WAIST - 36, HIP - 40, SLEEVES  16-17, OUTSEAM - 37, INSEAM - 24-35', '', '', '2022-12-06 06:44:15', '2022-12-06 11:14:15'),
(128, 51, '2,1', '47,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"47\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 2650, 0, 20, 'AL-SET-PRPL-I4', 'P0044', '', 'LENGTH - 46, SHOULDER - 14,  BUST -  40,  WAIST - 38, HIP - 42, SLEEVES  16-17, OUTSEAM - 37, INSEAM - 24-35', '', '', '2022-12-06 06:44:15', '2022-12-06 11:14:15'),
(129, 51, '2,1', '47,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"47\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2650, 0, 20, 'AL-SET-PRPL-I4', 'P0044', '', 'LENGTH - 46, SHOULDER - 16,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES  16-17, OUTSEAM - 37, INSEAM - 24-35', '', '', '2022-12-06 06:44:15', '2022-12-06 11:14:15'),
(130, 51, '2,1', '47,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"47\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2650, 0, 20, 'AL-SET-PRPL-I4', 'P0044', '', 'LENGTH - 46, SHOULDER - 17,  BUST -  44,  WAIST - 42, HIP - 46, SLEEVES  16-17, OUTSEAM - 37, INSEAM - 24-35', '', '', '2022-12-06 06:44:15', '2022-12-06 11:14:15'),
(131, 52, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2627, 0, 5, 'AL-SET-BLK-I3', 'P0054', '', 'LENGTH - 40, SHOULDER - 15,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 20, OUTSEAM - 41, INSEAM - 28', '', '', '2022-12-06 06:50:29', '2022-12-06 11:20:29'),
(132, 53, '2,1', '8,26', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"26\"}]', 1199, 0, 5, 'AL-KURTI-BLK-J3', 'P0042', '', 'LENGTH - 45, SHOULDER - 13,  BUST -  36,  WAIST - 32, HIP - 38, SLEEVES - 15', '', '', '2022-12-06 06:58:03', '2022-12-06 11:28:03'),
(133, 53, '2,1', '8,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1199, 0, 5, 'AL-KURTI-BLK-J3', 'P0042', '', 'LENGTH - 45, SHOULDER - 14,  BUST -  38,  WAIST - 34, HIP - 40, SLEEVES - 15', '', '', '2022-12-06 06:58:03', '2022-12-06 11:28:03'),
(134, 53, '2,1', '8,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1199, 0, 5, 'AL-KURTI-BLK-J3', 'P0042', '', 'LENGTH - 45, SHOULDER - 15,  BUST -  40,  WAIST - 36, HIP - 42, SLEEVES - 15', '', '', '2022-12-06 06:58:03', '2022-12-06 11:28:03'),
(135, 53, '2,1', '8,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1199, 0, 5, 'AL-KURTI-BLK-J3', 'P0042', '', 'LENGTH - 45, SHOULDER - 16,  BUST -  42,  WAIST - 38, HIP - 44, SLEEVES - 15', '', '', '2022-12-06 06:58:03', '2022-12-06 11:28:03'),
(136, 53, '2,1', '8,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1199, 0, 25, 'AL-KURTI-BLK-J3', 'P0042', '', 'LENGTH - 45, SHOULDER - 16,  BUST -  44,  WAIST - 40, HIP - 46, SLEEVES - 15', '', '', '2022-12-06 06:58:03', '2022-12-06 11:28:03'),
(137, 54, '2,1', '20,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 849, 0, 15, 'AL-PNTS-WHT-3SZ-D3', 'P00132', '', 'OUTSEAM - 37, INSEAM - 26', '', '', '2022-12-06 07:12:08', '2022-12-06 11:42:08'),
(138, 54, '2,1', '20,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 849, 0, 15, 'AL-PNTS-WHT-3SZ-D3', 'P00132', '', 'OUTSEAM - 37, INSEAM - 26', '', '', '2022-12-06 07:12:08', '2022-12-06 11:42:08'),
(139, 54, '2,1', '20,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 849, 0, 15, 'AL-PNTS-WHT-3SZ-D3', 'P00132', '', 'OUTSEAM - 37, INSEAM - 26', '', '', '2022-12-06 07:12:08', '2022-12-06 11:42:08'),
(140, 55, '2,1', '48,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"48\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 650, 0, 4, 'AL-FLXPNT2-OFWHT-RGL-C2', 'P00135', '', 'OUTSEAM - 37, INSEAM - 24', '', '', '2022-12-06 07:19:22', '2022-12-06 11:49:22'),
(141, 56, '2,1', '48,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"48\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 650, 0, 4, 'AL-FLXPNT3-OFWHT-RGL-C2', 'P00136', '', 'OUTSEAM - 37, INSEAM - 24', '', '', '2022-12-06 07:26:51', '2022-12-06 11:56:51'),
(142, 57, '2,1', '48,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"48\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 650, 0, 4, 'AL-FLXPNT4-OFWHT-RGL-C2', 'P00137', '', 'OUTSEAM - 37, INSEAM - 24', '', '', '2022-12-06 07:35:17', '2022-12-06 12:05:18'),
(143, 58, '2,1', '48,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"48\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 650, 0, 4, 'AL-FLXPNT5-OFWHT-RGL-C2', 'P00138', '', 'OUTSEAM - 37, INSEAM - 24', '', '', '2022-12-06 07:48:02', '2022-12-06 12:18:02'),
(144, 59, '2,1', '48,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"48\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 650, 0, 4, 'AL-FLXPNT6-OFWHT-RGL-C2', 'P00139', '', 'OUTSEAM - 37, INSEAM - 24', '', '', '2022-12-06 07:51:53', '2022-12-06 12:21:53'),
(145, 60, '2,1', '49,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"49\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 849, 0, 5, 'AL-PNTS-LGLD-3SZ-C3', 'P00131', '', 'OUTSEAM - 37, INSEAM - 26', '', '', '2022-12-06 07:57:50', '2022-12-06 12:27:50'),
(146, 61, '2,1', '6,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 999, 0, 5, 'AL-KURTI-WNE-J4', 'P0037', '', 'LENGTH -  44, SHOULDER - 14,  BUST -  38,  WAIST - 34, HIP - 38, SLEEVES - 16', '', '', '2022-12-06 08:07:43', '2022-12-06 12:37:43'),
(147, 61, '2,1', '6,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 999, 0, 5, 'AL-KURTI-WNE-J4', 'P0037', '', 'LENGTH -  44, SHOULDER - 14,  BUST -  40,  WAIST - 36, HIP - 40, SLEEVES - 16', '', '', '2022-12-06 08:07:43', '2022-12-06 12:37:43'),
(148, 61, '2,1', '6,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 999, 0, 5, 'AL-KURTI-WNE-J4', 'P0037', '', 'LENGTH -  44, SHOULDER - 15,  BUST -  42,  WAIST - 38, HIP - 42, SLEEVES - 16', '', '', '2022-12-06 08:07:43', '2022-12-06 12:37:43'),
(149, 61, '2,1', '6,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 999, 0, 5, 'AL-KURTI-WNE-J4', 'P0037', '', 'LENGTH -  44, SHOULDER - 15,  BUST -  44,  WAIST - 40, HIP - 44, SLEEVES - 16', '', '', '2022-12-06 08:07:43', '2022-12-06 12:37:43'),
(150, 62, '2,1', '23,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"23\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1025, 0, 5, 'AL-KURTI-CRM-J4', 'P0038', '', 'LENGTH -  45, SHOULDER - 14,  BUST -  38,  WAIST - 34, HIP - 38, SLEEVES - 16', '', '', '2022-12-06 08:13:58', '2022-12-06 12:43:58'),
(151, 62, '2,1', '23,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"23\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1025, 0, 4, 'AL-KURTI-CRM-J4', 'P0038', '', 'LENGTH -  45, SHOULDER - 14,  BUST -  40,  WAIST - 36, HIP - 40, SLEEVES - 16', '', '', '2022-12-06 08:13:58', '2022-12-06 12:43:58'),
(152, 62, '2,1', '23,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"23\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1025, 0, 5, 'AL-KURTI-CRM-J4', 'P0038', '', 'LENGTH -  45, SHOULDER - 15,  BUST -  42,  WAIST - 38, HIP - 42, SLEEVES - 16', '', '', '2022-12-06 08:13:58', '2022-12-06 12:43:58'),
(153, 62, '2,1', '23,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"23\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1025, 0, 5, 'AL-KURTI-CRM-J4', 'P0038', '', 'LENGTH -  45, SHOULDER - 15,  BUST -  44,  WAIST - 40, HIP - 44, SLEEVES - 16', '', '', '2022-12-06 08:13:58', '2022-12-06 12:43:58'),
(154, 63, '2,1', '20,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1250, 0, 5, 'AL-KURTI-WHT-J3', 'P0039', '', 'LENGTH -  44, SHOULDER - 13,  BUST -  44,  WAIST - 40, HIP - 44, SLEEVES - 17', '', '', '2022-12-06 08:18:51', '2022-12-06 12:48:51'),
(155, 63, '2,1', '20,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1250, 0, 5, 'AL-KURTI-WHT-J3', 'P0039', '', 'LENGTH -  44, SHOULDER - 14,  BUST -  44,  WAIST - 40, HIP - 44, SLEEVES - 17', '', '', '2022-12-06 08:18:51', '2022-12-06 12:48:51'),
(156, 63, '2,1', '20,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1250, 0, 5, 'AL-KURTI-WHT-J3', 'P0039', '', 'LENGTH -  44, SHOULDER - 15,  BUST -  44,  WAIST - 40, HIP - 44, SLEEVES - 17', '', '', '2022-12-06 08:18:51', '2022-12-06 12:48:51'),
(157, 63, '2,1', '20,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1250, 0, 5, 'AL-KURTI-WHT-J3', 'P0039', '', 'LENGTH -  44, SHOULDER - 16,  BUST -  44,  WAIST - 40, HIP - 44, SLEEVES - 17', '', '', '2022-12-06 08:18:51', '2022-12-06 12:48:51'),
(158, 64, '2,1', '50,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1099, 0, 5, 'AL-KURTI-LTGRN-J4', 'P0035', '', 'LENGTH -  46, SHOULDER - 14,  BUST -  38,  WAIST - 34, HIP - 38, SLEEVES - 15', '', '', '2022-12-06 08:24:38', '2022-12-06 12:54:38'),
(159, 64, '2,1', '50,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1099, 0, 5, 'AL-KURTI-LTGRN-J4', 'P0035', '', 'LENGTH -  46, SHOULDER - 14,  BUST -  40,  WAIST - 36, HIP - 40, SLEEVES - 15', '', '', '2022-12-06 08:24:38', '2022-12-06 12:54:38'),
(160, 64, '2,1', '50,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1099, 0, 4, 'AL-KURTI-LTGRN-J4', 'P0035', '', 'LENGTH -  46, SHOULDER - 15,  BUST -  42,  WAIST - 38, HIP - 42, SLEEVES - 15', '', '', '2022-12-06 08:24:38', '2022-12-06 12:54:38'),
(161, 64, '2,1', '50,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1099, 0, 5, 'AL-KURTI-LTGRN-J4', 'P0035', '', 'LENGTH -  46, SHOULDER - 16,  BUST -  44,  WAIST - 40, HIP - 44, SLEEVES - 15', '', '', '2022-12-06 08:24:38', '2022-12-06 12:54:38'),
(162, 65, '2,1', '14,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1050, 0, 5, 'AL-KURTI-PNK-J4', 'P0036', '', 'LENGTH -  42, SHOULDER - 12,  BUST -  36,  WAIST - 34, HIP - 36, SLEEVES - 15', '', '', '2022-12-06 08:29:35', '2022-12-06 12:59:35'),
(163, 65, '2,1', '14,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1050, 0, 5, 'AL-KURTI-PNK-J4', 'P0036', '', 'LENGTH -  42, SHOULDER - 13,  BUST -  38,  WAIST - 36, HIP - 38, SLEEVES - 15', '', '', '2022-12-06 08:29:35', '2022-12-06 12:59:35'),
(164, 65, '2,1', '14,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1050, 0, 5, 'AL-KURTI-PNK-J4', 'P0036', '', 'LENGTH -  42, SHOULDER - 13,  BUST -  40,  WAIST - 38, HIP - 40, SLEEVES - 15', '', '', '2022-12-06 08:29:35', '2022-12-06 12:59:35'),
(165, 65, '2,1', '14,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1050, 0, 5, 'AL-KURTI-PNK-J4', 'P0036', '', 'LENGTH -  42, SHOULDER - 14,  BUST -  42,  WAIST - 40, HIP - 42, SLEEVES - 15', '', '', '2022-12-06 08:29:35', '2022-12-06 12:59:35'),
(166, 66, '2,1', '51,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"51\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2650, 0, 5, 'AL-SET-CML-I2', 'P0059', '', 'LENGTH -  43, SHOULDER - 17-18,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-06 09:55:33', '2022-12-06 14:25:33'),
(167, 66, '2,1', '51,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"51\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2650, 0, 5, 'AL-SET-CML-I2', 'P0059', '', 'LENGTH -  43, SHOULDER - 17-18,  BUST -  44,  WAIST - 42, HIP - 46, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-06 09:55:33', '2022-12-06 14:25:33'),
(168, 67, '2,1', '5,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 2199, 0, 5, 'AL-SET-MHRN-I4H4', 'P0046', '', 'LENGTH -  46, SHOULDER - 14,  BUST -  38,  WAIST - 36, HIP - 38, SLEEVES - 17-18, OUTSEAM - 41, INSEAM - 28-29', '', '', '2022-12-06 10:02:35', '2022-12-06 14:32:35'),
(169, 67, '2,1', '5,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 2199, 0, 5, 'AL-SET-MHRN-I4H4', 'P0046', '', 'LENGTH -  46, SHOULDER - 14,  BUST -  40,  WAIST - 38, HIP - 40, SLEEVES - 17-18, OUTSEAM - 41, INSEAM - 28-29', '', '', '2022-12-06 10:02:35', '2022-12-06 14:32:35'),
(170, 67, '2,1', '5,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2199, 0, 5, 'AL-SET-MHRN-I4H4', 'P0046', '', 'LENGTH -  46, SHOULDER - 15,  BUST -  42,  WAIST - 40, HIP - 42, SLEEVES - 17-18, OUTSEAM - 41, INSEAM - 28-29', '', '', '2022-12-06 10:02:35', '2022-12-06 14:32:35'),
(171, 67, '2,1', '5,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2199, 0, 5, 'AL-SET-MHRN-I4H4', 'P0046', '', 'LENGTH -  46, SHOULDER - 15,  BUST -  44,  WAIST - 42, HIP - 44, SLEEVES - 17-18, OUTSEAM - 41, INSEAM - 28-29', '', '', '2022-12-06 10:02:35', '2022-12-06 14:32:35'),
(172, 68, '2,1', '60,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"60\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2750, 0, 5, 'AL-SET-ABLUE-I1', 'P0065', '', 'LENTH -  44, SHOULDER - 17-18,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-06 10:12:18', '2022-12-06 14:42:18'),
(173, 68, '2,1', '4,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"4\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2750, 0, 5, 'AL-SET-ABLUE-I1', 'P0065', '', 'LENGTH -  44, SHOULDER - 17-18,  BUST -  44,  WAIST - 42, HIP - 46, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-06 10:12:18', '2022-12-06 14:42:18'),
(174, 69, '2,1', '52,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"52\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 2299, 0, 5, 'AL-SET-GRNYLW-I4', 'P0045', '', 'LENGTH -  49, SHOULDER - 14,  BUST -  38,  WAIST - 34, HIP - 40, SLEEVES  18-19, OUTSEAM - 38, INSEAM - 27-28', '', '', '2022-12-06 10:26:17', '2022-12-06 14:56:17'),
(175, 69, '2,1', '52,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"52\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 2299, 0, 5, 'AL-SET-GRNYLW-I4', 'P0045', '', 'LENGTH -  49, SHOULDER - 15,  BUST -  40,  WAIST - 36, HIP - 42, SLEEVES  18-19, OUTSEAM - 38, INSEAM - 27-28', '', '', '2022-12-06 10:26:17', '2022-12-06 14:56:17'),
(176, 69, '2,1', '52,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"52\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2299, 0, 5, 'AL-SET-GRNYLW-I4', 'P0045', '', 'LENGTH -  49, SHOULDER - 15,  BUST -  42,  WAIST - 38, HIP - 44, SLEEVES  18-19, OUTSEAM - 38, INSEAM - 27-28', '', '', '2022-12-06 10:26:17', '2022-12-06 14:56:17'),
(177, 69, '2,1', '52,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"52\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2299, 0, 5, 'AL-SET-GRNYLW-I4', 'P0045', '', 'LENGTH -  49, SHOULDER - 16,  BUST -  44,  WAIST - 40, HIP - 46, SLEEVES  18-19, OUTSEAM - 38, INSEAM - 27-28', '', '', '2022-12-06 10:26:17', '2022-12-06 14:56:17'),
(178, 70, '2,1', '14,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2699, 0, 5, 'AL-SET-PNK-H2', 'P0063', '', 'LENGTH -  43, SHOULDER - 17-18,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES  18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-06 10:54:44', '2022-12-06 15:24:44'),
(179, 70, '2,1', '14,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2699, 0, 5, 'AL-SET-PNK-H2', 'P0063', '', 'LENGTH -  43, SHOULDER - 17-18,  BUST -  44,  WAIST - 42, HIP - 46, SLEEVES  18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-06 10:54:44', '2022-12-06 15:24:44'),
(180, 71, '2,1', '15,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"15\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2699, 0, 5, 'AL-SET-YLW-H2', 'P0062', '', 'LENGTH -  43, SHOULDER - 17-18,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-06 11:00:54', '2022-12-06 15:30:54'),
(181, 71, '2,1', '15,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"15\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2699, 0, 5, 'AL-SET-YLW-H2', 'P0062', '', 'LENGTH -  43, SHOULDER - 17-18,  BUST -  44,  WAIST - 42, HIP - 46, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-06 11:00:54', '2022-12-06 15:30:54'),
(182, 72, '2,1', '20,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2250, 0, 5, 'AL-BT-ABY-WHT-RGL-B2', 'P0028', '', 'LENGTH - 56', '', '', '2022-12-06 11:06:59', '2022-12-06 15:36:59'),
(183, 73, '2,1', '54,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"54\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2050, 0, 5, 'AL-ABY-BSCT-RGL-A2', 'P0023', '', 'LENGTH - 56, BUST - 48, SLEEVES - 23', '', '', '2022-12-06 11:13:14', '2022-12-06 15:43:14'),
(184, 74, '2,1', '18,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"18\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 500, 0, 5, 'AL-LUXHJB-DGLDN-G3', 'P0093', '', '45', '', '', '2022-12-06 11:22:41', '2022-12-06 15:52:42'),
(185, 75, '2,1', '37,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"37\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-PCH-G3', 'P0100', '', '175 CM * 85 CM', '', '', '2022-12-06 11:27:14', '2022-12-06 15:57:14'),
(186, 76, '2,1', '18,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"18\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 849, 0, 5, 'AL-PNTS-DGLD-3SZ-C3', 'P00130', '', 'OUTSEAM - 37, INSEAM - 26', '', '', '2022-12-06 11:32:16', '2022-12-06 16:02:16'),
(187, 76, '2,1', '18,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"18\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 849, 0, 5, 'AL-PNTS-DGLD-3SZ-C3', 'P00130', '', 'OUTSEAM - 37, INSEAM - 26', '', '', '2022-12-06 11:32:16', '2022-12-06 16:02:16'),
(188, 76, '2,1', '18,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"18\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 849, 0, 5, 'AL-PNTS-DGLD-3SZ-C3', 'P00130', '', 'OUTSEAM - 37, INSEAM - 26', '', '', '2022-12-06 11:32:16', '2022-12-06 16:02:16'),
(189, 77, '2,1', '38,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"38\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1099, 0, 5, 'AL-KURTI-DGRN-J4', 'P0034', '', 'LENGTH - 47, SHOULDER - 14, BUST - 38, WAIST -  34, HIP - 38, SLEEVES - ALL SIZE 15', '', '', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(190, 77, '2,1', '38,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"38\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1099, 0, 5, 'AL-KURTI-DGRN-J4', 'P0034', '', 'LENGTH - 47, SHOULDER - 14, BUST - 40, WAIST -  36, HIP - 40, SLEEVES - ALL SIZE 15', '', '', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(191, 77, '2,1', '38,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"38\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1099, 0, 5, 'AL-KURTI-DGRN-J4', 'P0034', '', 'LENGTH - 47, SHOULDER - 15, BUST - 42, WAIST -  38, HIP - 42, SLEEVES - ALL SIZE 15', '', '', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(192, 77, '2,1', '38,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"38\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1099, 0, 5, 'AL-KURTI-DGRN-J4', 'P0034', '', 'LENGTH - 47, SHOULDER - 15, BUST - 44, WAIST - 42, HIP - 44, SLEEVES - ALL SIZE 15', '', '', '2022-12-06 01:09:09', '2022-12-06 17:39:09'),
(193, 78, '2,1', '3,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"3\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2600, 0, 5, 'AL-SET-BGRN-I2H2', 'P0061', '', 'LENGTH -  43, SHOULDER - 17-18,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 17-18, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-07 01:19:31', '2022-12-07 17:49:31'),
(194, 78, '2,1', '3,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"3\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2600, 0, 5, 'AL-SET-BGRN-I2H2', 'P0061', '', 'LENGTH -  43, SHOULDER - 17-18,  BUST -  44,  WAIST - 42, HIP - 46, SLEEVES - 17-18, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-07 01:19:31', '2022-12-07 17:49:31'),
(195, 79, '2,1', '2,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"2\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2149, 0, 4, 'AL-SET-DGREY-I3', 'P0052', '', 'LENGTH: 41-42 SHOULDER: 15 BUST: 44 WAIST: 40 HIP: 46-47 SLEEVES: 21 OUTSEAM: 39 INSEAM: 26-27', '', '', '2022-12-07 01:31:34', '2022-12-07 18:01:34'),
(196, 80, '2,1', '14,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2149, 0, 4, 'AL-SET-PNK-I3', 'P0053', '', 'LENGTH -  41-42, SHOULDER - 16,  BUST -  44,  WAIST - 40, HIP - 46-47, SLEEVES - 21, OUTSEAM - 39, INSEAM - 26-27', '', '', '2022-12-07 01:41:53', '2022-12-07 18:11:53'),
(197, 81, '2,1', '24,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"24\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2149, 0, 4, 'AL-SET-LGREY-H4', 'P0048', '', 'LENGTH -  41-42, SHOULDER - 16,  BUST -  44,  WAIST - 40, HIP - 46-47, SLEEVES - 21, OUTSEAM - 39, INSEAM - 26-27', '', '', '2022-12-07 01:45:50', '2022-12-07 18:15:50'),
(198, 82, '2,1', '5,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 749, 0, 5, 'AL-PLZ-CKN-MHRN-RGL-D1', 'P00162', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-07 01:52:26', '2022-12-07 18:22:26'),
(199, 83, '2,1', '22,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"22\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 749, 0, 5, 'AL-PLZ-CKN-RED-RGL-D1', 'P00161', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-07 01:58:34', '2022-12-07 18:28:34'),
(200, 84, '2,1', '23,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"23\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 749, 0, 6, 'AL-PLZ-CKN-CRM-RGL-D1', 'P00159', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-07 02:02:47', '2022-12-07 18:32:47'),
(201, 85, '2,1', '21,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"21\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 749, 0, 5, 'AL-PLZ-CKN-SKIN-RGL-D1', 'P00164', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-07 02:06:25', '2022-12-07 18:36:25'),
(202, 86, '2,1', '11,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"11\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 749, 0, 2, 'AL-PLZ-CKN-MSTRD-RGL-D1', 'P00163', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-07 02:10:13', '2022-12-07 18:40:13'),
(203, 87, '2,1', '14,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 6, 'AL-PLZ-CHK-PNK-RGL-D2', 'P00146', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-07 02:14:45', '2022-12-07 18:44:45'),
(204, 88, '2,1', '15,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"15\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 5, 'AL-PLZ-CHK-YLW-RGL-D2', 'P00147', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-07 02:19:04', '2022-12-07 18:49:04'),
(205, 89, '2,1', '16,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"16\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 5, 'AL-PLZ-CHK-BEG-RGL-D2', 'P00149', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-08 05:40:45', '2022-12-08 10:10:45'),
(206, 90, '2,1', '17,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"17\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 5, 'AL-PLZ-CHK-GREY-RGL-D2', 'P00150', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2022-12-08 05:44:11', '2022-12-08 10:14:11'),
(207, 91, '2,1', '12,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"12\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 599, 0, 11, 'AL-SMRPNTS-FWN-RGL-C1', 'P00142', '', 'OUTSEAM - 35, INSEAM - 25', '', '', '2022-12-08 05:54:17', '2022-12-08 10:24:17'),
(208, 92, '2,1', '18,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"18\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 599, 0, 8, 'AL-SMRPNTS-DGLD-RGL-C1', 'P00144', '', 'OUTSEAM - 35, INSEAM - 25', '', '', '2022-12-08 06:14:26', '2022-12-08 10:44:26'),
(209, 93, '2,1', '20,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 599, 0, 9, 'AL-SMRPNTS-WHT-RGL-C1', 'P00140', '', 'OUTSEAM - 35, INSEAM - 25', '', '', '2022-12-08 06:18:10', '2022-12-08 10:48:10'),
(210, 94, '2,1', '10,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"10\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-GLD-RGL-D4', 'P00128', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2022-12-08 06:28:20', '2022-12-08 10:58:20'),
(211, 95, '2,1', '19,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"19\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-MGNTPNK-RGL-D4', 'P00127', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2022-12-08 06:31:32', '2022-12-08 11:01:32'),
(212, 96, '2,1', '14,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-PNK-RGL-C4', 'P00118', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2022-12-08 06:35:02', '2022-12-08 11:05:02'),
(213, 97, '2,1', '1,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"1\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2050, 0, 5, 'AL-ABY-NBLU-RGL-A2', 'P0024', '', 'LENGTH - 56, BUST - 48, SLEEVES - 23', '', '', '2022-12-08 06:43:51', '2022-12-08 11:13:51'),
(214, 98, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2100, 0, 5, 'AL-ABY-BLK-RGL-B4', 'P0008', '', 'LENGTH - 56, BUST - 46, SLEEVES - 21', '', '', '2022-12-08 06:49:19', '2022-12-08 11:19:19'),
(215, 99, '2,1', '9,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"9\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1950, 0, 5, 'AL-ABY-BL/GR-RGL-A4', 'P0001', '', 'LENGTH - 54', '', '', '2022-12-08 06:52:49', '2022-12-08 11:22:49'),
(216, 100, '2,1', '6,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-WINE-E3', 'P0073', '', '180 CM * 70 CM', '', '', '2022-12-08 07:15:17', '2022-12-08 11:45:17'),
(217, 101, '2,1', '6,26', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"26\"}]', 1150, 0, 5, 'AL-KURTI-WNE-J3', 'P0040', '', 'LENTH -  45, SHOULDER - 12,  BUST -  36,  WAIST - 32, HIP - 38, SLEEVES - DETACHABLE SLEEVES ', '', '', '2022-12-08 07:34:39', '2022-12-08 12:04:39'),
(218, 101, '2,1', '6,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1150, 0, 5, 'AL-KURTI-WNE-J3', 'P0040', '', 'LENTH -  45, SHOULDER - 13,  BUST -  38,  WAIST - 34, HIP - 40, SLEEVES - DETACHABLE SLEEVES', '', '', '2022-12-08 07:34:39', '2022-12-08 12:04:39'),
(219, 101, '2,1', '6,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1150, 0, 5, 'AL-KURTI-WNE-J3', 'P0040', '', 'LENTH -  45, SHOULDER - 14,  BUST -  38,  WAIST - 34, HIP - 40, SLEEVES - DETACHABLE SLEEVES ', '', '', '2022-12-08 07:34:39', '2022-12-08 12:04:39'),
(220, 101, '2,1', '6,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1150, 0, 5, 'AL-KURTI-WNE-J3', 'P0040', '', 'LENTH -  45, SHOULDER - 15,  BUST -  40,  WAIST - 36, HIP - 42, SLEEVES - DETACHABLE SLEEVES ', '', '', '2022-12-08 07:34:39', '2022-12-08 12:04:39'),
(221, 101, '2,1', '6,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"6\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1150, 0, 5, 'AL-KURTI-WNE-J3', 'P0040', '', 'LENTH -  45, SHOULDER - 16,  BUST -  42,  WAIST - 38, HIP - 44, SLEEVES - DETACHABLE SLEEVES ', '', '', '2022-12-08 07:34:39', '2022-12-08 12:04:39'),
(222, 102, '2,1', '31,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"31\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2699, 0, 22, 'AL-PRUG-VLVT-RYBLE-F3', 'P00170', '', '70*110 CM', '', '', '2022-12-08 11:44:18', '2022-12-08 16:14:18'),
(223, 103, '2,1', '31,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"31\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2599, 0, 15, 'AL-PRUG-VLVT-RYBLE-H1', 'P00180', '', '70*110 CM', '', '', '2022-12-08 11:50:33', '2022-12-08 16:20:33'),
(224, 104, '2,1', '31,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"31\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2650, 0, 20, 'AL-PRUG-VLVT-RYBLE-B1', 'P00173', '', '70*110 CM', '', '', '2022-12-08 11:54:28', '2022-12-08 16:24:29'),
(225, 105, '2,1', '32,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"32\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2699, 0, 14, 'AL-PRUG-VLVT-RYGRY-F4', 'P00168', '', '70*110 CM', '', '', '2022-12-08 11:59:15', '2022-12-08 16:29:15'),
(226, 106, '2,1', '32,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"32\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2599, 0, 15, 'AL-PRUG-VLVT-RYGRY-H1', 'P00179', '', '70*110 CM', '', '', '2022-12-08 12:04:39', '2022-12-08 16:34:39'),
(227, 107, '2,1', '32,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"32\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2650, 0, 15, 'AL-PRUG-VLVT-RYGRY-B1', 'P00171', '', '70*110 CM', '', '', '2022-12-08 12:07:51', '2022-12-08 16:37:51'),
(228, 108, '2,1', '33,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"33\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2650, 0, 10, 'AL-PRUG-VLVT-RYBWN-B1', 'P00172', '', '70*110 CM', '', '', '2022-12-08 12:12:57', '2022-12-08 16:42:57'),
(229, 109, '2,1', '34,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"34\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2699, 0, 20, 'AL-PRUG-VLVT-RYPNK-F4', 'P00169', '', '70*110 CM', '', '', '2022-12-08 12:38:28', '2022-12-08 17:08:28'),
(230, 110, '2,1', '34,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"34\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2599, 0, 20, 'AL-PRUG-VLVT-RYPNK-H1', 'P00176', '', '70*110 CM', '', '', '2022-12-08 12:43:18', '2022-12-08 17:13:18'),
(231, 111, '2,1', '35,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"35\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2650, 0, 15, 'AL-PRUG-VLVT-RYGRN-B1', 'P00174', '', '70*110 CM', '', '', '2022-12-08 12:47:08', '2022-12-08 17:17:08'),
(232, 112, '2,1', '35,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"35\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2599, 0, 15, 'AL-PRUG-VLVT-RYGRN-H1', 'P00177', '', '70*110 CM', '', '', '2022-12-08 12:52:03', '2022-12-08 17:22:03'),
(233, 113, '2,1', '33,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"33\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2699, 0, 5, 'AL-PRUG-VLVT-RYBWN-F4', 'P00165', '', '70*110 CM', '', '', '2022-12-08 12:56:08', '2022-12-08 17:26:08'),
(234, 10, '2,1', '1,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"1\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2650, 0, 5, 'AL-SET-NVYBL-I2', 'P0060', '', 'LENTH: 43	SHOULDER: 17-18	BUST: 42	WAIST: 40	HIP: 44	SLEEVES: 18-19	OUTSEAM: 30 	INSEAM: 28', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(235, 6, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2050, 0, 5, 'AL-ABY-CFWRK-BLK-RGL-A2', 'P0021', '', 'LENGTH: 56, BUST: 48, SLEEVES: 23', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(236, 22, '2,1', '41,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"41\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1999, 0, 5, 'AL-JIL-GRN-RGL-B3', 'P0019', '', '', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(237, 24, '2,1', '42,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"42\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1750, 0, 5, 'AL-ABY-BLK/GLD-RGL-A2', 'P0022', '', 'LENTH: 56	BUST: 48  SLEEVES: 24', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(238, 25, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1550, 0, 5, 'AL-ABY-JGR-BLK-RGL-A3', 'P0014', '', 'LENTH: 56	BUST: 48 SLEEVES: 23', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(239, 26, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2350, 0, 5, 'AL-ABY-BLK-CGZ-RGL-B4', 'P0010', '', 'LENTH: 56	BUST: 48 SLEEVES: 21', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(240, 15, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1499, 0, 7, 'AL-ARL-O-ABY-BLK-RGL-A1', 'P0031', '', '', '', '', '2022-11-08 01:23:18', '2022-11-08 17:53:18'),
(241, 114, '2,1', '4,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"4\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2650, 0, 5, 'AL-SET-SKYBL-H3', 'P0058', '36', 'LENTH -  43, SHOULDER - 17-18,  BUST -  42,  WAIST - 40, HIP - 44, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-09 11:29:11', '2022-12-09 15:59:11'),
(242, 114, '2,1', '4,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"4\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2650, 0, 5, 'AL-SET-SKYBL-H3', 'P0058', '36', 'LENTH -  43, SHOULDER - 17-18,  BUST -  44,  WAIST - 42, HIP - 46, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2022-12-09 11:32:53', '2022-12-09 16:02:53'),
(243, 98, '2,1', '8,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2100, 0, 3, 'AL-ABY-BLK-RGL-B4', 'P0008', '', 'LENGTH - 58, BUST - 48, SLEEVES - 21', '', '', '2022-12-09 12:08:34', '2022-12-09 16:38:34'),
(244, 115, '2,1', '17,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"17\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1450, 0, 5, 'AL-ABY-JGR-GREY-RGL-A3', 'P0013', '', 'LENTH - 56 , BUST - 46,  SLEEVES - 22', '', '', '2023-01-24 08:53:35', '2023-01-24 01:53:36'),
(245, 116, '2,1', '51,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"51\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1999, 0, 5, 'AL-JIL-CML-RGL-B3', 'P0020', '', 'LENTH - REGULAR 3 PCS,  BUST -Â  REGULAR 3 PCS,  SLEEVES -Â  REGULAR 3 PCS', '', '', '2023-01-24 09:03:13', '2023-01-24 02:03:13'),
(246, 117, '2,1', '14,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-PNK-E4', 'P0066', '', '180 CM * 70 CM', '', '', '2023-01-24 09:13:06', '2023-01-24 02:13:06'),
(247, 118, '2,1', '10,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"10\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 500, 0, 5, 'AL-LUXHJB-GLD-G4', 'P0086', '', '175 CM * 70 CM', '', '', '2023-01-24 09:17:19', '2023-01-24 02:17:19'),
(248, 119, '2,1', '20,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-WHT-E4', 'P0067', '', '180 CM * 70 CM', '', '', '2023-01-24 09:23:05', '2023-01-24 02:23:05'),
(249, 120, '2,1', '21,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"21\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-SKN-E4', 'P0069', '', '180 CM * 70 CM', '', '', '2023-01-24 09:42:55', '2023-01-24 02:42:55'),
(250, 121, '2,1', '23,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"23\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-CRM-G3', 'P0094', '', '175 CM * 70 CM', '', '', '2023-01-24 09:46:15', '2023-01-24 02:46:15'),
(251, 122, '2,1', '37,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"37\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 3, 'AL-LUXHJB-PCH-E2', 'P0077', '', '175 CM * 70 CM', '', '', '2023-01-24 11:08:21', '2023-01-24 04:08:21'),
(252, 123, '2,1', '20,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 3, 'AL-LUXHJB-WHT-E2', 'P0079', '', '175 CM * 70 CM', '', '', '2023-01-24 11:55:27', '2023-01-24 04:55:27'),
(253, 124, '2,1', '61,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"61\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-PCH/BLK-G2', 'P00109', '', '175 CM * 85 CM', '', '', '2023-01-24 12:03:00', '2023-01-24 05:03:00'),
(254, 125, '2,1', '21,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"21\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 2, 'AL-LUXHJB-SKN-E1', 'P0085', '', '175 CM * 70 CM', '', '', '2023-01-25 08:58:01', '2023-01-25 01:58:01'),
(255, 126, '2,1', '63,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"63\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 3150, 0, 5, 'AL-SET-PSTA-H4', 'P0047', '', 'LENTH - ALL SIZE 46, SHOULDER - 13-14, BUST - 38, WAIST - 34, HIP - 40, SLEEVES - AL SIZE 19-20, OUTSEAM - ALL SIZE 38, INSEAM - ALL SIZE 25-26', '', '', '2023-01-25 09:12:22', '2023-01-25 02:12:23'),
(256, 126, '2,1', '63,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"63\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 3150, 0, 5, 'AL-SET-PSTA-H4', 'P0047', '', 'LENTH - ALL SIZE 46, SHOULDER - 14-15, BUST - 40, WAIST - 36, HIP - 42, SLEEVES - AL SIZE 19-20, OUTSEAM - ALL SIZE 38, INSEAM - ALL SIZE 25-26', '', '', '2023-01-25 09:12:22', '2023-01-25 02:12:23'),
(257, 126, '2,1', '63,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"63\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 3150, 0, 5, 'AL-SET-PSTA-H4', 'P0047', '', 'LENTH - ALL SIZE 46, SHOULDER - 15-16, BUST - 42, WAIST - 38, HIP - 44, SLEEVES - AL SIZE 19-20, OUTSEAM - ALL SIZE 38, INSEAM - ALL SIZE 25-26', '', '', '2023-01-25 09:12:22', '2023-01-25 02:12:23'),
(258, 126, '2,1', '63,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"63\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 3150, 0, 5, 'AL-SET-PSTA-H4', 'P0047', '', 'LENTH - ALL SIZE 46, SHOULDER - 16-17, BUST - 44, WAIST - 40, HIP - 46, SLEEVES - AL SIZE 19-20, OUTSEAM - ALL SIZE 38, INSEAM - ALL SIZE 25-26', '', '', '2023-01-25 09:12:22', '2023-01-25 02:12:23');
INSERT INTO `products_variations` (`id`, `product_id`, `variation_type`, `variation_value`, `attr_attrvalue`, `variation_regular_price`, `variation_sale_price`, `variation_stock`, `variation_sku`, `variation_product_code`, `variation_fabric`, `variation_custom_size`, `variation_description`, `variation_photo`, `createDate`, `updateDate`) VALUES
(259, 127, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 399, 0, 5, 'AL-PPNG-NQB-BLK-A1', 'P0033', '', 'Regular', '', '', '2023-01-25 10:10:39', '2023-01-25 03:10:39'),
(260, 128, '2,1', '21,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"21\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 599, 0, 12, 'AL-SMRPNTS-SKN-RGL-C1', 'P00143', '', 'OUTSEAM - 35, INSEAM - 25', '', '', '2023-01-25 11:10:42', '2023-01-25 04:10:42'),
(261, 129, '2,1', '35,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"35\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2499, 0, 10, 'AL-PRUG-KRVNSRY-RYGRN-F2', 'P00186', '', '70*110', '', '', '2023-01-27 05:08:50', '2023-01-26 22:08:50'),
(262, 130, '2,1', '64,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"64\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2499, 0, 10, 'AL-PRUG-KRVNSRY-RYCRM-F3', 'P00185', '', '70*110', '', '', '2023-01-27 05:24:50', '2023-01-26 22:24:50'),
(263, 131, '2,1', '65,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"65\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2499, 0, 15, 'AL-PRUG-KRVNSRY-RYBLK-F3', 'P00184', '', '70*110', '', '', '2023-01-27 05:29:42', '2023-01-26 22:29:42'),
(264, 132, '2,1', '66,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"66\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2499, 0, 15, 'AL-PRUG-KRVNSRY-RYMHRN-F3', 'P00183', '', '70*110', '', '', '2023-01-27 05:35:09', '2023-01-26 22:35:09'),
(265, 133, '2,1', '32,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"32\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2499, 0, 5, 'AL-PRUG-KRVNSRY-RYGRY-F3', 'P00182', '', '70*110', '', '', '2023-01-27 05:40:09', '2023-01-26 22:40:09'),
(266, 134, '2,1', '64,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"64\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2499, 0, 5, 'AL-PRUG-KRVNSRY-RYCRM-F3', 'P00181', '', '70*110', '', '', '2023-01-27 05:50:47', '2023-01-26 22:50:47'),
(267, 135, '2,1', '64,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"64\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2599, 0, 15, 'AL-PRUG-VLVT-RYCRM-H1', 'P00178', '', '70*110', '', '', '2023-01-27 05:53:56', '2023-01-26 22:53:56'),
(268, 136, '2,1', '64,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"64\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2650, 0, 20, 'AL-PRUG-VLVT-RYCRM-B1', 'P00175', '', '70*110', '', '', '2023-01-27 05:57:01', '2023-01-26 22:57:01'),
(269, 137, '2,1', '67,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"67\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2699, 0, 10, 'AL-PRUG-VLVT-RYWHT-F4', 'P00167', '', '70*110', '', '', '2023-01-27 06:00:20', '2023-01-26 23:00:20'),
(270, 138, '2,1', '64,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"64\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 2699, 0, 9, 'AL-PRUG-VLVT-RYCRM-F4', 'P00166', '', '70*110', '', '', '2023-01-27 06:04:14', '2023-01-26 23:04:14'),
(271, 139, '2,1', '4,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"4\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 5, 'AL-PLZ-CHK-SBLUE-RGL-D2', 'P00148', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2023-01-27 07:02:14', '2023-01-27 00:02:14'),
(272, 140, '2,1', '20,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 749, 0, 5, 'AL-PLZ-CKN-WHT-RGL-D1', 'P00158', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2023-01-27 07:05:45', '2023-01-27 00:05:45'),
(273, 141, '2,1', '20,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-WHT-RGL-D4', 'P00126', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2023-01-27 07:15:37', '2023-01-27 00:15:37'),
(274, 142, '2,1', '21,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"21\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-SKN-RGL-C4', 'P00123', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2023-01-27 07:23:15', '2023-01-27 00:23:15'),
(275, 143, '2,1', '50,26', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"26\"}]', 1450, 0, 5, 'AL-KURTI-LGRN-J3', 'P0041', '', 'Small', '', '', '2023-01-27 07:33:55', '2023-01-27 00:33:55'),
(276, 143, '2,1', '50,27', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"27\"}]', 1450, 0, 5, 'AL-KURTI-LGRN-J3', 'P0041', '', 'Medium', '', '', '2023-01-27 07:33:55', '2023-01-27 00:33:55'),
(277, 143, '2,1', '50,28', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"28\"}]', 1450, 0, 5, 'AL-KURTI-LGRN-J3', 'P0041', '', 'Large', '', '', '2023-01-27 07:33:55', '2023-01-27 00:33:55'),
(278, 143, '2,1', '50,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 1450, 0, 5, 'AL-KURTI-LGRN-J3', 'P0041', '', 'XL', '', '', '2023-01-27 07:33:55', '2023-01-27 00:33:55'),
(279, 143, '2,1', '50,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"50\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 1450, 0, 5, 'AL-KURTI-LGRN-J3', 'P0041', '', 'XXL', '', '', '2023-01-27 07:33:55', '2023-01-27 00:33:55'),
(280, 144, '2,1', '60,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"60\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2149, 0, 4, 'AL-SET-ABLUE-I3', 'P0051', '', 'LENTH - REGULAR 41-42, SHOULDER - REGULAR 16, BUST - REGULAR 44, WAIST - REGULAR 40, HIP - REGULAR 46-47', '', '', '2023-01-27 07:44:33', '2023-01-27 00:44:33'),
(281, 145, '2,1', '62,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"62\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-CBRN-G1', 'P00114', '', '175 CM * 85 CM', '', '', '2023-01-27 08:48:39', '2023-01-27 01:48:39'),
(282, 146, '2,1', '37,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"37\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2050, 0, 5, 'AL-ABY-PCH-RGL-A2', 'P0025', '', 'LENTH - 56, BUST - 48, SLEEVES - 23', '', '', '2023-01-30 06:04:09', '2023-01-29 23:04:09'),
(283, 147, '2,1', '68,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"68\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1999, 0, 5, 'AL-JIL-LVNDR-RGL-B3', 'P0017', '', 'LENTH - REGULAR 3 PCS, BUST - REGULAR 3 PCS, SLEEVES - REGULAR 3 PCS', '', '', '2023-01-30 06:12:06', '2023-01-29 23:12:06'),
(284, 148, '2,1', '69,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"69\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 5, 'AL-DLYHJB-CRM/RED-G2', 'P00106', '', '175 CM * 85 CM', '', '', '2023-01-30 06:16:49', '2023-01-29 23:16:49'),
(285, 149, '2,1', '23,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"23\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 500, 0, 5, 'AL-LUXHJB-CRM-G3', 'P0090', '', '175 CM * 70 CM', '', '', '2023-01-30 06:21:03', '2023-01-29 23:21:03'),
(286, 150, '2,1', '11,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"11\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-MSTRD-G2', 'P00111', '', '175 CM * 85 CM', '', '', '2023-01-30 06:30:34', '2023-01-29 23:30:34'),
(287, 151, '2,1', '70,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"70\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 500, 0, 5, 'AL-LUXHJB-BBYPNK-G4', 'P0088', '', '175 CM * 70 CM', '', '', '2023-01-30 06:35:25', '2023-01-29 23:35:25'),
(288, 152, '2,1', '24,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"24\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-LGREY-E3', 'P0075', '', '180 CM * 70 CM', '', '', '2023-01-30 06:38:49', '2023-01-29 23:38:49'),
(289, 153, '2,1', '71,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"71\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-LPCH-E3', 'P0074', '', '180 CM * 70 CM', '', '', '2023-01-30 06:47:42', '2023-01-29 23:47:42'),
(290, 154, '2,1', '51,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"51\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 3, 'AL-LUXHJB-CML-E1', 'P0081', '', '175 CM * 70 CM', '', '', '2023-01-30 06:52:13', '2023-01-29 23:52:13'),
(291, 155, '2,1', '4,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"4\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-SBLUE-E3', 'P0071', '', '180 CM * 70 CM', '', '', '2023-01-30 06:55:45', '2023-01-29 23:55:45'),
(292, 156, '2,1', '4,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"4\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 3, 'AL-LUXHJB-SBLUE-E2', 'P0076', '', '175 CM * 70 CM', '', '', '2023-01-30 06:58:45', '2023-01-29 23:58:45'),
(293, 157, '2,1', '63,29', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"63\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"29\"}]', 2750, 0, 5, 'AL-SET-PSTACLR-I1', 'P0064', '', 'LENTH - 43, SHOULDER - 17-18, BUST - 42, WAIST - 40, HIP - 44, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2023-01-31 06:45:28', '2023-01-30 23:45:28'),
(294, 157, '2,1', '63,30', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"63\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"30\"}]', 2750, 0, 5, 'AL-SET-PSTACLR-I1', 'P0064', '', 'LENTH - 43, SHOULDER - 17-18, BUST - 44, WAIST - 42, HIP - 46, SLEEVES - 18-19, OUTSEAM - 38, INSEAM - 28', '', '', '2023-01-31 06:45:28', '2023-01-30 23:45:28'),
(295, 158, '2,1', '72,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"72\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 5, 'AL-PLZ-PLN-DOLV-RGL-D2', 'P00154', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2023-01-31 06:53:14', '2023-01-30 23:53:14'),
(296, 159, '2,1', '39,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"39\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 6, 'AL-PLZ-PLN-DPNK-RGL-D2', 'P00152', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2023-01-31 06:56:17', '2023-01-30 23:56:17'),
(297, 160, '2,1', '73,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"73\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 10, 'AL-PLZ-PLN-TEL-RGL-D2', 'P00151', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2023-01-31 06:59:59', '2023-01-30 23:59:59'),
(298, 161, '2,1', '44,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"44\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 2, 'AL-PLZ-PLN-BRWN-RGL-D2', 'P00155', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2023-01-31 07:03:00', '2023-01-31 00:03:00'),
(299, 162, '2,1', '5,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 1299, 0, 25, 'AL-PRUG-LXTRA-MHRN-F2', 'P00187', '', '70*110', '', '', '2023-01-31 07:15:08', '2023-01-31 00:15:08'),
(300, 163, '2,1', '35,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"35\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 1299, 0, 25, 'AL-PRUG-LXTRA-RYGRN-F2', 'P00188', '', '70*110', '', '', '2023-01-31 07:20:54', '2023-01-31 00:20:54'),
(301, 164, '2,1', '5,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 1399, 0, 25, 'AL-PRUG-LXTRA-MHRN-F2', 'P00189', '', '70*110', '', '', '2023-01-31 07:23:29', '2023-01-31 00:23:29'),
(302, 165, '2,1', '35,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"35\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 1399, 0, 25, 'AL-PRUG-LXTRA-RYGRN-F2', 'P00190', '', '70*110', '', '', '2023-01-31 07:26:30', '2023-01-31 00:26:30'),
(303, 166, '2,1', '74,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"74\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 1499, 0, 25, 'AL-PRUG-LXTRA-DBLE-F1', 'P00191', '', '70*110', '', '', '2023-01-31 07:29:18', '2023-01-31 00:29:18'),
(304, 167, '2,1', '74,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"74\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 1499, 0, 25, 'AL-PRUG-LXTRA-MHRN-F1', 'P00192', '', '70*110', '', '', '2023-01-31 07:33:17', '2023-01-31 00:33:17'),
(305, 168, '2,1', '75,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"75\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2050, 0, 5, 'AL-ABY-UMB-RGL-B2', 'P0026', '', 'LENTH - 56, BUST - 48, SLEEVES - 23', '', '', '2023-02-07 12:02:27', '2023-02-07 05:02:27'),
(306, 169, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1499, 0, 6, 'AL-ARL-C-ABY-BLK-RGL-B2', 'P0030', '', 'LENTH - 54, BUST - 44, SLEEVES - 21', '', '', '2023-02-07 12:06:04', '2023-02-07 05:06:04'),
(307, 170, '2,1', '14,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 5, 'AL-DLYHJB-PINK-G2', 'P00110', '', '175 CM * 85 CM', '', '', '2023-02-07 12:09:26', '2023-02-07 05:09:26'),
(308, 171, '2,1', '76,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"76\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-TBLUE-G3', 'P0097', '', '175 CM * 70 CM', '', '', '2023-02-07 12:13:01', '2023-02-07 05:13:01'),
(309, 172, '2,1', '17,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"17\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 500, 0, 5, 'AL-LUXHJB-GREY-G3', 'P0092', '', '175 CM * 70 CM', '', '', '2023-02-07 12:17:43', '2023-02-07 05:17:43'),
(310, 173, '2,1', '24,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"24\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 3, 'AL-LUXHJB-LGREY-E1', 'P0083', '', '175 CM * 70 CM', '', '', '2023-02-07 12:20:47', '2023-02-07 05:20:47'),
(311, 174, '2,1', '18,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"18\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-DGLDN-G3', 'P00105', '', '175 CM * 70 CM', '', '', '2023-02-07 12:23:56', '2023-02-07 05:23:56'),
(312, 175, '2,1', '17,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"17\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 3, 'AL-LUXHJB-GREY-E2', 'P0078', '', '175 CM * 70 CM', '', '', '2023-02-07 12:26:55', '2023-02-07 05:26:55'),
(313, 176, '2,1', '77,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"77\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-YLW/BRN-G2', 'P00107', '', '175 CM * 85 CM', '', '', '2023-02-07 12:29:51', '2023-02-07 05:29:51'),
(314, 177, '2,1', '21,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"21\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 500, 0, 5, 'AL-LUXHJB-SKNCLR-G3', 'P0091', '', '175 CM * 70 CM', '', '', '2023-02-07 12:34:21', '2023-02-07 05:34:21'),
(315, 178, '2,1', '7,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"7\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-BLUE-E4', 'P0070', '', '180 CM * 70 CM', '', '', '2023-02-07 12:38:14', '2023-02-07 05:38:14'),
(316, 179, '2,1', '7,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"7\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2149, 0, 4, 'AL-SET-BLUE-H4', 'P0049', '', 'LENTH - 41-42, SHOULDER - 16, BUST - 44, WAIST - 40, HIP - 46-47, SLEEVES - 21, OUTSEAM - 39, INSEAM - 26-27', '', '', '2023-02-08 05:45:29', '2023-02-07 22:45:29'),
(317, 180, '2,1', '78,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"78\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 3, 'AL-PLZ-PLN-WD-RGL-D2', 'P00156', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2023-02-08 05:49:15', '2023-02-07 22:49:15'),
(318, 181, '2,1', '22,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"22\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-RED-RGL-D4', 'P00125', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2023-02-08 05:54:05', '2023-02-07 22:54:05'),
(319, 182, '2,1', '8,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-BLK-RGL-C4', 'P00119', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2023-02-08 05:57:24', '2023-02-07 22:57:24'),
(320, 183, '2,1', '5,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 450, 0, 2, 'AL-PLZ-PLN-MHRN-RGL-D2', 'P00153', '', 'OUTSEAM - 38, INSEAM - 26', '', '', '2023-02-08 06:00:34', '2023-02-07 23:00:34'),
(321, 184, '2,1', '41,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"41\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 1199, 0, 50, 'AL-PRUG-DYA-GRN-F1', 'P00193', '', '70*110', '', '', '2023-02-08 06:04:44', '2023-02-07 23:04:44'),
(322, 185, '2,1', '20,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 899, 0, 50, 'AL-PRUG-CNL-WHT-F1', 'P00194', '', '70*110', '', '', '2023-02-08 06:09:36', '2023-02-07 23:09:36'),
(323, 186, '2,1', '14,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"14\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 1999, 0, 5, 'AL-JIL-PINK-RGL-B3', 'P0018', '', 'LENTH - 3 PCS, BUST - 3 PCS, SLEEVES - 3 PCS', '', '', '2023-02-13 11:53:48', '2023-02-13 04:53:48'),
(324, 187, '2,1', '17,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"17\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2199, 0, 5, 'AL-ABY-PTCHS-GREY-RGL-B2', 'P0027', '', 'LENTH - 56, BUST - 46, SLEEVES - 21', '', '', '2023-02-13 12:26:48', '2023-02-13 05:26:48'),
(325, 188, '2,1', '5,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"5\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 4, 'AL-LUXHJB-MHRN-E1', 'P0082', '', '175 CM * 70 CM', '', '', '2023-02-13 12:32:00', '2023-02-13 05:32:00'),
(326, 189, '2,1', '2,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"2\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-DGREY-E4', 'P0068', '', '180 CM * 70 CM', '', '', '2023-02-15 12:12:45', '2023-02-15 05:12:45'),
(327, 190, '2,1', '8,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 500, 0, 10, 'AL-LUXHJB-BLK-G4', 'P0089', '', '175 CM * 70 CM', '', '', '2023-02-15 12:15:49', '2023-02-15 05:15:49'),
(328, 191, '2,1', '7,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"7\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 500, 0, 5, 'AL-LUXHJB-BLUE-G4', 'P0087', '', '175 CM * 70 CM', '', '', '2023-02-15 12:19:28', '2023-02-15 05:19:28'),
(329, 192, '2,1', '8,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-BLK-G3', 'P00104', '', '175 CM * 70 CM', '', '', '2023-02-15 12:22:21', '2023-02-15 05:22:21'),
(330, 193, '2,1', '8,59', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"8\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"59\"}]', 649, 0, 5, 'AL-LUXHJB-BLK-E3', 'P0072', '', '180 CM * 70 CM', '', '', '2023-02-15 12:25:39', '2023-02-15 05:25:39'),
(331, 194, '2,1', '79,58', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"79\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"58\"}]', 449, 0, 6, 'AL-DLYHJB-GRY/BLK-G2', 'P00108', '', '175 CM * 85 CM', '', '', '2023-02-15 12:28:46', '2023-02-15 05:28:46'),
(332, 195, '2,1', '53,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"53\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 550, 0, 5, 'AL-LUXHJB-PNT-LPNK-G3', 'P0095', '', '175 CM * 70 CM', '', '', '2023-02-15 12:33:38', '2023-02-15 05:33:38'),
(333, 196, '2,1', '7,55', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"7\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"55\"}]', 600, 0, 3, 'AL-LUXHJB-BLUE-E2', 'P0080', '', '175 CM * 70 CM', '', '', '2023-02-15 12:36:54', '2023-02-15 05:36:54'),
(334, 197, '2,1', '20,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"20\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 2149, 0, 4, 'AL-SET-WHT-I3', 'P0050', '', 'LENTH - 41-42, SHOULDER - 16, BUST - 44, WAIST - 40, HIP - 46-47, SLEEVES - 21, OUTSEAM - 39, INSEAM - 26-27', '', '', '2023-02-16 05:15:56', '2023-02-15 22:15:56'),
(335, 198, '2,1', '1,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"1\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-NBLUE-RGL-C4', 'P00124', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2023-02-16 05:19:48', '2023-02-15 22:19:48'),
(336, 199, '2,1', '17,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"17\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-GREY-RGL-C4', 'P00120', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2023-02-16 05:23:40', '2023-02-15 22:23:40'),
(337, 200, '2,1', '46,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"46\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-BRNDY-RGL-C4', 'P00122', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2023-02-16 05:26:16', '2023-02-15 22:26:16'),
(339, 202, '2,1', '81,36', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"81\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"36\"}]', 1599, 0, 50, 'AL-PRUG-MLT-F1', 'P00195', '', '70*110', '', '', '2023-02-16 05:38:20', '2023-02-15 22:38:20'),
(340, 203, '2,1', '80,25', '[{\"AttributeId\":\"2\",\"AttributeValId\":\"80\"},{\"AttributeId\":\"1\",\"AttributeValId\":\"25\"}]', 499, 0, 5, 'AL-LGNS-DTEAL-RGL-C4', 'P00121', '', 'OUTSEAM - 35, INSEAM - 24', '', '', '2023-02-16 11:10:01', '2023-02-16 04:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `fld_id` bigint(20) NOT NULL,
  `fld_name` varchar(255) NOT NULL,
  `fld_email` varchar(255) NOT NULL,
  `fld_rating` varchar(10) NOT NULL,
  `fld_comments` text NOT NULL,
  `fld_product_id` int(11) NOT NULL,
  `fld_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>active, 0=>Inactive',
  `fld_upload_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_2` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `phone_2` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `pintrest` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `copyright` text NOT NULL,
  `header_shipping` text NOT NULL,
  `headScript` text NOT NULL,
  `footerScript` text NOT NULL,
  `bodyScript` text NOT NULL,
  `footerText` text NOT NULL,
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `email`, `email_2`, `phone`, `phone_2`, `address`, `map`, `facebook`, `instagram`, `twitter`, `pintrest`, `youtube`, `copyright`, `header_shipping`, `headScript`, `footerScript`, `bodyScript`, `footerText`, `updateDate`, `createDate`) VALUES
(1, '119052dfd38f843460bca510126f2baa.png', 'support@alpasban.com', 'support@alpasban.com', '+91 9311503538', '123456432', 'B-2 First Floor Chand Bagh Delhi - 110094', 'mp', 'https://www.facebook.com/profile.php?id=100086271502719', 'https://www.instagram.com/al_pasban/', '', '', '', '<p>Copyright ï¿½ 2022 AL Pasban . All Rights Reserved.Design By Ez Rankings</p>\r\n', 'Welcome To The World Of AL PASBAN', 'hs', 'fs', 'bs', 'Since its establishment, AL PASBAN has garnered praise for its avant-garde, distinctive designs, needlework, patterns, and fabric kinds. AL PASBAN honors the ethnic style of wear that\'s influenced by Islamic attire in its creations.', '2022-10-17 15:03:26', '2022-10-17 15:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `heading_1` varchar(255) NOT NULL,
  `heading_2` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `heading_1`, `heading_2`, `url`, `label`, `alt`, `description`, `photo`, `status`, `updateDate`, `createDate`) VALUES
(1, 'Slider 1', '', 'Latest Collection<br> of Abayas', 'https://www.alpasban.com/category/abayas.html', 'Shop Now', 'Show Collection', 'Al Pasban is the best place to buy abayas and niqabs online, <br>we have a variety of abayas styles and colors. ', 'dcb679600f3ff54e390dc86dbbf0427a.jpg', '1', '2022-11-10 16:39:44', '2022-11-10 16:39:44'),
(2, 'Slider 2', '', 'New Collection <br>This Season', 'https://www.alpasban.com/category/women-wear.html', 'Show Collection', 'Show Collection 2', 'A new season is always a time for fresh starts and new beginnings. so, take a look at<br>our latest womenswear and dress up your wordrobe with our collection.', 'c0d101ea106212d48cd5e30da372c614.jpg', '1', '2022-11-10 16:39:44', '2022-11-10 16:39:44'),
(3, 'Slider 3', '', 'Premium Collection <br>Rugs', 'https://www.alpasban.com/category/prayer-rugs.html', 'SHOP NOW!', 'SHOP NOW', 'Make your prayers even more beautiful with our premium prayer rugs.<br>Our prayer rugs come in different design and colors to fit your preference.', 'f2b1fc5c603ead54531d43c6e7a08560.jpg', '1', '2022-11-10 16:39:44', '2022-11-10 16:39:44'),
(4, 'Slide 4', '', 'Designer Hijab<br> Collection', 'https://www.alpasban.com/category/hijab.html', 'Shop Now', 'SHOP NOW', 'The new Hijab collection at Al Pasban is designed to offer a variety of<br>contemporary classic and stylish hijab style to suit every occasion.', 'c7d36e5d96b3fc236c1aee6da2118c7d.jpg', '1', '2022-12-02 15:37:24', '2022-12-02 15:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `designation` varchar(225) NOT NULL,
  `message` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `updateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `designation`, `message`, `photo`, `company`, `status`, `updateDate`, `createDate`) VALUES
(5, 'SABA KHAN', '', 'I\'ve just received up my first product package and I am really satisfied with it. It is such a high-quality product and the level of service is so amazing. In this day’s high-quality products and a matching level of service is hard to come by, my experience with AL PASBAN provided me with both. Shopping with AL PASBAN again is in my plans, and I would recommend it being a part of yours too.', 'a73a2e76b1653469526d4733531d4d5b.jpg', '', '1', '2022-10-19 15:57:18', '2022-10-19 15:57:18'),
(8, 'AMJAD KHAN', '', 'I bought prayer rug for my mom and she absolutely loves it! The quality is premium and the design is perfect. It&#39;s just what I needed as a gift to show her how much I care about her. For this I am thankful to AL PASBAN. Highly recommend to everyone.', '6315a2f4d50f8ddc69c862e91b9cdca2.jpg', '', '1', '2022-10-19 15:59:42', '2022-10-19 15:59:42'),
(11, 'HUMA SHARIF ', 'KERALA', 'I recently bought an abaya from al pasban and it&#39;s exactly what I wanted. The fabric is very soft, lightweight, when I wear it, I feel walk on the cloud. Whenever I wear this abaya to any occasion, the centre of attraction instantly shifts to me. One time, my cousin sister came up and said that she loved my style. Thanks to AL PASBAN.', 'e3d5f06c260348c556f9104f4c7d8d1a.jpg', '', '1', '2022-10-19 16:03:20', '2022-10-19 16:03:20'),
(12, 'KAVITA SHARMA', '', 'I recently ordered a pakistani suit from AL PASBAN. I was looking for the pakistani suits and dresses with a reasonable price and AL PASBAN did not disappoint me. They had an excellent range of suits and were really amazing. I am really happy with what I got.', '3cb96ecefbaf9ee50ee97e1a0d50c528.jpg', '', '1', '2022-10-19 16:06:30', '2022-10-19 16:06:30'),
(13, 'Raashi Aggarwal', 'Noida', 'I got my 3 piece kurta set from AL PASBAN and I\'m beyond impressed with the quality! The fabric is so light-weight and comfortable and the colors are vibrant and vivid. I highly recommend this product to anyone looking for high quality and stylish traditional clothing.', '', '', '1', '2023-02-25 04:22:52', '2023-02-25 04:22:52'),
(14, 'laila Emmanuel', 'Telangana', 'I recently purchased a pair of leggings from this website and I\'m absolutely in love with them. The fabric is so soft, light and breathable, I feel totally comfortable even after wearing them for hours. I highly recommend this website if you\'re looking for quality leggings that look great and feel amazing.', '', '', '1', '2023-02-25 04:32:51', '2023-02-25 04:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone_no` varchar(13) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `address_second` text NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `country` int(11) NOT NULL,
  `city` varchar(250) NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `phone_no`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `address_second`, `zipcode`, `country`, `city`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'yash', '123456789', 'yashvir.ezrankings01@gmail.com', '7ece99e593ff5dd200e2b9233d9ba654', 0, 'Yash', 'Pal', 'A-74, 2nd Floor, Sector-2', 'Third Floors ', '201301', 1, 'Noida', '', '', 1, '', '', '0000-00-00 00:00:00'),
(7, 'saifidanish295@gmail.com', '9958684597', 'saifidanish295@gmail.com', 'd56058316ce44ca9568323e2b14853fd', 0, 'Mohd ', 'Danish', 'C-12/115 3rd floor yamuna vihar', '', '110053', 1, 'delhi', '9958684597', '', 1, '', '', '0000-00-00 00:00:00'),
(8, 'Danish', '9958684597', 'alpasban786@gmail.com', 'd56058316ce44ca9568323e2b14853fd', 0, 'Mohd', 'Danish', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(10, '', '9717355161', 'farhasaifi103@gmail.com', '8f52905f0d989c9b0596ba7fb8167015', 0, 'Farha', 'saifi', 'Cr-233,3rd floor', 'Lalita park Laxmi Nagar near Laxmi Nagar metro station gate no 1', '110092', 1, 'New Delhi', '', '', 1, '', '', '0000-00-00 00:00:00'),
(11, '', '9650980815', 'tabassumtaj507@gmail.com', 'ad02482c4804137c565cb69b1211d860', 0, 'Tabassum ', 'taj', 'D-133 street no.7', 'Dayalpur ', '110094', 0, 'Delhi', '', '', 1, '', '', '0000-00-00 00:00:00'),
(12, 'mukul@ezrankings.com', '8742922417', 'mukul@ezrankings.com', '1a28f88c7402a7c69005ee182b39b67f', 0, 'Test ', '.', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(13, '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', 0, '', '', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(14, '', '8368569524', 'jyotikajaswal3893@gmail.com', '9907f638ae331ef9e349c5476de338af', 0, 'Jyotika', 'jaswal', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(15, '', '8800627220', 'siya.ngel4@gmail.com', '6ac9f6918e4ddd31ecb5fea9ae575342', 0, 'Siya', 'khan', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', '110092', 1, 'New Delhi', '8800627220', '', 1, '', '', '0000-00-00 00:00:00'),
(16, '', '8800627220', 'sabakhan.khan94@gmail.com', '1f8c57cadd05f0789b722d08e90947f1', 0, 'Siya', 'khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(17, '', '9999999999', 'prabhat@ezrankings.in', 'e10adc3949ba59abbe56e057f20f883e', 0, 'prabhat', 'kumar', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(18, '', '9873156382', 'simmigoswami2017@gmail.com', 'fe59efc64acf176b08282cf45250066f', 0, 'Simmi', 'goswami', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(19, '', '9910253699', 'imrankh8100@gmail.com', '7b1b622fc998124dca1920b9af910c03', 0, 'IMRAN', 'KHAN', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(20, '', '7895461800', 'akkhan6779@gmail.com', 'e19d7eee3a5465399014ce5ae78c621b', 0, 'aktar', 'khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(21, '', '9717529650', 'khan789ashraf@gmail.com', '0109c88b46062ed92f7bbe64362aea4e', 0, 'ashraf', 'khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(22, '', '9999999999', 'test@gmail.com', '7da42b28fc17e617095dbf4654187db2', 0, 'test', 'test', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(23, '', '9717494944', 'vs89512@gmail.com', '2c19d79b0ba61d5b32901caac39c8de6', 0, 'Vishal', 'Sharma', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(24, '', '7838042836', 'Bilal234@icloud.com', '21ce2257e3e0770869334c8e06c92347', 0, 'Bilal', 'khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(25, '', '9210160691', 'rahatjahan@gmail.com', '32f05f4d485009d5c916095d080fad71', 0, 'Rahat', 'jahan', 'Cr-233, lalita park, laxmi nagar', '', '110092', 0, 'New delhi', '', '', 1, '', '', '0000-00-00 00:00:00'),
(26, '', '9891971282', 'sayrasaifi@gmail.com', 'b3789698a84338abe2f35cbe8c02c039', 0, 'Sayra', 'saifi', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(27, '', '7007368980', 'Munnamisba@gmail.com', 'd6ac7ed5c73302e84b10993dbcef5dbd', 0, 'Munna', 'misba', 'Nehal yarn Traders', 'A 30/29 k Hanuman fatak', '221001', 1, 'Varanasi', '', '', 1, '', '', '0000-00-00 00:00:00'),
(28, '', '8368569524', 'jyotikaj@hdfcsales.com', 'da06eccbca9da9e80c272e68c2b83418', 0, 'Jyotika', 'jaswal', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(29, '', '8423274813', 'junaidrais@gmail.com', 'dd6b0afe09967e72c288a76e4b48f0d5', 0, 'Md junaid', 'rais', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(30, '', '8423274813', 'junaid@gmail.com', 'dd6b0afe09967e72c288a76e4b48f0d5', 0, 'Juanid', 'rais', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(31, '', '09311808028', 'Sumaiyaabdulsalam6@gmail.com', '15750575388e2173c6f1ce8e9d4d7c32', 0, 'Sumaiya', 'abdul salam', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(32, 'fizayaqoob2121@gmail.com', '83828 12386', 'fizayaqoob2121@gmail.com', 'f82810fadc1ebda96872b0dd5df48793', 0, 'Fiza', 'Yaqoob', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(33, 'asmakhan6028@gmail.com', '99206 97481', 'asmakhan6028@gmail.com', 'ecd60eb22cf6c82b8c296694fe46a413', 0, 'Asma', 'Khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(34, 'khanbesma06@gmail.com', '7006011980', 'khanbesma06@gmail.com', 'd6f2d0497f42e36997c1fc63c0e45239', 0, 'Maahi', 'Khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(35, 'Arjuraja114@gmail.com', '70518 37681', 'Arjuraja114@gmail.com', '22737fa5c16fd56e1e2064c64910db99', 0, 'Arjumand  Mushtaq', 'Arjumand', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(36, 'syedafreen.9@gmail.com', '9756295629', 'syedafreen.9@gmail.com', '69f60c83d4cbfcb984f8eafedce228c2', 0, 'Afreen', 'Syed', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(37, 'Nagmashaikh11051992@gmail.com', '96077 7999', 'Nagmashaikh11051992@gmail.com', '002876b117391632cd064f29ab744b61', 0, 'Nagma', 'Shaikh', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(38, 'sabanashah06@gmail.com', '8837433122', 'sabanashah06@gmail.com', '80eed5e2c9dd68481fd05df1f3e1c32b', 0, 'Sabana', 'Shah ', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(39, '', '7498632925', 'sanashaikh147@gmail.com', '82ec6b4d8928721ab20c1c8f34639c00', 0, 'Sana', 'sanashaikh147@gmail.com', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(40, 'gulafshakhan1205804@gmail.com', '90011 76289', 'gulafshakhan1205804@gmail.com', '3c85276399a8b5302d66067fd5844cd8', 0, 'Saeed', 'Khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(41, 'sumaiyabanu497@gmail.com', '83100 22955', 'sumaiyabanu497@gmail.com', '4ff4a17aa23cd69f75f0a99e968781bf', 0, 'Sumaiya', 'Azeez', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(42, 'nadznin@gmail.com', '+91 99224 156', 'nadznin@gmail.com', '18d76964dbec5031a3d0ccd231749397', 0, 'Naznin', 'Shaikh', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(43, 'Khursheed.jahanbegum@gmail.com', '97058 43457', 'Khursheed.jahanbegum@gmail.com', 'b994d84693050fb7de00af36eba956f1', 0, 'Salman', 'Hussain', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(44, 'khanmariam22@gmail.com', '60062 90046', 'khanmariam22@gmail.com', '2408ebcdb5b5b9b86dce68bbe89868f3', 0, 'Hasan', 'Khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(45, 'saifianam327@gmail.com', '7678164092', 'saifianam327@gmail.com', 'b997eadcf7a9a2a5e209ae4110158d92', 0, 'Annu', 'Khan', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00'),
(46, 'shaiksumayabanu@gmail.com', '9154595903', 'shaiksumayabanu@gmail.com', '854f5ca21bb60e2e01cbf3b57654df3d', 0, 'Banu', 'Banu', '', '', '', 0, '', '', '', 1, '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_address`
--

CREATE TABLE `users_address` (
  `fld_id` int(11) NOT NULL,
  `fld_user_id` int(11) NOT NULL,
  `fld_first_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fld_last_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fld_company_name` varchar(255) NOT NULL,
  `fld_address` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fld_address2` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fld_city` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fld_state` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fld_zip_code` varchar(20) CHARACTER SET latin1 NOT NULL,
  `fld_country` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fld_default_address` tinyint(4) NOT NULL,
  `fld_phone_no` varchar(50) NOT NULL,
  `fld_email_id` varchar(255) NOT NULL,
  `fld_status` enum('active','inactive') DEFAULT 'active',
  `fld_type` enum('billing','shipping') DEFAULT 'shipping',
  `fld_created_date` date NOT NULL,
  `fld_modified_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_address`
--

INSERT INTO `users_address` (`fld_id`, `fld_user_id`, `fld_first_name`, `fld_last_name`, `fld_company_name`, `fld_address`, `fld_address2`, `fld_city`, `fld_state`, `fld_zip_code`, `fld_country`, `fld_default_address`, `fld_phone_no`, `fld_email_id`, `fld_status`, `fld_type`, `fld_created_date`, `fld_modified_date`) VALUES
(1, 1, 'Yash', 'Pal', 'EZ', 'A-744', 'Sec 11', 'Noidaa', '', '123456', 'India', 0, '1234567890', 'yashvir.ezrankings01@gmail.com', 'active', 'billing', '2023-03-06', '0000-00-00'),
(2, 1, 'Yash', 'Pal', 'EZ', 'A-744', 'Sec 11', 'Noidaa', '', '123456', 'India', 0, '1234567890', 'yashvir.ezrankings01@gmail.com', 'active', 'shipping', '2023-03-06', '0000-00-00'),
(11, 7, 'MOHD ', 'Danish', '', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 0, '9958684597', 'saifidanish295@gmail.com', 'active', 'billing', '2023-02-25', '0000-00-00'),
(12, 7, 'MOHD ', 'Danish', '', 'C-12/115 3RD FLOOR ', 'YAMUNA VIHAR', 'DELHI', '', '110053', 'India', 0, '9958684597', 'saifidanish295@gmail.com', 'active', 'shipping', '2023-02-25', '0000-00-00'),
(13, 8, 'Mohd ', 'Danish', '', 'C-12/115 3rd floor yamuna vihar', '', 'delhi', '', '110053', 'India', 0, '9958684597', 'alpasban786@gmail.com', 'active', 'billing', '2022-12-05', '0000-00-00'),
(14, 8, 'Mohd ', 'Danish', '', 'C-12/115 3rd floor yamuna vihar', '', 'delhi', '', '110053', 'India', 0, '9958684597', 'alpasban786@gmail.com', 'active', 'shipping', '2022-12-05', '0000-00-00'),
(15, 10, 'Farha', 'Saifi', '', 'Cr-233,3rd floor Lalita park ', 'Laxmi Nagar near Laxmi Nagar metro station gate no 1', 'New Delhi', '', '110092', 'India', 1, '9717355161', 'farhasaifi103@gmail.com', 'active', 'billing', '2023-01-29', '0000-00-00'),
(16, 10, 'Farha', 'Saifi', '', 'Cr-233,3rd floor Lalita park ', 'Laxmi Nagar near Laxmi Nagar metro station gate no 1', 'New Delhi', '', '110092', 'India', 1, '9717355161', 'farhasaifi103@gmail.com', 'active', 'shipping', '2023-01-29', '0000-00-00'),
(17, 11, 'Tabassum ', 'Taj', '', 'D-133 street no - 7', 'Dayal pur', 'Delhi', '', '110094', 'India', 1, '9650980815', 'tabassumtaj507@gmail.com', 'active', 'billing', '2022-12-15', '0000-00-00'),
(18, 11, 'Tabassum ', 'Taj', '', 'D-133 street no - 7', 'Dayal pur', 'Delhi', '', '110094', 'India', 1, '9650980815', 'tabassumtaj507@gmail.com', 'active', 'shipping', '2022-12-15', '0000-00-00'),
(19, 12, 'Test ', '.', '', 'A-74, 2nd Floor Sector-02, Noida - 201301', '', 'Noida', '', '201301', 'India', 0, '8742922417', 'mukul@ezrankings.com', 'active', 'billing', '0000-00-00', '0000-00-00'),
(20, 12, 'Test ', '.', '', 'A-74, 2nd Floor Sector-02, Noida - 201301', '', 'Noida', '', '201301', 'India', 0, '8742922417', 'mukul@ezrankings.com', 'active', 'shipping', '0000-00-00', '0000-00-00'),
(21, 13, '', '', '', '', '', '', '', '', '', 0, '', '', 'active', 'billing', '2022-12-16', '0000-00-00'),
(22, 13, '', '', '', '', '', '', '', '', '', 0, '', '', 'active', 'shipping', '2022-12-16', '0000-00-00'),
(23, 22, 'Prabhat', 'Kumar', '', 'Test', 'Test', 'New Delhi', '', '110044', 'India', 1, '9999999999', 'test@gmail.com', 'active', 'billing', '2023-01-02', '0000-00-00'),
(24, 22, 'Prabhat', 'Kumar', '', 'Test', 'Test', 'New Delhi', '', '110044', 'India', 1, '9999999999', 'test@gmail.com', 'active', 'shipping', '2023-01-02', '0000-00-00'),
(25, 15, 'Siya', 'Khan', 'Jamia', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', 'New Delhi', '', '110092', 'India', 1, '8800627220', 'siya.ngel4@gmail.com', 'active', 'billing', '2023-01-06', '0000-00-00'),
(26, 15, 'Siya', 'Khan', 'Jamia', 'Cr-233 Lalita Park Laxmi Nagar', 'Gali No-5 Cr Road', 'New Delhi', '', '110092', 'India', 1, '8800627220', 'siya.ngel4@gmail.com', 'active', 'shipping', '2023-01-06', '0000-00-00'),
(27, 25, 'Rahat', 'Jahan', '', 'Cr-233 lalita park, laxmi nagar, mera laxmi nagar metro station gate no1', '', 'New delhi', '', '110092', 'India', 0, '9210160691', 'rahatjahan@gmail.com', 'active', 'billing', '2023-01-07', '0000-00-00'),
(28, 25, 'Rahat', 'Jahan', '', 'Cr-233 lalita park, laxmi nagar, mera laxmi nagar metro station gate no1', '', 'New delhi', '', '110092', 'India', 0, '9210160691', 'rahatjahan@gmail.com', 'active', 'shipping', '2023-01-07', '0000-00-00'),
(29, 27, 'munna', 'Misba', 'Nehal yarn traders ', 'A 30/29 k Hanuman fatak ', '', 'Varanasi ', '', '221001', 'India', 0, '7007368980', 'Munnamisba@gmail.com', 'active', 'billing', '2023-02-20', '0000-00-00'),
(30, 27, 'munna', 'Misba', 'Nehal yarn traders ', 'A 30/29 k Hanuman fatak ', '', 'Varanasi ', '', '221001', 'India', 0, '7007368980', 'Munnamisba@gmail.com', 'active', 'shipping', '2023-02-20', '0000-00-00'),
(31, 31, 'Sumaiya', 'Abdul salam', '', 'O-68,2nd floor,hari masjid', 'Nafis road Batla house jamia nagar ', 'New Delhi ', '', '110025', 'India', 1, '9311808028', 'Sumaiyaabdulsalam6@gmail.com', 'active', 'billing', '2023-02-21', '0000-00-00'),
(32, 31, 'Sumaiya', 'Abdul salam', '', 'O-68,2nd floor,hari masjid', 'Nafis road Batla house jamia nagar ', 'New Delhi ', '', '110025', 'India', 1, '9311808028', 'Sumaiyaabdulsalam6@gmail.com', 'active', 'shipping', '2023-02-21', '0000-00-00'),
(33, 32, 'Fiza', 'Yaqoob', '', '1 Near Nakash Chowk Gorakhpur', '1', 'Gorakhpur ', '', '273001', 'India', 0, '83828 12386', 'fizayaqoob2121@gmail.com', 'active', 'billing', '2023-02-24', '0000-00-00'),
(34, 32, 'Fiza', 'Yaqoob', '', '1 Near Nakash Chowk Gorakhpur', '1', 'Gorakhpur ', '', '273001', 'India', 0, '83828 12386', 'fizayaqoob2121@gmail.com', 'active', 'shipping', '2023-02-24', '0000-00-00'),
(35, 33, 'Asma', 'Khan', '', 'Officers colony plot no 44 chaitanya nagar nanded', '', 'Nanded ', '', '431605', 'India', 0, '99206 97481', 'asmakhan6028@gmail.com', 'active', 'billing', '0000-00-00', '0000-00-00'),
(36, 33, 'Asma', 'Khan', '', 'Officers colony plot no 44 chaitanya nagar nanded', '', 'Nanded ', '', '431605', 'India', 0, '99206 97481', 'asmakhan6028@gmail.com', 'active', 'shipping', '0000-00-00', '0000-00-00'),
(37, 34, 'Maahi', 'Khan', '', 'Jamai masjid nowhatta', 'Jamai masjid ', 'Srinagar', '', '190002', 'India', 1, '7006011980', 'khanbesma06@gmail.com', 'active', 'billing', '2023-02-24', '0000-00-00'),
(38, 34, 'Maahi', 'Khan', '', 'Jamai masjid nowhatta', 'Jamai masjid ', 'Srinagar', '', '190002', 'India', 1, '7006011980', 'khanbesma06@gmail.com', 'active', 'shipping', '2023-02-24', '0000-00-00'),
(39, 35, 'Arjumand  Mushtaq', 'Arjumand', '', 'BEEHAMA', 'Beehama Ganderbal', 'Ganderbal', '', '191201', 'India', 0, '70518 37681', 'Arjuraja114@gmail.com', 'active', 'billing', '2023-02-26', '0000-00-00'),
(40, 35, 'Arjumand  Mushtaq', 'Arjumand', '', 'BEEHAMA', 'Beehama Ganderbal', 'Ganderbal', '', '191201', 'India', 0, '70518 37681', 'Arjuraja114@gmail.com', 'active', 'shipping', '2023-02-26', '0000-00-00'),
(41, 37, 'Nagma', 'Shaikh', '', 'Dosti Planet North elmore c room num 2501', 'Mumbar kausa thane', 'Mumbai', '', '400612', 'India', 1, '96077 7999', 'Nagmashaikh11051992@gmail.com', 'active', 'billing', '2023-03-03', '0000-00-00'),
(42, 37, 'Nagma', 'Shaikh', '', 'Dosti Planet North elmore c room num 2501', 'Mumbar kausa thane', 'Mumbai', '', '400612', 'India', 1, '96077 7999', 'Nagmashaikh11051992@gmail.com', 'active', 'shipping', '2023-03-03', '0000-00-00'),
(43, 38, 'Sabana', 'Shah ', '123', 'Khergao awng leikai ', '', '123', '', '795008', 'India', 0, '8837433122', 'sabanashah06@gmail.com', 'active', 'billing', '2023-03-03', '0000-00-00'),
(44, 38, 'Sabana', 'Shah ', '123', 'Khergao awng leikai ', '', '123', '', '795008', 'India', 0, '8837433122', 'sabanashah06@gmail.com', 'active', 'shipping', '2023-03-03', '0000-00-00'),
(45, 40, 'Saeed', 'Khan', '', 'Millenial Heritage Building Wing - B Fish Market Azad Nagar', 'Opposite andheri Subway Andheri West', 'Mumbai ', '', '400058', 'India', 0, '90011 76289', 'gulafshakhan1205804@gmail.com', 'active', 'billing', '0000-00-00', '0000-00-00'),
(46, 40, 'Saeed', 'Khan', '', 'Millenial Heritage Building Wing - B Fish Market Azad Nagar', 'Opposite andheri Subway Andheri West', 'Mumbai ', '', '400058', 'India', 0, '90011 76289', 'gulafshakhan1205804@gmail.com', 'active', 'shipping', '0000-00-00', '0000-00-00'),
(47, 41, 'Sumaiya', 'Azeez', '', '352/1 1st cross Ammar masjid', 'Shanthinagar', 'Mysore', '', '570019', 'India', 1, '83100 22955', 'sumaiyabanu497@gmail.com', 'active', 'billing', '2023-03-05', '0000-00-00'),
(48, 41, 'Sumaiya', 'Azeez', '', '352/1 1st cross Ammar masjid', 'Shanthinagar', 'Mysore', '', '570019', 'India', 1, '83100 22955', 'sumaiyabanu497@gmail.com', 'active', 'shipping', '2023-03-05', '0000-00-00'),
(49, 42, 'Naznin', 'Shaikh', '', 'NadNin@gmail.com', 'Thakkar apartment A/2; 505, camp', 'Pune', '', '411001', 'India', 0, '+91 99224 15616', 'nadznin@gmail.com', 'active', 'billing', '2023-03-08', '0000-00-00'),
(50, 42, 'Naznin', 'Shaikh', '', 'NadNin@gmail.com', 'Thakkar apartment A/2; 505, camp', 'Pune', '', '411001', 'India', 0, '+91 99224 15616', 'nadznin@gmail.com', 'active', 'shipping', '2023-03-08', '0000-00-00'),
(51, 43, 'Salman', 'Hussain', '', '17-1-93/FC10, Khateeja Colony,  near Shaheen sweet shop', 'Hyderabad', 'Telangana ', '', '500023', 'India', 0, '97058 43457', 'Khursheed.jahanbegum@gmail.com', 'active', 'billing', '0000-00-00', '0000-00-00'),
(52, 43, 'Salman', 'Hussain', '', '17-1-93/FC10, Khateeja Colony,  near Shaheen sweet shop', 'Hyderabad', 'Telangana ', '', '500023', 'India', 0, '97058 43457', 'Khursheed.jahanbegum@gmail.com', 'active', 'shipping', '0000-00-00', '0000-00-00'),
(53, 44, 'Hasan', 'Khan', '', 'Emarat enclave, B Block, flat no 601, Nohsa, Phulwari Sharif,', '', 'Patna ', '', '801505', 'India', 0, '60062 90046', 'khanmariam22@gmail.com', 'active', 'billing', '2023-03-08', '0000-00-00'),
(54, 44, 'Hasan', 'Khan', '', 'Emarat enclave, B Block, flat no 601, Nohsa, Phulwari Sharif,', '', 'Patna ', '', '801505', 'India', 0, '60062 90046', 'khanmariam22@gmail.com', 'active', 'shipping', '2023-03-08', '0000-00-00'),
(55, 45, 'Annu', 'Khan', '', 'D-1/102 Nehru vihar', '25 futa road mother dairy', 'Delhi', '', '110094', 'India', 0, '7678164092', 'saifianam327@gmail.com', 'active', 'billing', '2023-03-09', '0000-00-00'),
(56, 45, 'Annu', 'Khan', '', 'D-1/102 Nehru vihar', '25 futa road mother dairy', 'Delhi', '', '110094', 'India', 0, '7678164092', 'saifianam327@gmail.com', 'active', 'shipping', '2023-03-09', '0000-00-00'),
(57, 46, 'Banu', 'Banu', '', '2/8/262Kotamitta current office nellore ', '', 'Nellore', '', '524005', 'India', 1, '9154595903', 'shaiksumayabanu@gmail.com', 'active', 'billing', '0000-00-00', '0000-00-00'),
(58, 46, 'Banu', 'Banu', '', '2/8/262Kotamitta current office nellore ', '', 'Nellore', '', '524005', 'India', 1, '9154595903', 'shaiksumayabanu@gmail.com', 'active', 'shipping', '0000-00-00', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs_categories`
--
ALTER TABLE `blogs_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `blogs_tags`
--
ALTER TABLE `blogs_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_data`
--
ALTER TABLE `mail_data`
  ADD PRIMARY KEY (`fld_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detials`
--
ALTER TABLE `order_detials`
  ADD PRIMARY KEY (`fld_id`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`fld_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`,`code`);

--
-- Indexes for table `products_attributes_values`
--
ALTER TABLE `products_attributes_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_brands`
--
ALTER TABLE `products_brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_color`
--
ALTER TABLE `products_color`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `products_coupon`
--
ALTER TABLE `products_coupon`
  ADD PRIMARY KEY (`fld_id`);

--
-- Indexes for table `products_fabrics`
--
ALTER TABLE `products_fabrics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `products_gallery`
--
ALTER TABLE `products_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_old`
--
ALTER TABLE `products_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_styles`
--
ALTER TABLE `products_styles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `products_tags`
--
ALTER TABLE `products_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `products_variations`
--
ALTER TABLE `products_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`fld_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_address`
--
ALTER TABLE `users_address`
  ADD PRIMARY KEY (`fld_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs_categories`
--
ALTER TABLE `blogs_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blogs_tags`
--
ALTER TABLE `blogs_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mail_data`
--
ALTER TABLE `mail_data`
  MODIFY `fld_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detials`
--
ALTER TABLE `order_detials`
  MODIFY `fld_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `fld_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products_attributes_values`
--
ALTER TABLE `products_attributes_values`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `products_brands`
--
ALTER TABLE `products_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `products_color`
--
ALTER TABLE `products_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `products_coupon`
--
ALTER TABLE `products_coupon`
  MODIFY `fld_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products_fabrics`
--
ALTER TABLE `products_fabrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `products_gallery`
--
ALTER TABLE `products_gallery`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=959;

--
-- AUTO_INCREMENT for table `products_old`
--
ALTER TABLE `products_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products_styles`
--
ALTER TABLE `products_styles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products_tags`
--
ALTER TABLE `products_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_variations`
--
ALTER TABLE `products_variations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=341;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `fld_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users_address`
--
ALTER TABLE `users_address`
  MODIFY `fld_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
