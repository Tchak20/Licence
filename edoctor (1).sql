-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 24 avr. 2023 à 10:51
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `edoctor`
--

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `maladies`
--

CREATE TABLE `maladies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `nom_maladie` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `maladies`
--

INSERT INTO `maladies` (`id`, `image`, `nom_maladie`, `description`, `created_at`, `updated_at`) VALUES
(1, 'images/logo.jpeg', 'Adome', 'Libero quas saepe autem at. Expedita nihil eos sed sed qui cumque id.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(2, 'images/logo.jpeg', 'Paludisme', 'Ex et hic repudiandae. Autem eos nihil accusantium incidunt. Vitae quibusdam assumenda laudantium ut laudantium aperiam.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(3, 'images/logo.jpeg', 'Cancer', 'Et quo excepturi odio sit animi. Fugit consequatur et quasi voluptatem. Hic magni voluptas et nemo voluptas.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(4, 'images/logo.jpeg', 'Tuberculose', 'Voluptate dolorem totam sunt fuga. Quam enim necessitatibus enim aliquam dolores. Impedit magnam itaque ipsum ullam. Laboriosam aut maiores deleniti earum error.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(5, 'images/logo.jpeg', 'VIH', 'Ad nihil nihil ea illo animi non non. Incidunt fugit et assumenda consequatur aliquam excepturi quos. Ut in consequatur distinctio magni debitis alias.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(6, 'images/logo.jpeg', 'SIDA', 'Amet numquam illo voluptas. Adipisci doloremque dolorem voluptatem.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(7, 'images/logo.jpeg', 'ROX', 'Officia ex et ut corrupti necessitatibus nam. Dolore labore omnis quia et quisquam consequatur. Cupiditate ut velit et totam.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(8, 'images/logo.jpeg', 'Enzimer', 'Ut eum dolores quia. Optio fuga recusandae vel voluptatem. Sunt enim illo qui eos suscipit officia quaerat. Repellendus expedita tempora recusandae. Repellendus perferendis quasi quas ut aperiam.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(9, 'images/logo.jpeg', 'Cholera', 'Recusandae consequatur ex neque dolorem ipsa nobis dolorem. Id eos voluptatum omnis esse. Ab maiores cupiditate tenetur ullam ipsam.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(10, 'images/logo.jpeg', 'COVID-19', 'Aut omnis sit veritatis est ullam deleniti corporis. Omnis facere suscipit et amet porro. Est aut doloribus molestiae hic quisquam et aut. Consequatur ratione fuga maiores velit.', '2023-04-18 09:21:22', '2023-04-18 09:21:22');

-- --------------------------------------------------------

--
-- Structure de la table `maladies_symptomes`
--

CREATE TABLE `maladies_symptomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `maladies_id` bigint(20) UNSIGNED NOT NULL,
  `symptomes_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `maladies_symptomes`
--

INSERT INTO `maladies_symptomes` (`id`, `created_at`, `updated_at`, `maladies_id`, `symptomes_id`) VALUES
(1, NULL, NULL, 7, 1),
(2, NULL, NULL, 6, 1),
(3, NULL, NULL, 4, 1),
(4, NULL, NULL, 3, 1),
(5, NULL, NULL, 4, 2),
(6, NULL, NULL, 5, 2),
(7, NULL, NULL, 10, 2),
(8, NULL, NULL, 6, 2),
(9, NULL, NULL, 5, 3),
(10, NULL, NULL, 4, 3),
(11, NULL, NULL, 6, 3),
(12, NULL, NULL, 1, 3),
(13, NULL, NULL, 4, 4),
(14, NULL, NULL, 2, 4),
(15, NULL, NULL, 3, 4),
(16, NULL, NULL, 6, 5),
(17, NULL, NULL, 10, 5),
(18, NULL, NULL, 3, 6),
(19, NULL, NULL, 7, 6),
(20, NULL, NULL, 9, 7),
(21, NULL, NULL, 2, 7),
(22, NULL, NULL, 1, 7),
(23, NULL, NULL, 7, 8),
(24, NULL, NULL, 1, 8),
(25, NULL, NULL, 3, 9),
(26, NULL, NULL, 1, 9),
(27, NULL, NULL, 2, 9),
(28, NULL, NULL, 1, 10),
(29, NULL, NULL, 2, 11),
(30, NULL, NULL, 5, 12),
(31, NULL, NULL, 2, 12),
(32, NULL, NULL, 4, 12),
(33, NULL, NULL, 2, 13),
(34, NULL, NULL, 8, 13),
(35, NULL, NULL, 5, 13),
(36, NULL, NULL, 3, 13),
(37, NULL, NULL, 10, 14),
(38, NULL, NULL, 2, 14),
(39, NULL, NULL, 4, 15),
(40, NULL, NULL, 1, 15),
(41, NULL, NULL, 7, 16),
(42, NULL, NULL, 3, 16),
(43, NULL, NULL, 8, 16),
(44, NULL, NULL, 10, 16),
(45, NULL, NULL, 1, 17),
(46, NULL, NULL, 9, 18),
(47, NULL, NULL, 4, 18),
(48, NULL, NULL, 3, 19),
(49, NULL, NULL, 10, 20),
(50, NULL, NULL, 4, 20),
(51, NULL, NULL, 3, 20),
(52, NULL, NULL, 10, 21),
(53, NULL, NULL, 8, 21),
(54, NULL, NULL, 2, 22),
(55, NULL, NULL, 8, 22),
(56, NULL, NULL, 3, 23),
(57, NULL, NULL, 8, 23),
(58, NULL, NULL, 9, 24),
(59, NULL, NULL, 3, 25),
(60, NULL, NULL, 6, 25),
(61, NULL, NULL, 8, 25),
(62, NULL, NULL, 5, 26),
(63, NULL, NULL, 10, 26),
(64, NULL, NULL, 2, 26),
(65, NULL, NULL, 6, 26),
(66, NULL, NULL, 2, 27),
(67, NULL, NULL, 9, 27),
(68, NULL, NULL, 6, 27),
(69, NULL, NULL, 1, 27),
(70, NULL, NULL, 6, 28),
(71, NULL, NULL, 4, 28),
(72, NULL, NULL, 8, 28),
(73, NULL, NULL, 10, 29),
(74, NULL, NULL, 1, 29),
(75, NULL, NULL, 9, 29),
(76, NULL, NULL, 5, 30),
(77, NULL, NULL, 9, 30),
(78, NULL, NULL, 1, 30),
(80, NULL, NULL, 1, 31),
(81, NULL, NULL, 9, 31),
(82, NULL, NULL, 5, 32),
(83, NULL, NULL, 1, 32),
(84, NULL, NULL, 3, 33),
(85, NULL, NULL, 2, 33),
(86, NULL, NULL, 10, 34),
(87, NULL, NULL, 2, 34),
(88, NULL, NULL, 6, 35),
(89, NULL, NULL, 9, 36),
(90, NULL, NULL, 10, 37),
(91, NULL, NULL, 10, 38),
(92, NULL, NULL, 4, 38),
(93, NULL, NULL, 6, 38),
(94, NULL, NULL, 10, 39),
(95, NULL, NULL, 6, 39),
(96, NULL, NULL, 9, 39),
(97, NULL, NULL, 8, 39),
(98, NULL, NULL, 4, 40),
(99, NULL, NULL, 5, 40);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_04_18_081341_create_maladies_table', 1),
(6, '2023_04_18_081412_create_symptomes_table', 1),
(7, '2023_04_18_101238_create_maladies_symptomes_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `symptomes`
--

CREATE TABLE `symptomes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom_symptome` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `symptomes`
--

INSERT INTO `symptomes` (`id`, `nom_symptome`, `created_at`, `updated_at`) VALUES
(1, 'Velit expedita.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(2, 'Voluptatem distinctio.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(3, 'Quas beatae.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(4, 'Eos eveniet.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(5, 'Quas sint ut.', '2023-04-18 09:21:22', '2023-04-18 09:21:22'),
(6, 'Quo eaque occaecati.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(7, 'Quo qui a.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(8, 'Vero qui.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(9, 'Laboriosam corrupti.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(10, 'Voluptatibus ut dignissimos.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(11, 'Est ut.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(12, 'Explicabo sed.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(13, 'Cupiditate cumque.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(14, 'Ut rerum recusandae.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(15, 'Distinctio deleniti.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(16, 'Dolores ea.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(17, 'Accusamus alias.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(18, 'Libero similique.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(19, 'Quo sit cumque.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(20, 'Repellat qui quibusdam.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(21, 'Aliquam laborum culpa.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(22, 'Dolorum ut.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(23, 'Sunt maiores in.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(24, 'Omnis ratione accusamus.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(25, 'Omnis facilis vero.', '2023-04-18 09:21:23', '2023-04-18 09:21:23'),
(26, 'Et perspiciatis atque.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(27, 'Earum nesciunt quis.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(28, 'Et at ratione.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(29, 'Quibusdam occaecati et.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(30, 'Error consequatur non.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(31, 'Dolorem laborum nulla.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(32, 'Laudantium corporis assumenda.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(33, 'Cum est.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(34, 'Quod explicabo aut.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(35, 'Praesentium saepe adipisci.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(36, 'Id eveniet odio.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(37, 'Unde velit.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(38, 'Nobis aut quas.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(39, 'Similique rem incidunt.', '2023-04-18 09:21:24', '2023-04-18 09:21:24'),
(40, 'Et laboriosam.', '2023-04-18 09:21:24', '2023-04-18 09:21:24');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'yasmine', 'yasmine@gmail.c', NULL, '$2y$10$XLunSuqUGSA.yALABlC70efMvSV4CFm4o/v8YC2WOaaS1l3kgm2j2', NULL, '2023-04-18 17:52:28', '2023-04-18 17:52:28'),
(2, 'yasmine', 'yasmine@gmail.com', NULL, '$2y$10$gaFmG7rGkjX7dHqUPJKT9ux6sVY4uhR/4vEektYllHpRivQUZKeD.', NULL, '2023-04-18 17:52:42', '2023-04-18 17:52:42'),
(3, 'Isabelle', 'isabelle@gmail.com', NULL, '$2y$10$dL4qU5Ilsjs8Dy1NnBvCQuN9XCIAUImoWcdHwQaMMq.Djq9zmohlu', NULL, '2023-04-24 06:29:35', '2023-04-24 06:29:35'),
(4, 'rose', 'rose@gmail.com', NULL, '$2y$10$/vuPFHv3khGSvg.DGrz.zOc5xGLS9gL14AzBEb/NmIg/EOEERPAyi', NULL, '2023-04-24 06:33:24', '2023-04-24 06:33:24'),
(5, 'rose', 'rose2@gmail.com', NULL, '$2y$10$QmB9cy3bDQJ17UXY1km2sOzP6KBQ/y6P2.aVASHszFFosdJuXvbg.', NULL, '2023-04-24 06:38:36', '2023-04-24 06:38:36');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `maladies`
--
ALTER TABLE `maladies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `maladies_symptomes`
--
ALTER TABLE `maladies_symptomes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maladies_symptomes_maladies_id_foreign` (`maladies_id`),
  ADD KEY `maladies_symptomes_symptomes_id_foreign` (`symptomes_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `symptomes`
--
ALTER TABLE `symptomes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `maladies`
--
ALTER TABLE `maladies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `maladies_symptomes`
--
ALTER TABLE `maladies_symptomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `symptomes`
--
ALTER TABLE `symptomes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `maladies_symptomes`
--
ALTER TABLE `maladies_symptomes`
  ADD CONSTRAINT `maladies_symptomes_maladies_id_foreign` FOREIGN KEY (`maladies_id`) REFERENCES `maladies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maladies_symptomes_symptomes_id_foreign` FOREIGN KEY (`symptomes_id`) REFERENCES `symptomes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
