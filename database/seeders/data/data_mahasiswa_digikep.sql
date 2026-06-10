-- ============================================
-- DATA MASTER MAHASISWA - DigiKep
-- Sumber: data_mahasiswa_d3_keperawatan.xlsx
-- Politeknik Negeri Subang — D3 Keperawatan
-- Semester Genap 2025/2026 | Total: 366 mahasiswa
-- ============================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 1. CREATE TABLE mahasiswa
-- ============================================

CREATE TABLE IF NOT EXISTS `mahasiswa` (
    `id`         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `user_id`    BIGINT UNSIGNED NOT NULL UNIQUE,
    `nim`        VARCHAR(20) NOT NULL UNIQUE,
    `kelas`      VARCHAR(10) NULL,
    `semester`   TINYINT UNSIGNED NULL,
    `angkatan`   YEAR NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 2. INSERT INTO mahasiswa
--    Menggunakan subquery FK ke users.id berdasarkan nim_nip
-- ============================================

INSERT INTO `mahasiswa` (`user_id`, `nim`, `kelas`, `semester`, `angkatan`) VALUES
    ((SELECT id FROM `users` WHERE nim_nip = '10407001'), '10407001', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407006'), '10407006', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407011'), '10407011', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407016'), '10407016', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407021'), '10407021', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407026'), '10407026', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407036'), '10407036', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407041'), '10407041', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407046'), '10407046', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407051'), '10407051', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407056'), '10407056', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407061'), '10407061', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407066'), '10407066', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407071'), '10407071', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407076'), '10407076', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407081'), '10407081', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407086'), '10407086', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407091'), '10407091', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407096'), '10407096', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407101'), '10407101', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407106'), '10407106', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407111'), '10407111', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407116'), '10407116', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407121'), '10407121', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407126'), '10407126', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407131'), '10407131', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407136'), '10407136', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407141'), '10407141', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407146'), '10407146', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407151'), '10407151', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407156'), '10407156', '1A', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407002'), '10407002', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407007'), '10407007', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407012'), '10407012', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407017'), '10407017', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407022'), '10407022', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407027'), '10407027', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407032'), '10407032', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407037'), '10407037', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407042'), '10407042', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407047'), '10407047', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407052'), '10407052', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407057'), '10407057', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407062'), '10407062', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407067'), '10407067', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407072'), '10407072', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407082'), '10407082', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407087'), '10407087', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407092'), '10407092', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407097'), '10407097', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407102'), '10407102', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407107'), '10407107', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407112'), '10407112', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407117'), '10407117', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407122'), '10407122', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407127'), '10407127', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407132'), '10407132', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407137'), '10407137', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407142'), '10407142', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407147'), '10407147', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407152'), '10407152', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407157'), '10407157', '1B', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407003'), '10407003', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407008'), '10407008', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407013'), '10407013', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407023'), '10407023', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407028'), '10407028', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407033'), '10407033', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407038'), '10407038', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407043'), '10407043', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407048'), '10407048', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407053'), '10407053', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407058'), '10407058', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407063'), '10407063', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407068'), '10407068', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407073'), '10407073', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407078'), '10407078', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407083'), '10407083', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407088'), '10407088', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407093'), '10407093', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407098'), '10407098', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407103'), '10407103', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407108'), '10407108', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407113'), '10407113', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407118'), '10407118', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407123'), '10407123', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407128'), '10407128', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407133'), '10407133', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407138'), '10407138', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407143'), '10407143', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407148'), '10407148', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407153'), '10407153', '1C', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407004'), '10407004', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407009'), '10407009', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407014'), '10407014', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407019'), '10407019', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407024'), '10407024', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407029'), '10407029', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407034'), '10407034', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407039'), '10407039', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407044'), '10407044', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407049'), '10407049', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407054'), '10407054', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407059'), '10407059', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407064'), '10407064', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407069'), '10407069', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407074'), '10407074', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407079'), '10407079', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407084'), '10407084', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407089'), '10407089', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407094'), '10407094', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407099'), '10407099', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407104'), '10407104', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407109'), '10407109', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407114'), '10407114', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407119'), '10407119', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407124'), '10407124', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407129'), '10407129', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407134'), '10407134', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407139'), '10407139', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407144'), '10407144', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407149'), '10407149', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407154'), '10407154', '1D', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407005'), '10407005', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407010'), '10407010', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407015'), '10407015', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407020'), '10407020', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407025'), '10407025', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407030'), '10407030', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407035'), '10407035', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407040'), '10407040', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407045'), '10407045', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407050'), '10407050', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407055'), '10407055', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407060'), '10407060', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407065'), '10407065', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407070'), '10407070', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407075'), '10407075', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407080'), '10407080', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407085'), '10407085', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407095'), '10407095', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407100'), '10407100', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407105'), '10407105', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407110'), '10407110', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407115'), '10407115', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407120'), '10407120', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407125'), '10407125', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407130'), '10407130', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407135'), '10407135', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407140'), '10407140', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407145'), '10407145', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407150'), '10407150', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10407155'), '10407155', '1E', 1, 2025),
    ((SELECT id FROM `users` WHERE nim_nip = '10406001'), '10406001', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406005'), '10406005', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406009'), '10406009', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406013'), '10406013', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406017'), '10406017', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406021'), '10406021', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406025'), '10406025', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406029'), '10406029', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406033'), '10406033', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406037'), '10406037', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406041'), '10406041', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406045'), '10406045', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406049'), '10406049', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406053'), '10406053', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406057'), '10406057', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406061'), '10406061', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406065'), '10406065', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406069'), '10406069', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406073'), '10406073', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406077'), '10406077', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406085'), '10406085', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406089'), '10406089', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406093'), '10406093', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406097'), '10406097', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406101'), '10406101', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406105'), '10406105', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406109'), '10406109', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406117'), '10406117', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406121'), '10406121', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406125'), '10406125', '2A', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406002'), '10406002', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406006'), '10406006', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406010'), '10406010', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406014'), '10406014', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406018'), '10406018', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406022'), '10406022', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406026'), '10406026', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406030'), '10406030', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406034'), '10406034', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406038'), '10406038', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406042'), '10406042', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406050'), '10406050', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406054'), '10406054', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406058'), '10406058', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406066'), '10406066', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406070'), '10406070', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406074'), '10406074', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406078'), '10406078', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406082'), '10406082', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406086'), '10406086', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406090'), '10406090', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406094'), '10406094', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406098'), '10406098', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406102'), '10406102', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406106'), '10406106', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406110'), '10406110', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406114'), '10406114', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406118'), '10406118', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406122'), '10406122', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406126'), '10406126', '2B', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406003'), '10406003', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406011'), '10406011', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406015'), '10406015', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406019'), '10406019', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406023'), '10406023', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406027'), '10406027', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406031'), '10406031', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406035'), '10406035', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406039'), '10406039', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406043'), '10406043', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406051'), '10406051', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406055'), '10406055', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406059'), '10406059', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406063'), '10406063', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406067'), '10406067', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406071'), '10406071', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406075'), '10406075', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406079'), '10406079', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406083'), '10406083', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406091'), '10406091', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406095'), '10406095', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406099'), '10406099', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406103'), '10406103', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406107'), '10406107', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406111'), '10406111', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406115'), '10406115', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406119'), '10406119', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406123'), '10406123', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406127'), '10406127', '2C', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406004'), '10406004', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406008'), '10406008', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406012'), '10406012', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406016'), '10406016', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406020'), '10406020', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406024'), '10406024', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406028'), '10406028', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406032'), '10406032', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406036'), '10406036', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406040'), '10406040', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406044'), '10406044', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406048'), '10406048', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406052'), '10406052', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406056'), '10406056', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406064'), '10406064', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406072'), '10406072', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406076'), '10406076', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406080'), '10406080', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406084'), '10406084', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406088'), '10406088', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406092'), '10406092', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406096'), '10406096', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406100'), '10406100', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406104'), '10406104', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406108'), '10406108', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406112'), '10406112', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406116'), '10406116', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406124'), '10406124', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10406128'), '10406128', '2D', 3, 2024),
    ((SELECT id FROM `users` WHERE nim_nip = '10405001'), '10405001', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405007'), '10405007', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405010'), '10405010', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405013'), '10405013', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405016'), '10405016', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405019'), '10405019', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405022'), '10405022', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405025'), '10405025', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405028'), '10405028', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405031'), '10405031', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405034'), '10405034', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405037'), '10405037', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405040'), '10405040', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405043'), '10405043', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405046'), '10405046', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405049'), '10405049', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405052'), '10405052', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405055'), '10405055', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405058'), '10405058', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405061'), '10405061', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405064'), '10405064', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405067'), '10405067', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405070'), '10405070', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405073'), '10405073', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405076'), '10405076', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405079'), '10405079', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405082'), '10405082', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405085'), '10405085', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405088'), '10405088', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405091'), '10405091', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405094'), '10405094', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405097'), '10405097', '3A', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405002'), '10405002', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405008'), '10405008', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405011'), '10405011', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405014'), '10405014', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405017'), '10405017', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405020'), '10405020', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405023'), '10405023', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405026'), '10405026', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405029'), '10405029', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405032'), '10405032', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405035'), '10405035', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405038'), '10405038', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405041'), '10405041', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405044'), '10405044', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405047'), '10405047', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405050'), '10405050', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405053'), '10405053', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405056'), '10405056', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405059'), '10405059', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405062'), '10405062', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405065'), '10405065', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405068'), '10405068', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405071'), '10405071', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405074'), '10405074', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405077'), '10405077', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405080'), '10405080', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405083'), '10405083', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405086'), '10405086', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405089'), '10405089', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405092'), '10405092', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405095'), '10405095', '3B', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405003'), '10405003', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405006'), '10405006', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405009'), '10405009', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405012'), '10405012', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405015'), '10405015', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405018'), '10405018', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405021'), '10405021', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405024'), '10405024', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405027'), '10405027', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405030'), '10405030', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405033'), '10405033', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405036'), '10405036', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405039'), '10405039', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405042'), '10405042', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405045'), '10405045', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405048'), '10405048', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405051'), '10405051', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405054'), '10405054', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405057'), '10405057', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405060'), '10405060', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405063'), '10405063', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405066'), '10405066', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405069'), '10405069', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405072'), '10405072', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405075'), '10405075', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405078'), '10405078', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405081'), '10405081', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405084'), '10405084', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405087'), '10405087', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405090'), '10405090', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405093'), '10405093', '3C', 5, 2023),
    ((SELECT id FROM `users` WHERE nim_nip = '10405096'), '10405096', '3C', 5, 2023);

-- ============================================
-- 3. UPDATE email mahasiswa di tabel users
--    Format: namadepan.nim@student.polsub.ac.id
-- ============================================

UPDATE `users` SET `email` = 'aat.10407001@student.polsub.ac.id' WHERE `nim_nip` = '10407001';
UPDATE `users` SET `email` = 'alena.10407006@student.polsub.ac.id' WHERE `nim_nip` = '10407006';
UPDATE `users` SET `email` = 'alika.10407011@student.polsub.ac.id' WHERE `nim_nip` = '10407011';
UPDATE `users` SET `email` = 'amelia.10407016@student.polsub.ac.id' WHERE `nim_nip` = '10407016';
UPDATE `users` SET `email` = 'andri.10407021@student.polsub.ac.id' WHERE `nim_nip` = '10407021';
UPDATE `users` SET `email` = 'azrina.10407026@student.polsub.ac.id' WHERE `nim_nip` = '10407026';
UPDATE `users` SET `email` = 'devi.10407036@student.polsub.ac.id' WHERE `nim_nip` = '10407036';
UPDATE `users` SET `email` = 'dinie.10407041@student.polsub.ac.id' WHERE `nim_nip` = '10407041';
UPDATE `users` SET `email` = 'eva.10407046@student.polsub.ac.id' WHERE `nim_nip` = '10407046';
UPDATE `users` SET `email` = 'fika.10407051@student.polsub.ac.id' WHERE `nim_nip` = '10407051';
UPDATE `users` SET `email` = 'gina.10407056@student.polsub.ac.id' WHERE `nim_nip` = '10407056';
UPDATE `users` SET `email` = 'hany.10407061@student.polsub.ac.id' WHERE `nim_nip` = '10407061';
UPDATE `users` SET `email` = 'indri.10407066@student.polsub.ac.id' WHERE `nim_nip` = '10407066';
UPDATE `users` SET `email` = 'kirana.10407071@student.polsub.ac.id' WHERE `nim_nip` = '10407071';
UPDATE `users` SET `email` = 'm.10407076@student.polsub.ac.id' WHERE `nim_nip` = '10407076';
UPDATE `users` SET `email` = 'meisya.10407081@student.polsub.ac.id' WHERE `nim_nip` = '10407081';
UPDATE `users` SET `email` = 'mustika.10407086@student.polsub.ac.id' WHERE `nim_nip` = '10407086';
UPDATE `users` SET `email` = 'naurah.10407091@student.polsub.ac.id' WHERE `nim_nip` = '10407091';
UPDATE `users` SET `email` = 'nimatul.10407096@student.polsub.ac.id' WHERE `nim_nip` = '10407096';
UPDATE `users` SET `email` = 'novia.10407101@student.polsub.ac.id' WHERE `nim_nip` = '10407101';
UPDATE `users` SET `email` = 'puji.10407106@student.polsub.ac.id' WHERE `nim_nip` = '10407106';
UPDATE `users` SET `email` = 'rahmatul.10407111@student.polsub.ac.id' WHERE `nim_nip` = '10407111';
UPDATE `users` SET `email` = 'refina.10407116@student.polsub.ac.id' WHERE `nim_nip` = '10407116';
UPDATE `users` SET `email` = 'revania.10407121@student.polsub.ac.id' WHERE `nim_nip` = '10407121';
UPDATE `users` SET `email` = 'risya.10407126@student.polsub.ac.id' WHERE `nim_nip` = '10407126';
UPDATE `users` SET `email` = 'sazqia.10407131@student.polsub.ac.id' WHERE `nim_nip` = '10407131';
UPDATE `users` SET `email` = 'silvani.10407136@student.polsub.ac.id' WHERE `nim_nip` = '10407136';
UPDATE `users` SET `email` = 'susan.10407141@student.polsub.ac.id' WHERE `nim_nip` = '10407141';
UPDATE `users` SET `email` = 'tania.10407146@student.polsub.ac.id' WHERE `nim_nip` = '10407146';
UPDATE `users` SET `email` = 'winda.10407151@student.polsub.ac.id' WHERE `nim_nip` = '10407151';
UPDATE `users` SET `email` = 'zalva.10407156@student.polsub.ac.id' WHERE `nim_nip` = '10407156';
UPDATE `users` SET `email` = 'agisca.10407002@student.polsub.ac.id' WHERE `nim_nip` = '10407002';
UPDATE `users` SET `email` = 'ales.10407007@student.polsub.ac.id' WHERE `nim_nip` = '10407007';
UPDATE `users` SET `email` = 'alikha.10407012@student.polsub.ac.id' WHERE `nim_nip` = '10407012';
UPDATE `users` SET `email` = 'ana.10407017@student.polsub.ac.id' WHERE `nim_nip` = '10407017';
UPDATE `users` SET `email` = 'anggi.10407022@student.polsub.ac.id' WHERE `nim_nip` = '10407022';
UPDATE `users` SET `email` = 'baruna.10407027@student.polsub.ac.id' WHERE `nim_nip` = '10407027';
UPDATE `users` SET `email` = 'chicha.10407032@student.polsub.ac.id' WHERE `nim_nip` = '10407032';
UPDATE `users` SET `email` = 'dian.10407037@student.polsub.ac.id' WHERE `nim_nip` = '10407037';
UPDATE `users` SET `email` = 'dwi.10407042@student.polsub.ac.id' WHERE `nim_nip` = '10407042';
UPDATE `users` SET `email` = 'fachrul.10407047@student.polsub.ac.id' WHERE `nim_nip` = '10407047';
UPDATE `users` SET `email` = 'firda.10407052@student.polsub.ac.id' WHERE `nim_nip` = '10407052';
UPDATE `users` SET `email` = 'gita.10407057@student.polsub.ac.id' WHERE `nim_nip` = '10407057';
UPDATE `users` SET `email` = 'hazimah.10407062@student.polsub.ac.id' WHERE `nim_nip` = '10407062';
UPDATE `users` SET `email` = 'insiyat.10407067@student.polsub.ac.id' WHERE `nim_nip` = '10407067';
UPDATE `users` SET `email` = 'kurniawati.10407072@student.polsub.ac.id' WHERE `nim_nip` = '10407072';
UPDATE `users` SET `email` = 'meita.10407082@student.polsub.ac.id' WHERE `nim_nip` = '10407082';
UPDATE `users` SET `email` = 'mutiara.10407087@student.polsub.ac.id' WHERE `nim_nip` = '10407087';
UPDATE `users` SET `email` = 'naya.10407092@student.polsub.ac.id' WHERE `nim_nip` = '10407092';
UPDATE `users` SET `email` = 'ningrumsari.10407097@student.polsub.ac.id' WHERE `nim_nip` = '10407097';
UPDATE `users` SET `email` = 'nuzma.10407102@student.polsub.ac.id' WHERE `nim_nip` = '10407102';
UPDATE `users` SET `email` = 'putri.10407107@student.polsub.ac.id' WHERE `nim_nip` = '10407107';
UPDATE `users` SET `email` = 'rasya.10407112@student.polsub.ac.id' WHERE `nim_nip` = '10407112';
UPDATE `users` SET `email` = 'rena.10407117@student.polsub.ac.id' WHERE `nim_nip` = '10407117';
UPDATE `users` SET `email` = 'revty.10407122@student.polsub.ac.id' WHERE `nim_nip` = '10407122';
UPDATE `users` SET `email` = 'rizqi.10407127@student.polsub.ac.id' WHERE `nim_nip` = '10407127';
UPDATE `users` SET `email` = 'selfiana.10407132@student.polsub.ac.id' WHERE `nim_nip` = '10407132';
UPDATE `users` SET `email` = 'siska.10407137@student.polsub.ac.id' WHERE `nim_nip` = '10407137';
UPDATE `users` SET `email` = 'syahira.10407142@student.polsub.ac.id' WHERE `nim_nip` = '10407142';
UPDATE `users` SET `email` = 'tayudin.10407147@student.polsub.ac.id' WHERE `nim_nip` = '10407147';
UPDATE `users` SET `email` = 'windi.10407152@student.polsub.ac.id' WHERE `nim_nip` = '10407152';
UPDATE `users` SET `email` = 'zulfa.10407157@student.polsub.ac.id' WHERE `nim_nip` = '10407157';
UPDATE `users` SET `email` = 'agista.10407003@student.polsub.ac.id' WHERE `nim_nip` = '10407003';
UPDATE `users` SET `email` = 'alexca.10407008@student.polsub.ac.id' WHERE `nim_nip` = '10407008';
UPDATE `users` SET `email` = 'aliyah.10407013@student.polsub.ac.id' WHERE `nim_nip` = '10407013';
UPDATE `users` SET `email` = 'anggia.10407023@student.polsub.ac.id' WHERE `nim_nip` = '10407023';
UPDATE `users` SET `email` = 'bunga.10407028@student.polsub.ac.id' WHERE `nim_nip` = '10407028';
UPDATE `users` SET `email` = 'clarissa.10407033@student.polsub.ac.id' WHERE `nim_nip` = '10407033';
UPDATE `users` SET `email` = 'dian.10407038@student.polsub.ac.id' WHERE `nim_nip` = '10407038';
UPDATE `users` SET `email` = 'elsa.10407043@student.polsub.ac.id' WHERE `nim_nip` = '10407043';
UPDATE `users` SET `email` = 'farah.10407048@student.polsub.ac.id' WHERE `nim_nip` = '10407048';
UPDATE `users` SET `email` = 'frisci.10407053@student.polsub.ac.id' WHERE `nim_nip` = '10407053';
UPDATE `users` SET `email` = 'hafsah.10407058@student.polsub.ac.id' WHERE `nim_nip` = '10407058';
UPDATE `users` SET `email` = 'heksa.10407063@student.polsub.ac.id' WHERE `nim_nip` = '10407063';
UPDATE `users` SET `email` = 'intan.10407068@student.polsub.ac.id' WHERE `nim_nip` = '10407068';
UPDATE `users` SET `email` = 'lea.10407073@student.polsub.ac.id' WHERE `nim_nip` = '10407073';
UPDATE `users` SET `email` = 'mardiah.10407078@student.polsub.ac.id' WHERE `nim_nip` = '10407078';
UPDATE `users` SET `email` = 'melvi.10407083@student.polsub.ac.id' WHERE `nim_nip` = '10407083';
UPDATE `users` SET `email` = 'nadine.10407088@student.polsub.ac.id' WHERE `nim_nip` = '10407088';
UPDATE `users` SET `email` = 'nazwa.10407093@student.polsub.ac.id' WHERE `nim_nip` = '10407093';
UPDATE `users` SET `email` = 'nissa.10407098@student.polsub.ac.id' WHERE `nim_nip` = '10407098';
UPDATE `users` SET `email` = 'nysrina.10407103@student.polsub.ac.id' WHERE `nim_nip` = '10407103';
UPDATE `users` SET `email` = 'putri.10407108@student.polsub.ac.id' WHERE `nim_nip` = '10407108';
UPDATE `users` SET `email` = 'ratna.10407113@student.polsub.ac.id' WHERE `nim_nip` = '10407113';
UPDATE `users` SET `email` = 'renita.10407118@student.polsub.ac.id' WHERE `nim_nip` = '10407118';
UPDATE `users` SET `email` = 'rezkiyani.10407123@student.polsub.ac.id' WHERE `nim_nip` = '10407123';
UPDATE `users` SET `email` = 'saila.10407128@student.polsub.ac.id' WHERE `nim_nip` = '10407128';
UPDATE `users` SET `email` = 'selvia.10407133@student.polsub.ac.id' WHERE `nim_nip` = '10407133';
UPDATE `users` SET `email` = 'siti.10407138@student.polsub.ac.id' WHERE `nim_nip` = '10407138';
UPDATE `users` SET `email` = 'syaikh.10407143@student.polsub.ac.id' WHERE `nim_nip` = '10407143';
UPDATE `users` SET `email` = 'tiara.10407148@student.polsub.ac.id' WHERE `nim_nip` = '10407148';
UPDATE `users` SET `email` = 'yulianti.10407153@student.polsub.ac.id' WHERE `nim_nip` = '10407153';
UPDATE `users` SET `email` = 'agni.10407004@student.polsub.ac.id' WHERE `nim_nip` = '10407004';
UPDATE `users` SET `email` = 'alfha.10407009@student.polsub.ac.id' WHERE `nim_nip` = '10407009';
UPDATE `users` SET `email` = 'alsya.10407014@student.polsub.ac.id' WHERE `nim_nip` = '10407014';
UPDATE `users` SET `email` = 'andhini.10407019@student.polsub.ac.id' WHERE `nim_nip` = '10407019';
UPDATE `users` SET `email` = 'anisa.10407024@student.polsub.ac.id' WHERE `nim_nip` = '10407024';
UPDATE `users` SET `email` = 'cahaya.10407029@student.polsub.ac.id' WHERE `nim_nip` = '10407029';
UPDATE `users` SET `email` = 'cut.10407034@student.polsub.ac.id' WHERE `nim_nip` = '10407034';
UPDATE `users` SET `email` = 'dinar.10407039@student.polsub.ac.id' WHERE `nim_nip` = '10407039';
UPDATE `users` SET `email` = 'esti.10407044@student.polsub.ac.id' WHERE `nim_nip` = '10407044';
UPDATE `users` SET `email` = 'farhan.10407049@student.polsub.ac.id' WHERE `nim_nip` = '10407049';
UPDATE `users` SET `email` = 'fuzy.10407054@student.polsub.ac.id' WHERE `nim_nip` = '10407054';
UPDATE `users` SET `email` = 'handika.10407059@student.polsub.ac.id' WHERE `nim_nip` = '10407059';
UPDATE `users` SET `email` = 'helena.10407064@student.polsub.ac.id' WHERE `nim_nip` = '10407064';
UPDATE `users` SET `email` = 'intan.10407069@student.polsub.ac.id' WHERE `nim_nip` = '10407069';
UPDATE `users` SET `email` = 'lizelit.10407074@student.polsub.ac.id' WHERE `nim_nip` = '10407074';
UPDATE `users` SET `email` = 'mares.10407079@student.polsub.ac.id' WHERE `nim_nip` = '10407079';
UPDATE `users` SET `email` = 'moulidya.10407084@student.polsub.ac.id' WHERE `nim_nip` = '10407084';
UPDATE `users` SET `email` = 'nagita.10407089@student.polsub.ac.id' WHERE `nim_nip` = '10407089';
UPDATE `users` SET `email` = 'neilan.10407094@student.polsub.ac.id' WHERE `nim_nip` = '10407094';
UPDATE `users` SET `email` = 'nita.10407099@student.polsub.ac.id' WHERE `nim_nip` = '10407099';
UPDATE `users` SET `email` = 'panji.10407104@student.polsub.ac.id' WHERE `nim_nip` = '10407104';
UPDATE `users` SET `email` = 'rahmah.10407109@student.polsub.ac.id' WHERE `nim_nip` = '10407109';
UPDATE `users` SET `email` = 'ratna.10407114@student.polsub.ac.id' WHERE `nim_nip` = '10407114';
UPDATE `users` SET `email` = 'resta.10407119@student.polsub.ac.id' WHERE `nim_nip` = '10407119';
UPDATE `users` SET `email` = 'riska.10407124@student.polsub.ac.id' WHERE `nim_nip` = '10407124';
UPDATE `users` SET `email` = 'salsabila.10407129@student.polsub.ac.id' WHERE `nim_nip` = '10407129';
UPDATE `users` SET `email` = 'septiani.10407134@student.polsub.ac.id' WHERE `nim_nip` = '10407134';
UPDATE `users` SET `email` = 'siwi.10407139@student.polsub.ac.id' WHERE `nim_nip` = '10407139';
UPDATE `users` SET `email` = 'syifa.10407144@student.polsub.ac.id' WHERE `nim_nip` = '10407144';
UPDATE `users` SET `email` = 'versa.10407149@student.polsub.ac.id' WHERE `nim_nip` = '10407149';
UPDATE `users` SET `email` = 'yuni.10407154@student.polsub.ac.id' WHERE `nim_nip` = '10407154';
UPDATE `users` SET `email` = 'agnia.10407005@student.polsub.ac.id' WHERE `nim_nip` = '10407005';
UPDATE `users` SET `email` = 'alfira.10407010@student.polsub.ac.id' WHERE `nim_nip` = '10407010';
UPDATE `users` SET `email` = 'alya.10407015@student.polsub.ac.id' WHERE `nim_nip` = '10407015';
UPDATE `users` SET `email` = 'andina.10407020@student.polsub.ac.id' WHERE `nim_nip` = '10407020';
UPDATE `users` SET `email` = 'annisa.10407025@student.polsub.ac.id' WHERE `nim_nip` = '10407025';
UPDATE `users` SET `email` = 'cantika.10407030@student.polsub.ac.id' WHERE `nim_nip` = '10407030';
UPDATE `users` SET `email` = 'daryatul.10407035@student.polsub.ac.id' WHERE `nim_nip` = '10407035';
UPDATE `users` SET `email` = 'dinda.10407040@student.polsub.ac.id' WHERE `nim_nip` = '10407040';
UPDATE `users` SET `email` = 'esty.10407045@student.polsub.ac.id' WHERE `nim_nip` = '10407045';
UPDATE `users` SET `email` = 'fifi.10407050@student.polsub.ac.id' WHERE `nim_nip` = '10407050';
UPDATE `users` SET `email` = 'giazi.10407055@student.polsub.ac.id' WHERE `nim_nip` = '10407055';
UPDATE `users` SET `email` = 'hanufah.10407060@student.polsub.ac.id' WHERE `nim_nip` = '10407060';
UPDATE `users` SET `email` = 'icha.10407065@student.polsub.ac.id' WHERE `nim_nip` = '10407065';
UPDATE `users` SET `email` = 'khairun.10407070@student.polsub.ac.id' WHERE `nim_nip` = '10407070';
UPDATE `users` SET `email` = 'lulu.10407075@student.polsub.ac.id' WHERE `nim_nip` = '10407075';
UPDATE `users` SET `email` = 'maulinda.10407080@student.polsub.ac.id' WHERE `nim_nip` = '10407080';
UPDATE `users` SET `email` = 'muhamad.10407085@student.polsub.ac.id' WHERE `nim_nip` = '10407085';
UPDATE `users` SET `email` = 'nida.10407095@student.polsub.ac.id' WHERE `nim_nip` = '10407095';
UPDATE `users` SET `email` = 'nova.10407100@student.polsub.ac.id' WHERE `nim_nip` = '10407100';
UPDATE `users` SET `email` = 'pipik.10407105@student.polsub.ac.id' WHERE `nim_nip` = '10407105';
UPDATE `users` SET `email` = 'rahmatunissa.10407110@student.polsub.ac.id' WHERE `nim_nip` = '10407110';
UPDATE `users` SET `email` = 'rd.10407115@student.polsub.ac.id' WHERE `nim_nip` = '10407115';
UPDATE `users` SET `email` = 'reva.10407120@student.polsub.ac.id' WHERE `nim_nip` = '10407120';
UPDATE `users` SET `email` = 'riska.10407125@student.polsub.ac.id' WHERE `nim_nip` = '10407125';
UPDATE `users` SET `email` = 'sarah.10407130@student.polsub.ac.id' WHERE `nim_nip` = '10407130';
UPDATE `users` SET `email` = 'shaquille.10407135@student.polsub.ac.id' WHERE `nim_nip` = '10407135';
UPDATE `users` SET `email` = 'sulekha.10407140@student.polsub.ac.id' WHERE `nim_nip` = '10407140';
UPDATE `users` SET `email` = 'syifa.10407145@student.polsub.ac.id' WHERE `nim_nip` = '10407145';
UPDATE `users` SET `email` = 'winda.10407150@student.polsub.ac.id' WHERE `nim_nip` = '10407150';
UPDATE `users` SET `email` = 'zahra.10407155@student.polsub.ac.id' WHERE `nim_nip` = '10407155';
UPDATE `users` SET `email` = 'abyu.10406001@student.polsub.ac.id' WHERE `nim_nip` = '10406001';
UPDATE `users` SET `email` = 'allifia.10406005@student.polsub.ac.id' WHERE `nim_nip` = '10406005';
UPDATE `users` SET `email` = 'ananda.10406009@student.polsub.ac.id' WHERE `nim_nip` = '10406009';
UPDATE `users` SET `email` = 'annisa.10406013@student.polsub.ac.id' WHERE `nim_nip` = '10406013';
UPDATE `users` SET `email` = 'chindy.10406017@student.polsub.ac.id' WHERE `nim_nip` = '10406017';
UPDATE `users` SET `email` = 'dewanda.10406021@student.polsub.ac.id' WHERE `nim_nip` = '10406021';
UPDATE `users` SET `email` = 'dinar.10406025@student.polsub.ac.id' WHERE `nim_nip` = '10406025';
UPDATE `users` SET `email` = 'elza.10406029@student.polsub.ac.id' WHERE `nim_nip` = '10406029';
UPDATE `users` SET `email` = 'eva.10406033@student.polsub.ac.id' WHERE `nim_nip` = '10406033';
UPDATE `users` SET `email` = 'fitri.10406037@student.polsub.ac.id' WHERE `nim_nip` = '10406037';
UPDATE `users` SET `email` = 'hasbi.10406041@student.polsub.ac.id' WHERE `nim_nip` = '10406041';
UPDATE `users` SET `email` = 'imeldha.10406045@student.polsub.ac.id' WHERE `nim_nip` = '10406045';
UPDATE `users` SET `email` = 'japa.10406049@student.polsub.ac.id' WHERE `nim_nip` = '10406049';
UPDATE `users` SET `email` = 'kartika.10406053@student.polsub.ac.id' WHERE `nim_nip` = '10406053';
UPDATE `users` SET `email` = 'ledy.10406057@student.polsub.ac.id' WHERE `nim_nip` = '10406057';
UPDATE `users` SET `email` = 'm.10406061@student.polsub.ac.id' WHERE `nim_nip` = '10406061';
UPDATE `users` SET `email` = 'mira.10406065@student.polsub.ac.id' WHERE `nim_nip` = '10406065';
UPDATE `users` SET `email` = 'naila.10406069@student.polsub.ac.id' WHERE `nim_nip` = '10406069';
UPDATE `users` SET `email` = 'nazma.10406073@student.polsub.ac.id' WHERE `nim_nip` = '10406073';
UPDATE `users` SET `email` = 'oriza.10406077@student.polsub.ac.id' WHERE `nim_nip` = '10406077';
UPDATE `users` SET `email` = 'putri.10406085@student.polsub.ac.id' WHERE `nim_nip` = '10406085';
UPDATE `users` SET `email` = 'reza.10406089@student.polsub.ac.id' WHERE `nim_nip` = '10406089';
UPDATE `users` SET `email` = 'rima.10406093@student.polsub.ac.id' WHERE `nim_nip` = '10406093';
UPDATE `users` SET `email` = 'rizky.10406097@student.polsub.ac.id' WHERE `nim_nip` = '10406097';
UPDATE `users` SET `email` = 'salsha.10406101@student.polsub.ac.id' WHERE `nim_nip` = '10406101';
UPDATE `users` SET `email` = 'shintia.10406105@student.polsub.ac.id' WHERE `nim_nip` = '10406105';
UPDATE `users` SET `email` = 'siti.10406109@student.polsub.ac.id' WHERE `nim_nip` = '10406109';
UPDATE `users` SET `email` = 'susi.10406117@student.polsub.ac.id' WHERE `nim_nip` = '10406117';
UPDATE `users` SET `email` = 'tiara.10406121@student.polsub.ac.id' WHERE `nim_nip` = '10406121';
UPDATE `users` SET `email` = 'wida.10406125@student.polsub.ac.id' WHERE `nim_nip` = '10406125';
UPDATE `users` SET `email` = 'adela.10406002@student.polsub.ac.id' WHERE `nim_nip` = '10406002';
UPDATE `users` SET `email` = 'alya.10406006@student.polsub.ac.id' WHERE `nim_nip` = '10406006';
UPDATE `users` SET `email` = 'andini.10406010@student.polsub.ac.id' WHERE `nim_nip` = '10406010';
UPDATE `users` SET `email` = 'asyura.10406014@student.polsub.ac.id' WHERE `nim_nip` = '10406014';
UPDATE `users` SET `email` = 'daffa.10406018@student.polsub.ac.id' WHERE `nim_nip` = '10406018';
UPDATE `users` SET `email` = 'dewangga.10406022@student.polsub.ac.id' WHERE `nim_nip` = '10406022';
UPDATE `users` SET `email` = 'dinda.10406026@student.polsub.ac.id' WHERE `nim_nip` = '10406026';
UPDATE `users` SET `email` = 'erin.10406030@student.polsub.ac.id' WHERE `nim_nip` = '10406030';
UPDATE `users` SET `email` = 'fanny.10406034@student.polsub.ac.id' WHERE `nim_nip` = '10406034';
UPDATE `users` SET `email` = 'fitria.10406038@student.polsub.ac.id' WHERE `nim_nip` = '10406038';
UPDATE `users` SET `email` = 'heny.10406042@student.polsub.ac.id' WHERE `nim_nip` = '10406042';
UPDATE `users` SET `email` = 'jesika.10406050@student.polsub.ac.id' WHERE `nim_nip` = '10406050';
UPDATE `users` SET `email` = 'keysa.10406054@student.polsub.ac.id' WHERE `nim_nip` = '10406054';
UPDATE `users` SET `email` = 'leptia.10406058@student.polsub.ac.id' WHERE `nim_nip` = '10406058';
UPDATE `users` SET `email` = 'muhammad.10406066@student.polsub.ac.id' WHERE `nim_nip` = '10406066';
UPDATE `users` SET `email` = 'nailla.10406070@student.polsub.ac.id' WHERE `nim_nip` = '10406070';
UPDATE `users` SET `email` = 'niken.10406074@student.polsub.ac.id' WHERE `nim_nip` = '10406074';
UPDATE `users` SET `email` = 'oca.10406078@student.polsub.ac.id' WHERE `nim_nip` = '10406078';
UPDATE `users` SET `email` = 'putri.10406082@student.polsub.ac.id' WHERE `nim_nip` = '10406082';
UPDATE `users` SET `email` = 'rafflesia.10406086@student.polsub.ac.id' WHERE `nim_nip` = '10406086';
UPDATE `users` SET `email` = 'riang.10406090@student.polsub.ac.id' WHERE `nim_nip` = '10406090';
UPDATE `users` SET `email` = 'riska.10406094@student.polsub.ac.id' WHERE `nim_nip` = '10406094';
UPDATE `users` SET `email` = 'sadrina.10406098@student.polsub.ac.id' WHERE `nim_nip` = '10406098';
UPDATE `users` SET `email` = 'salwa.10406102@student.polsub.ac.id' WHERE `nim_nip` = '10406102';
UPDATE `users` SET `email` = 'shovia.10406106@student.polsub.ac.id' WHERE `nim_nip` = '10406106';
UPDATE `users` SET `email` = 'siti.10406110@student.polsub.ac.id' WHERE `nim_nip` = '10406110';
UPDATE `users` SET `email` = 'sri.10406114@student.polsub.ac.id' WHERE `nim_nip` = '10406114';
UPDATE `users` SET `email` = 'syahril.10406118@student.polsub.ac.id' WHERE `nim_nip` = '10406118';
UPDATE `users` SET `email` = 'vinka.10406122@student.polsub.ac.id' WHERE `nim_nip` = '10406122';
UPDATE `users` SET `email` = 'wina.10406126@student.polsub.ac.id' WHERE `nim_nip` = '10406126';
UPDATE `users` SET `email` = 'ahmad.10406003@student.polsub.ac.id' WHERE `nim_nip` = '10406003';
UPDATE `users` SET `email` = 'anindya.10406011@student.polsub.ac.id' WHERE `nim_nip` = '10406011';
UPDATE `users` SET `email` = 'aulia.10406015@student.polsub.ac.id' WHERE `nim_nip` = '10406015';
UPDATE `users` SET `email` = 'delima.10406019@student.polsub.ac.id' WHERE `nim_nip` = '10406019';
UPDATE `users` SET `email` = 'dewi.10406023@student.polsub.ac.id' WHERE `nim_nip` = '10406023';
UPDATE `users` SET `email` = 'dzurotunnafisah.10406027@student.polsub.ac.id' WHERE `nim_nip` = '10406027';
UPDATE `users` SET `email` = 'erlinda.10406031@student.polsub.ac.id' WHERE `nim_nip` = '10406031';
UPDATE `users` SET `email` = 'fatimatun.10406035@student.polsub.ac.id' WHERE `nim_nip` = '10406035';
UPDATE `users` SET `email` = 'gina.10406039@student.polsub.ac.id' WHERE `nim_nip` = '10406039';
UPDATE `users` SET `email` = 'iknaya.10406043@student.polsub.ac.id' WHERE `nim_nip` = '10406043';
UPDATE `users` SET `email` = 'kamila.10406051@student.polsub.ac.id' WHERE `nim_nip` = '10406051';
UPDATE `users` SET `email` = 'khairina.10406055@student.polsub.ac.id' WHERE `nim_nip` = '10406055';
UPDATE `users` SET `email` = 'lubna.10406059@student.polsub.ac.id' WHERE `nim_nip` = '10406059';
UPDATE `users` SET `email` = 'melinda.10406063@student.polsub.ac.id' WHERE `nim_nip` = '10406063';
UPDATE `users` SET `email` = 'nabila.10406067@student.polsub.ac.id' WHERE `nim_nip` = '10406067';
UPDATE `users` SET `email` = 'nasyifa.10406071@student.polsub.ac.id' WHERE `nim_nip` = '10406071';
UPDATE `users` SET `email` = 'niki.10406075@student.polsub.ac.id' WHERE `nim_nip` = '10406075';
UPDATE `users` SET `email` = 'pebi.10406079@student.polsub.ac.id' WHERE `nim_nip` = '10406079';
UPDATE `users` SET `email` = 'putri.10406083@student.polsub.ac.id' WHERE `nim_nip` = '10406083';
UPDATE `users` SET `email` = 'rida.10406091@student.polsub.ac.id' WHERE `nim_nip` = '10406091';
UPDATE `users` SET `email` = 'risma.10406095@student.polsub.ac.id' WHERE `nim_nip` = '10406095';
UPDATE `users` SET `email` = 'saffanah.10406099@student.polsub.ac.id' WHERE `nim_nip` = '10406099';
UPDATE `users` SET `email` = 'sandra.10406103@student.polsub.ac.id' WHERE `nim_nip` = '10406103';
UPDATE `users` SET `email` = 'silvi.10406107@student.polsub.ac.id' WHERE `nim_nip` = '10406107';
UPDATE `users` SET `email` = 'siti.10406111@student.polsub.ac.id' WHERE `nim_nip` = '10406111';
UPDATE `users` SET `email` = 'suci.10406115@student.polsub.ac.id' WHERE `nim_nip` = '10406115';
UPDATE `users` SET `email` = 'syaima.10406119@student.polsub.ac.id' WHERE `nim_nip` = '10406119';
UPDATE `users` SET `email` = 'virsha.10406123@student.polsub.ac.id' WHERE `nim_nip` = '10406123';
UPDATE `users` SET `email` = 'yusuf.10406127@student.polsub.ac.id' WHERE `nim_nip` = '10406127';
UPDATE `users` SET `email` = 'akmal.10406004@student.polsub.ac.id' WHERE `nim_nip` = '10406004';
UPDATE `users` SET `email` = 'amelia.10406008@student.polsub.ac.id' WHERE `nim_nip` = '10406008';
UPDATE `users` SET `email` = 'anisa.10406012@student.polsub.ac.id' WHERE `nim_nip` = '10406012';
UPDATE `users` SET `email` = 'azkca.10406016@student.polsub.ac.id' WHERE `nim_nip` = '10406016';
UPDATE `users` SET `email` = 'devya.10406020@student.polsub.ac.id' WHERE `nim_nip` = '10406020';
UPDATE `users` SET `email` = 'diana.10406024@student.polsub.ac.id' WHERE `nim_nip` = '10406024';
UPDATE `users` SET `email` = 'eka.10406028@student.polsub.ac.id' WHERE `nim_nip` = '10406028';
UPDATE `users` SET `email` = 'eva.10406032@student.polsub.ac.id' WHERE `nim_nip` = '10406032';
UPDATE `users` SET `email` = 'firdaus.10406036@student.polsub.ac.id' WHERE `nim_nip` = '10406036';
UPDATE `users` SET `email` = 'gina.10406040@student.polsub.ac.id' WHERE `nim_nip` = '10406040';
UPDATE `users` SET `email` = 'ilmiyatul.10406044@student.polsub.ac.id' WHERE `nim_nip` = '10406044';
UPDATE `users` SET `email` = 'ita.10406048@student.polsub.ac.id' WHERE `nim_nip` = '10406048';
UPDATE `users` SET `email` = 'kardila.10406052@student.polsub.ac.id' WHERE `nim_nip` = '10406052';
UPDATE `users` SET `email` = 'laila.10406056@student.polsub.ac.id' WHERE `nim_nip` = '10406056';
UPDATE `users` SET `email` = 'mila.10406064@student.polsub.ac.id' WHERE `nim_nip` = '10406064';
UPDATE `users` SET `email` = 'nasywa.10406072@student.polsub.ac.id' WHERE `nim_nip` = '10406072';
UPDATE `users` SET `email` = 'nonok.10406076@student.polsub.ac.id' WHERE `nim_nip` = '10406076';
UPDATE `users` SET `email` = 'puti.10406080@student.polsub.ac.id' WHERE `nim_nip` = '10406080';
UPDATE `users` SET `email` = 'putri.10406084@student.polsub.ac.id' WHERE `nim_nip` = '10406084';
UPDATE `users` SET `email` = 'ratna.10406088@student.polsub.ac.id' WHERE `nim_nip` = '10406088';
UPDATE `users` SET `email` = 'ridha.10406092@student.polsub.ac.id' WHERE `nim_nip` = '10406092';
UPDATE `users` SET `email` = 'rizki.10406096@student.polsub.ac.id' WHERE `nim_nip` = '10406096';
UPDATE `users` SET `email` = 'salsabila.10406100@student.polsub.ac.id' WHERE `nim_nip` = '10406100';
UPDATE `users` SET `email` = 'sherlina.10406104@student.polsub.ac.id' WHERE `nim_nip` = '10406104';
UPDATE `users` SET `email` = 'silvia.10406108@student.polsub.ac.id' WHERE `nim_nip` = '10406108';
UPDATE `users` SET `email` = 'sopi.10406112@student.polsub.ac.id' WHERE `nim_nip` = '10406112';
UPDATE `users` SET `email` = 'suci.10406116@student.polsub.ac.id' WHERE `nim_nip` = '10406116';
UPDATE `users` SET `email` = 'webi.10406124@student.polsub.ac.id' WHERE `nim_nip` = '10406124';
UPDATE `users` SET `email` = 'zihan.10406128@student.polsub.ac.id' WHERE `nim_nip` = '10406128';
UPDATE `users` SET `email` = 'abdul.10405001@student.polsub.ac.id' WHERE `nim_nip` = '10405001';
UPDATE `users` SET `email` = 'aisyah.10405007@student.polsub.ac.id' WHERE `nim_nip` = '10405007';
UPDATE `users` SET `email` = 'amanda.10405010@student.polsub.ac.id' WHERE `nim_nip` = '10405010';
UPDATE `users` SET `email` = 'anisa.10405013@student.polsub.ac.id' WHERE `nim_nip` = '10405013';
UPDATE `users` SET `email` = 'annisa.10405016@student.polsub.ac.id' WHERE `nim_nip` = '10405016';
UPDATE `users` SET `email` = 'astri.10405019@student.polsub.ac.id' WHERE `nim_nip` = '10405019';
UPDATE `users` SET `email` = 'aullia.10405022@student.polsub.ac.id' WHERE `nim_nip` = '10405022';
UPDATE `users` SET `email` = 'candra.10405025@student.polsub.ac.id' WHERE `nim_nip` = '10405025';
UPDATE `users` SET `email` = 'dilla.10405028@student.polsub.ac.id' WHERE `nim_nip` = '10405028';
UPDATE `users` SET `email` = 'erica.10405031@student.polsub.ac.id' WHERE `nim_nip` = '10405031';
UPDATE `users` SET `email` = 'fanny.10405034@student.polsub.ac.id' WHERE `nim_nip` = '10405034';
UPDATE `users` SET `email` = 'ghina.10405037@student.polsub.ac.id' WHERE `nim_nip` = '10405037';
UPDATE `users` SET `email` = 'halimah.10405040@student.polsub.ac.id' WHERE `nim_nip` = '10405040';
UPDATE `users` SET `email` = 'iis.10405043@student.polsub.ac.id' WHERE `nim_nip` = '10405043';
UPDATE `users` SET `email` = 'khania.10405046@student.polsub.ac.id' WHERE `nim_nip` = '10405046';
UPDATE `users` SET `email` = 'lisiana.10405049@student.polsub.ac.id' WHERE `nim_nip` = '10405049';
UPDATE `users` SET `email` = 'mega.10405052@student.polsub.ac.id' WHERE `nim_nip` = '10405052';
UPDATE `users` SET `email` = 'mirna.10405055@student.polsub.ac.id' WHERE `nim_nip` = '10405055';
UPDATE `users` SET `email` = 'nabila.10405058@student.polsub.ac.id' WHERE `nim_nip` = '10405058';
UPDATE `users` SET `email` = 'nashwa.10405061@student.polsub.ac.id' WHERE `nim_nip` = '10405061';
UPDATE `users` SET `email` = 'neneng.10405064@student.polsub.ac.id' WHERE `nim_nip` = '10405064';
UPDATE `users` SET `email` = 'novia.10405067@student.polsub.ac.id' WHERE `nim_nip` = '10405067';
UPDATE `users` SET `email` = 'putri.10405070@student.polsub.ac.id' WHERE `nim_nip` = '10405070';
UPDATE `users` SET `email` = 'ratna.10405073@student.polsub.ac.id' WHERE `nim_nip` = '10405073';
UPDATE `users` SET `email` = 'rian.10405076@student.polsub.ac.id' WHERE `nim_nip` = '10405076';
UPDATE `users` SET `email` = 'riski.10405079@student.polsub.ac.id' WHERE `nim_nip` = '10405079';
UPDATE `users` SET `email` = 'salsabella.10405082@student.polsub.ac.id' WHERE `nim_nip` = '10405082';
UPDATE `users` SET `email` = 'shailla.10405085@student.polsub.ac.id' WHERE `nim_nip` = '10405085';
UPDATE `users` SET `email` = 'shofia.10405088@student.polsub.ac.id' WHERE `nim_nip` = '10405088';
UPDATE `users` SET `email` = 'tia.10405091@student.polsub.ac.id' WHERE `nim_nip` = '10405091';
UPDATE `users` SET `email` = 'vinka.10405094@student.polsub.ac.id' WHERE `nim_nip` = '10405094';
UPDATE `users` SET `email` = 'zidni.10405097@student.polsub.ac.id' WHERE `nim_nip` = '10405097';
UPDATE `users` SET `email` = 'adhitya.10405002@student.polsub.ac.id' WHERE `nim_nip` = '10405002';
UPDATE `users` SET `email` = 'aisyah.10405008@student.polsub.ac.id' WHERE `nim_nip` = '10405008';
UPDATE `users` SET `email` = 'ananda.10405011@student.polsub.ac.id' WHERE `nim_nip` = '10405011';
UPDATE `users` SET `email` = 'anita.10405014@student.polsub.ac.id' WHERE `nim_nip` = '10405014';
UPDATE `users` SET `email` = 'aprilia.10405017@student.polsub.ac.id' WHERE `nim_nip` = '10405017';
UPDATE `users` SET `email` = 'atin.10405020@student.polsub.ac.id' WHERE `nim_nip` = '10405020';
UPDATE `users` SET `email` = 'bintang.10405023@student.polsub.ac.id' WHERE `nim_nip` = '10405023';
UPDATE `users` SET `email` = 'devita.10405026@student.polsub.ac.id' WHERE `nim_nip` = '10405026';
UPDATE `users` SET `email` = 'dina.10405029@student.polsub.ac.id' WHERE `nim_nip` = '10405029';
UPDATE `users` SET `email` = 'erlangga.10405032@student.polsub.ac.id' WHERE `nim_nip` = '10405032';
UPDATE `users` SET `email` = 'febinda.10405035@student.polsub.ac.id' WHERE `nim_nip` = '10405035';
UPDATE `users` SET `email` = 'ghiyasul.10405038@student.polsub.ac.id' WHERE `nim_nip` = '10405038';
UPDATE `users` SET `email` = 'hilmi.10405041@student.polsub.ac.id' WHERE `nim_nip` = '10405041';
UPDATE `users` SET `email` = 'indie.10405044@student.polsub.ac.id' WHERE `nim_nip` = '10405044';
UPDATE `users` SET `email` = 'lia.10405047@student.polsub.ac.id' WHERE `nim_nip` = '10405047';
UPDATE `users` SET `email` = 'marliansa.10405050@student.polsub.ac.id' WHERE `nim_nip` = '10405050';
UPDATE `users` SET `email` = 'melinda.10405053@student.polsub.ac.id' WHERE `nim_nip` = '10405053';
UPDATE `users` SET `email` = 'mulyanti.10405056@student.polsub.ac.id' WHERE `nim_nip` = '10405056';
UPDATE `users` SET `email` = 'najma.10405059@student.polsub.ac.id' WHERE `nim_nip` = '10405059';
UPDATE `users` SET `email` = 'nasywa.10405062@student.polsub.ac.id' WHERE `nim_nip` = '10405062';
UPDATE `users` SET `email` = 'nia.10405065@student.polsub.ac.id' WHERE `nim_nip` = '10405065';
UPDATE `users` SET `email` = 'putra.10405068@student.polsub.ac.id' WHERE `nim_nip` = '10405068';
UPDATE `users` SET `email` = 'r.10405071@student.polsub.ac.id' WHERE `nim_nip` = '10405071';
UPDATE `users` SET `email` = 'reva.10405074@student.polsub.ac.id' WHERE `nim_nip` = '10405074';
UPDATE `users` SET `email` = 'rifqi.10405077@student.polsub.ac.id' WHERE `nim_nip` = '10405077';
UPDATE `users` SET `email` = 'roslia.10405080@student.polsub.ac.id' WHERE `nim_nip` = '10405080';
UPDATE `users` SET `email` = 'salsabilla.10405083@student.polsub.ac.id' WHERE `nim_nip` = '10405083';
UPDATE `users` SET `email` = 'shalsabila.10405086@student.polsub.ac.id' WHERE `nim_nip` = '10405086';
UPDATE `users` SET `email` = 'siti.10405089@student.polsub.ac.id' WHERE `nim_nip` = '10405089';
UPDATE `users` SET `email` = 'triyani.10405092@student.polsub.ac.id' WHERE `nim_nip` = '10405092';
UPDATE `users` SET `email` = 'wandatia.10405095@student.polsub.ac.id' WHERE `nim_nip` = '10405095';
UPDATE `users` SET `email` = 'aeni.10405003@student.polsub.ac.id' WHERE `nim_nip` = '10405003';
UPDATE `users` SET `email` = 'agniva.10405006@student.polsub.ac.id' WHERE `nim_nip` = '10405006';
UPDATE `users` SET `email` = 'aldi.10405009@student.polsub.ac.id' WHERE `nim_nip` = '10405009';
UPDATE `users` SET `email` = 'ani.10405012@student.polsub.ac.id' WHERE `nim_nip` = '10405012';
UPDATE `users` SET `email` = 'anjali.10405015@student.polsub.ac.id' WHERE `nim_nip` = '10405015';
UPDATE `users` SET `email` = 'asep.10405018@student.polsub.ac.id' WHERE `nim_nip` = '10405018';
UPDATE `users` SET `email` = 'aulia.10405021@student.polsub.ac.id' WHERE `nim_nip` = '10405021';
UPDATE `users` SET `email` = 'bunga.10405024@student.polsub.ac.id' WHERE `nim_nip` = '10405024';
UPDATE `users` SET `email` = 'dila.10405027@student.polsub.ac.id' WHERE `nim_nip` = '10405027';
UPDATE `users` SET `email` = 'ela.10405030@student.polsub.ac.id' WHERE `nim_nip` = '10405030';
UPDATE `users` SET `email` = 'fadila.10405033@student.polsub.ac.id' WHERE `nim_nip` = '10405033';
UPDATE `users` SET `email` = 'fitra.10405036@student.polsub.ac.id' WHERE `nim_nip` = '10405036';
UPDATE `users` SET `email` = 'gina.10405039@student.polsub.ac.id' WHERE `nim_nip` = '10405039';
UPDATE `users` SET `email` = 'hisa.10405042@student.polsub.ac.id' WHERE `nim_nip` = '10405042';
UPDATE `users` SET `email` = 'ine.10405045@student.polsub.ac.id' WHERE `nim_nip` = '10405045';
UPDATE `users` SET `email` = 'lidya.10405048@student.polsub.ac.id' WHERE `nim_nip` = '10405048';
UPDATE `users` SET `email` = 'marsya.10405051@student.polsub.ac.id' WHERE `nim_nip` = '10405051';
UPDATE `users` SET `email` = 'memey.10405054@student.polsub.ac.id' WHERE `nim_nip` = '10405054';
UPDATE `users` SET `email` = 'mutiara.10405057@student.polsub.ac.id' WHERE `nim_nip` = '10405057';
UPDATE `users` SET `email` = 'nanda.10405060@student.polsub.ac.id' WHERE `nim_nip` = '10405060';
UPDATE `users` SET `email` = 'nayla.10405063@student.polsub.ac.id' WHERE `nim_nip` = '10405063';
UPDATE `users` SET `email` = 'novi.10405066@student.polsub.ac.id' WHERE `nim_nip` = '10405066';
UPDATE `users` SET `email` = 'putri.10405069@student.polsub.ac.id' WHERE `nim_nip` = '10405069';
UPDATE `users` SET `email` = 'rafa.10405072@student.polsub.ac.id' WHERE `nim_nip` = '10405072';
UPDATE `users` SET `email` = 'rhisa.10405075@student.polsub.ac.id' WHERE `nim_nip` = '10405075';
UPDATE `users` SET `email` = 'rina.10405078@student.polsub.ac.id' WHERE `nim_nip` = '10405078';
UPDATE `users` SET `email` = 'salma.10405081@student.polsub.ac.id' WHERE `nim_nip` = '10405081';
UPDATE `users` SET `email` = 'saskya.10405084@student.polsub.ac.id' WHERE `nim_nip` = '10405084';
UPDATE `users` SET `email` = 'sheren.10405087@student.polsub.ac.id' WHERE `nim_nip` = '10405087';
UPDATE `users` SET `email` = 'sri.10405090@student.polsub.ac.id' WHERE `nim_nip` = '10405090';
UPDATE `users` SET `email` = 'tya.10405093@student.polsub.ac.id' WHERE `nim_nip` = '10405093';
UPDATE `users` SET `email` = 'wika.10405096@student.polsub.ac.id' WHERE `nim_nip` = '10405096';

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================
-- Selesai: 366 mahasiswa
-- Tabel baru: mahasiswa (366 rows)
-- Email ter-update: 366 rows di tabel users
-- ============================================
