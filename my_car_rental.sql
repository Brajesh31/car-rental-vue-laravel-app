-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2025 at 08:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `daily_rent_price` decimal(8,2) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `brand`, `model`, `car_type`, `image`, `year`, `daily_rent_price`, `availability`, `created_at`, `updated_at`) VALUES
(8, 'lambo huracan evo', 'Lamborgini', 'lambo huracan evo', 'Electric', 'images/GKL1V1nsQwGzPeuiFMah27RxKpRrxmzoJELahnxf.png', 2024, 2999.00, 1, '2025-05-13 12:39:41', '2025-05-14 10:44:07'),
(9, 'Tesla Exclusive CyberTruck', 'Tesla', 'Tesla Exclusive CyberTruck', 'Electric', 'images/OleV6EZoqKIspEdkhXmnZDGiqGqhMQfC8EIIHcyO.png', 2023, 3000.00, 1, '2025-05-13 12:40:22', '2025-05-14 10:44:22'),
(10, 'Lambo Royal Blue', 'Lamborgini', 'Lambo Royal Blue', 'Hybrid', 'images/5aVi17J7yj8M0HqcbzOf1TEBatdNErmlweboIi4b.png', 2025, 2000.00, 1, '2025-05-13 12:40:55', '2025-05-17 11:00:19'),
(12, 'Tesla Maroon', 'Tesla', 'Tesla Maroon', 'Electric', 'images/iOX80R3aTfbqMAP6grwVmnYep9SdWvRkBs7Sdnp9.png', 2020, 4000.00, 1, '2025-05-13 12:52:14', '2025-05-17 11:00:33'),
(13, 'Lambo Aventador changed', 'Lamborgini', 'Aventador', 'Hybrid', 'images/waqPg3vG3pU1LBxgqqdaxqztmNnGKoaATFWsJ7a8.png', 2025, 2900.00, 1, '2025-05-13 14:56:47', '2025-05-17 11:00:44'),
(14, 'Tesla Milk White', 'Tesla', 'Milk White', 'Electric', 'images/hdaKNgSe8Uw9VvSchQaKl2ZfA6mii0qblaSqtmro.png', 2021, 4500.00, 1, '2025-05-13 16:27:36', '2025-05-17 11:01:03'),
(15, 'Tesla Royal Blue', 'Tesla', 'Royal Blue', 'Electric', 'images/u5qfrU3IgzdN05d0bKaUtCyVMlwwOWtsmcEtaJ0z.png', 2025, 6500.00, 1, '2025-05-13 16:28:43', '2025-05-17 11:01:13'),
(16, 'Lambo Huracan premium', 'Lamborgini', 'Huracan pRemium', 'Electric', 'images/EhOWB3IPPQATUrpQ430CRKgzt34sKptoxIMqauGp.png', 2024, 2500.00, 1, '2025-05-14 09:00:24', '2025-05-17 11:01:23'),
(17, 'Tesla Royal White', 'Tesla', 'Royal White', 'Electric', 'images/7tUE1d3jlE7VkEvbiXfd4KkKHJgReuF3vn8kdI3Q.png', 2021, 2500.00, 1, '2025-05-14 09:47:06', '2025-05-17 11:00:53'),
(18, 'BYD Cream', 'BYD', 'Cream', 'Electric', 'images/pjiHGfUb3zEiXVViZ6vcldFTNmAERbacq2VxaG1z.png', 2024, 5000.00, 1, '2025-05-14 10:09:29', '2025-05-14 10:09:29'),
(19, 'BYD Hybrid', 'BYD', 'Hybrid', 'Hybrid', 'images/kFEHslYa3VMLU2NO0SOfOCGZaQgwKnbyuO6CPmRl.png', 2025, 1000.00, 1, '2025-05-14 10:10:01', '2025-05-18 10:47:56'),
(20, 'BYD Cream120', 'BYD', 'BYD Cream', 'Electric', 'images/kMlZOIDEYAqgSd3vv68V2wLdcOAmMNhXAtJIHJ84.png', 2024, 3500.00, 1, '2025-05-18 08:44:06', '2025-05-18 08:44:06'),
(21, 'BYD_Hybrid', 'BYD', 'BYD_Hybrid 1266', 'Electric', 'images/ze8bLc4ZhZIaKfiZX5foegloNpuGgJSto0m6twMo.png', 2024, 2500.00, 1, '2025-05-18 10:47:20', '2025-05-18 10:47:43'),
(22, 'Tesla Maroon', 'Tesla', 'Tesla Maroon', 'Electric', 'images/V8D2EN1k8t7Pl96E9GNrtOwCG7a3AiMUc99neih9.png', 2023, 1500.00, 1, '2025-05-18 12:20:38', '2025-05-18 12:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_02_172350_create_cars_table', 1),
(5, '2025_05_02_172359_create_rentals_table', 1),
(6, '2025_05_13_055638_make_image_nullable_on_cars_table', 2),
(7, '2025_05_17_144027_add_status_to_rentals_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `car_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `total_cost` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rentals`
--

INSERT INTO `rentals` (`id`, `user_id`, `car_id`, `start_date`, `end_date`, `total_cost`, `created_at`, `updated_at`, `status`) VALUES
(1, 6, 10, '2025-05-17', '2025-05-18', 44000.00, '2025-05-15 12:27:48', '2025-05-15 12:27:48', 'Pending'),
(2, 6, 10, '2025-05-19', '2025-05-19', 22000.00, '2025-05-15 12:28:20', '2025-05-15 12:28:20', 'Pending'),
(3, 6, 12, '2025-05-20', '2025-05-23', 96000.00, '2025-05-15 12:44:13', '2025-05-15 12:44:13', 'Pending'),
(4, 6, 12, '2025-05-25', '2025-05-27', 72000.00, '2025-05-15 12:46:15', '2025-05-18 10:49:43', 'Confirmed'),
(5, 6, 12, '2025-05-28', '2025-05-30', 72000.00, '2025-05-15 12:49:03', '2025-05-15 12:49:03', 'Pending'),
(6, 5, 10, '2025-05-26', '2025-05-27', 44000.00, '2025-05-15 13:03:26', '2025-05-15 13:03:26', 'Pending'),
(7, 5, 10, '2025-05-30', '2025-05-31', 44000.00, '2025-05-15 13:14:33', '2025-05-15 13:14:33', 'Pending'),
(8, 5, 10, '2025-06-06', '2025-06-06', 22000.00, '2025-05-15 13:19:24', '2025-05-15 13:19:24', 'Pending'),
(9, 7, 12, '2025-05-17', '2025-05-18', 48000.00, '2025-05-15 22:40:14', '2025-05-15 22:40:14', 'Pending'),
(10, 7, 13, '2025-05-17', '2025-05-18', 58000.00, '2025-05-16 00:30:10', '2025-05-16 00:30:10', 'Pending'),
(11, 6, 9, '2025-05-17', '2025-05-17', 3000.00, '2025-05-16 04:14:51', '2025-05-16 04:14:51', 'Pending'),
(12, 6, 17, '2025-05-23', '2025-05-24', 50000.00, '2025-05-17 00:34:00', '2025-05-17 00:34:00', 'Pending'),
(13, 6, 17, '2025-05-25', '2025-05-26', 50000.00, '2025-05-17 00:36:39', '2025-05-18 10:49:53', 'Cancelled'),
(14, 6, 14, '2025-06-01', '2025-06-02', 90000.00, '2025-05-17 00:42:15', '2025-05-17 00:42:15', 'Pending'),
(15, 8, 10, '2025-06-01', '2025-06-02', 4000.00, '2025-05-18 09:40:05', '2025-05-18 09:40:05', 'Pending'),
(16, 7, 13, '2025-05-19', '2025-05-20', 5800.00, '2025-05-18 09:41:49', '2025-05-18 09:41:49', 'Pending'),
(17, 7, 10, '2025-06-03', '2025-06-03', 2000.00, '2025-05-18 10:48:49', '2025-05-18 10:48:49', 'Pending'),
(18, 7, 10, '2025-06-04', '2025-06-04', 2000.00, '2025-05-18 11:08:20', '2025-05-18 11:08:20', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Flijd9nYOIxBYj5IxWDC2BmsDYyh5jYQRWARQ5c5', 6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:138.0) Gecko/20100101 Firefox/138.0', 'YTo0OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiTE5jam9KMlEyek1peHpKRDEwQlljcWdXdGpma1NUNExkWmoxbDBVNCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xpc3RDYXJzIjt9fQ==', 1747592438),
('lS7iY8KvQg6kt1NleEKMXSZ432rcgYBH1z9gOpqE', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTo0OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiTDR3ZFdtYnJkUlJiTzZpTTNlb1Q0N3h5aU1hbG9YdFdEOHdEOThXeCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6ODtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xpc3RSZW50YWxzIjt9fQ==', 1747582822);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Superman', 'super@example.com', '2025-05-11 07:43:29', '$2y$12$hUNYb2cXw5lULqATBfet6exv3rQgNwyouxZorykLyQf9xHvcZ4SLi', 'user', 'TXguvf7E0K0ozQc77GGRtsWMBYxKx76wGJrtc4YOGDvePC6AoQdO3giwGCvF', '2025-05-11 07:43:30', '2025-05-13 07:30:52'),
(6, 'Sarwar', 'sarwar3@gmail.com', NULL, '$2y$12$n7m2ly3dPgs5DSd7cNx5EOKdwC4pQZmzNopkZEws61uj0IgBknD0.', 'admin', NULL, '2025-05-12 09:56:59', '2025-05-12 09:56:59'),
(7, 'Shafin Sarwar', 'shafin@gmail.com', NULL, '$2y$12$LIGO/dLcYFxPCSgVrZGtl.C1crjCLZdf2oESqfQWLCcCt8uQSM0se', 'user', NULL, '2025-05-15 13:23:27', '2025-05-15 13:23:27'),
(8, 'Rakib', 'rakib@example.com', NULL, '$2y$12$n1CdGWHl.5MyYg/hGfgXs.bdPUByz650H4rN7HUXu5DWp9Yk4wdkG', 'user', NULL, '2025-05-18 09:39:26', '2025-05-18 09:39:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rentals_user_id_foreign` (`user_id`),
  ADD KEY `rentals_car_id_foreign` (`car_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rentals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
