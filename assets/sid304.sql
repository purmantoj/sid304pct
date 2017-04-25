-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 16, 2016 at 09:40 PM
-- Server version: 5.1.33-community
-- PHP Version: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sid304`
--

-- --------------------------------------------------------

--
-- Table structure for table `analisis_indikator`
--

CREATE TABLE IF NOT EXISTS `analisis_indikator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nomor` decimal(3,0) NOT NULL,
  `pertanyaan` varchar(400) NOT NULL,
  `id_tipe` tinyint(4) NOT NULL DEFAULT '1',
  `bobot` tinyint(4) NOT NULL DEFAULT '0',
  `act_analisis` tinyint(1) NOT NULL DEFAULT '2',
  `id_kategori` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`,`id_tipe`),
  KEY `id_tipe` (`id_tipe`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_kategori_indikator`
--

CREATE TABLE IF NOT EXISTS `analisis_kategori_indikator` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `id_master` tinyint(4) NOT NULL,
  `kategori_kode` varchar(3) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_klasifikasi`
--

CREATE TABLE IF NOT EXISTS `analisis_klasifikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `minval` double(5,2) NOT NULL,
  `maxval` double(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_master`
--

CREATE TABLE IF NOT EXISTS `analisis_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  `subjek_tipe` tinyint(4) NOT NULL,
  `lock` tinyint(1) NOT NULL DEFAULT '1',
  `deskripsi` text NOT NULL,
  `kode_analiusis` varchar(5) NOT NULL DEFAULT '00000',
  `id_kelompok` int(11) NOT NULL,
  `pembagi` varchar(10) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_parameter`
--

CREATE TABLE IF NOT EXISTS `analisis_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indikator` int(11) NOT NULL,
  `kode_jawaban` varchar(3) NOT NULL,
  `asign` tinyint(1) NOT NULL DEFAULT '0',
  `jawaban` varchar(200) NOT NULL,
  `nilai` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_indikator` (`id_indikator`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_partisipasi`
--

CREATE TABLE IF NOT EXISTS `analisis_partisipasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_subjek` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `id_klassifikasi` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_subjek` (`id_subjek`,`id_master`,`id_periode`,`id_klassifikasi`),
  KEY `id_master` (`id_master`),
  KEY `id_periode` (`id_periode`),
  KEY `id_klassifikasi` (`id_klassifikasi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_periode`
--

CREATE TABLE IF NOT EXISTS `analisis_periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_state` tinyint(4) NOT NULL DEFAULT '1',
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  `tahun_pelaksanaan` year(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_master` (`id_master`),
  KEY `id_state` (`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_ref_state`
--

CREATE TABLE IF NOT EXISTS `analisis_ref_state` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `analisis_ref_state`
--

INSERT INTO `analisis_ref_state` (`id`, `nama`) VALUES
(1, 'Belum Entri / Pendataan'),
(2, 'Sedang Dalam Pendataan'),
(3, 'Selesai Entri / Pendataan');

-- --------------------------------------------------------

--
-- Table structure for table `analisis_ref_subjek`
--

CREATE TABLE IF NOT EXISTS `analisis_ref_subjek` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `subjek` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `analisis_ref_subjek`
--

INSERT INTO `analisis_ref_subjek` (`id`, `subjek`) VALUES
(1, 'Penduduk'),
(2, 'Keluarga / KK'),
(3, 'Rumah Tangga'),
(4, 'Kelompok');

-- --------------------------------------------------------

--
-- Table structure for table `analisis_respon`
--

CREATE TABLE IF NOT EXISTS `analisis_respon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indikator` int(11) NOT NULL,
  `id_parameter` int(11) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `no_kk` decimal(16,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_parameter` (`id_parameter`,`id_subjek`),
  KEY `id_periode` (`id_periode`),
  KEY `id_indikator` (`id_indikator`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_respon_hasil`
--

CREATE TABLE IF NOT EXISTS `analisis_respon_hasil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` tinyint(4) NOT NULL,
  `id_periode` tinyint(4) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `akumulasi` double(8,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_tipe_indikator`
--

CREATE TABLE IF NOT EXISTS `analisis_tipe_indikator` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipe` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `analisis_tipe_indikator`
--

INSERT INTO `analisis_tipe_indikator` (`id`, `tipe`) VALUES
(1, 'Pilihan (Tunggal)'),
(2, 'Pilihan (Multivalue)'),
(3, 'Isian Angka'),
(4, 'Isian Tulisan');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `path` text NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `ref_polygon` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  `desk` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE IF NOT EXISTS `artikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_kategori` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `headline` int(1) NOT NULL DEFAULT '0',
  `gambar1` varchar(200) NOT NULL,
  `gambar2` varchar(200) NOT NULL,
  `gambar3` varchar(200) NOT NULL,
  `dokumen` varchar(400) NOT NULL,
  `link_dokumen` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `gambar`, `isi`, `enabled`, `tgl_upload`, `id_kategori`, `id_user`, `judul`, `headline`, `gambar1`, `gambar2`, `gambar3`, `dokumen`, `link_dokumen`) VALUES
(7, '', '<p><strong>Awal mula SID</strong><br /> "Awalnya ada keinginan dari pemerintah Desa Balerante yang berharap pelayanan pemerintah desa bisa seperti pengunjung rumah sakit yang ingin mencari data pasien rawat inap, tinggal ketik nama di komputer, maka data tersebut akan keluar"<br /> (Mart Widarto, pengelola Program Lumbung Komunitas)<br /> Program ini mulai dibuat dari awal 2006: <br /> 1. (2006) komunitas melakukan komunikasi dan diskusi lepas tentang sebuah sistem yang bisa digunakan untuk menyimpan data.<br /> 2. (2008) Rangkaian FDG dengan pemerintah desa membahas tentang tata kelola pendokumentasian di desa<br /> 3. (2009) Ujicoba SID yang sudah dikembangkan di balerante<br /> 4. (2009-2010) Membangun SID (aplikasi) dibeberapa desa yang lain: terong (bantul), Nglegi (Gunungkidul) <br /> 5. (2011) Kandangan (Temanggung) Gilangharjo (bantul) Girikarto (gunungkidul) Talun (klaten) Pager Gunung (magelang) <br /> 6. hingga saat ini 2013 sudah banyak desa pengguna SID.<br /> <br /> <strong>SID sebagai tanggapan atas kebutuhan:</strong><br /> Kalau dulu untuk mencari data penduduk menurut kelompok umur saja kesulitan karena tidak mempunyai databasenya. Dengan adanya SID menjadi lebih mudah.<br /> (Nuryanto, Kabag Pelayanan Pemdes Terong)<br /> <br /> Membangun sebuah sistem bukan hanya membuatkan software dan meninggalkan begitu saja, namun ada upaya untuk memadukan sistem dengan kebutuhan yang ada pada desa. sehingga software dapat memenuhi kebutuhan yang telah ada bukan memaksakan desa untuk mengikuti dan berpindah sistem. inilah yang melatari combine melaksanakan alur pengaplikasian software.<br /> 1. Bentuk tim kerja bersama pemerintah desa<br /> 2. Diskusikan basis data apa saja yang diperlukan untuk warga<br /> 3. Himpun data kependudukan warga dari Kartu Keluarga (KK)<br /> 4. Daftarkan proyek SID dan dapatkan aplikasi softwarenya di http://abcd.lumbungkomunitas.net<br /> 5. Install aplikasi software SID di komputer desa<br /> 6. Entry data penduduk ke SID<br /> 7. Basis data kependudukan sudah bisa dimanfaatkan<br /> 8. Diskusikan rencana pengembangan SID sesuai kebutuhan desa<br /> 9. Sebarluaskan informasi desa melalui beragam media untuk warga<br /> <br /> Pemberdayaan data desa yang dibangun diharapkan dapat menjunjung kesejahteraan masyarakat desa, data-data tersebut dapat diperuntukkan untuk riset lebih lanjut tentang kemiskinan, tanggap bencana, sumberdaya desa yang bisa diekspose keluar dan dengan menghubungkan dari desa ke desa dapat mencontohkan banyak hal dalam keberhasilan pemberdayaannya.<br /> (sumber: Buku Sistem Informasi Desa) <br /> <strong><br /></strong></p>', 1, '2013-03-31 12:31:04', 999, 1, 'Awal mula SID', 1, '', '', '', '', ''),
(8, '', '<h2 style="text-align: justify;">Visi Pemerintah Desa Bumi Pertiwi</h2>\r\n<p><strong>Visi dan Misi</strong></p>\r\n<p><strong>1&nbsp; </strong><strong>Visi </strong></p>\r\n<p>Visi dalam hal ini adalah visi pemerintahan desa, yaitu visi Kepala Desa. Visi pemeritahan desa pada dasarnya merupakan gambaran masa depan yang akan diwujudkan oleh pemerintah desa dalam periode 2014 - 2019 fungsi visi pemerintah desa, terutama sebagai arah bagi perjalanan pemerintah desa dalam mewujudkan kesejahteraan masyarakat. Visi bukan mimpi dan bukan slogan tetapi visi harus diwujudkan dan dapat diarahkan ketercapaiannya.</p>\r\n<p>Berdasarkan masalah potensi dan harapan masa depan maka pemerintah desa Madukara dalam periode 2014-2019 menetapkan visi sebagai berikut :</p>\r\n<p>&ldquo;Terwujudnya desa.Madukara Mandiri dan sejahtera&nbsp; &rdquo;. dan mempunyai slogan &ldquo;Nyawiji Mbangun Desa&rdquo;</p>\r\n<p>Dari visi tersebut dapat dijelaskan sebagai berikut :</p>\r\n<p>-Mandiri</p>\r\n<p>Kemandirian dalam hal ini meliputi 2 (dua) sisi yaitu pemerintah desa dan masyarakat. Oleh karena itu ketercapaian kemandirian dapat dilihat dari adanya peningkatan kemampuan pemerintah desa dan peningkatan kemampuan masyarakat dalam pelaksanaan pembangunan desa.</p>\r\n<p>-Sejahtera</p>\r\n<p>Dari uraian tersebut diatas, maka ketercapaian visi Kepala Desa dapat diuraikan sebagai berikut :</p>\r\n<p>&nbsp;Makin kuatnya kelembagaan pemerintahan desa.</p>\r\n<ol>\r\n<li>Makin meningkatnya peran masyarakat dalam pembangunan.</li>\r\n<li>Makin baiknya kebijakan-kebijakan pemerintah desa dalam penyelengaraan pemerintahan desa.</li>\r\n<li>Makin baiknya kualitas pembangunan desa.</li>\r\n<li>Makin meningkatnya kesejahteraan kehidupan dari masyarakat</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p><strong>2 Misi </strong></p>\r\n<p>Misi dalam hal ini adalah misi Kepala Desa. Misi pada dasarnya merupakan penjabaran atau operasionalisasi dari visi. Misi merupakan bidang bidang yang akan diarungi untuk menuju tercapainya visi yang telah ditetapkan. Misi juga berapa output&nbsp; output yang pernah diciptakan terlebih dahulu untuk mewujudkan visi. Misi pada dasarnya merupakan beban yang akan dipikul dan diselesaikan agar visi dapat terwujud.</p>\r\n<p>Untuk mewujudkan visi Kepala Desa sebagaimana rumusan dimuka, maka dirumuskan misi&nbsp; (beban kinerja yang harus dilaksanakan) sebagai berikut :</p>\r\n<ol>\r\n<li>Menyelenggarakan pemerintahan desa yang efisien, efektif, dan bersih dengan mengutamakan masyarakat .</li>\r\n<li>Meningkatkan sumber sumber pendanaan pemerintahan dan pembangunan desa.</li>\r\n<li>Mengembangkan pemberdayaan masyarakat dan kemitraan dalam pelaksanaan pembangunan desa.</li>\r\n<li>Meningkatkan kualitas sumber daya manusia dalam pembangunan desa yang berkelanjutan.</li>\r\n<li>Mengembangkan perekonomian desa.</li>\r\n<li>Menciptakan rasa aman, tentram, dalam suasana kehidupan desa yang demokratis dan agamis.</li>\r\n</ol>\r\n<p><strong>Rumusan Misi tersebut diatas dapat dijelaskan sebagai berikut : </strong></p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Misi 1 : &nbsp;&nbsp; Menyelenggarakan pemerataan desa yang efisien, efektif dan bersih.</p>\r\n<p>Tujuan pemerintah secara garis besar ada 3 hal yaitu membina/ mengembangkan, membangun/ memberdayakan dan melindungi seluruh masyarakat. Untuk mewujudkan 3 tujuan tersebut maka diciptakan suatu kelembagaan pemerintahan yang mengacu&nbsp; kepada prinsip prinsip manajemen antara lain efisien dan efektif serta prinsip <em>&ldquo;Clean Government&rdquo;</em> yaitu pemerintah yang bersih, oleh karena itu aparat pemerintah desa dalam menjalankan tugas dan fungsinya harus secara profesional, produktif, dan transparan serta akuntabel.</p>\r\n<p>Misi 2 : &nbsp; Meningkatkan sumber sumber pendanaan pemerintahan&nbsp; dan pembangunan Desa.</p>\r\n<p>Dana bagi penyelenggaraan pemerintahan desa merupakan elemen yang mutlak harus ada. Visi dan Misi tidak akan terwujud tanpa tersedianya&nbsp; dana. Oleh karena itu pemerintahan yang kuat ditandai oleh cukup dan beragamnya&nbsp; sumber-sumber dana yang dimilikinya.</p>\r\n<p>Dari uraian tersebut diatas, maka pencapaian&nbsp; misi Kepala Desa dapat diindikasikan sebagai berikut :</p>\r\n<ol>\r\n<li>Terselenggaraanya tugas-tugas pemerintahan desa secara efektif.</li>\r\n<li>Tersusunya program-program pembangunan desa secara efektif dan efisien</li>\r\n<li>Penggunaan dana yang makin terarah dan efisien/ benar</li>\r\n<li>Terlaksanaanya pengawasan melekat yang efektf.</li>\r\n<li>Meningkatnya jumlah dan keragaman sumber - sumber pendanaan desa.</li>\r\n<li>Meningkatnya kemandirian masyarakat, terutama dalam bidang pendanaan pembangunan.</li>\r\n<li>Meningkatnya keterlibatan masyarakat dalam pelaksanaan pembangunan.</li>\r\n<li>Meningkatnya kemampuan masyarakat mengakses ke sumber-sumber daya termasuk informasi.</li>\r\n<li>Meningkatnya usaha kemitraan yang dilakukan oleh masyarakat.</li>\r\n<li>Meningkatnya tingkat pendidikan masyarakat.</li>\r\n<li>Meningkatnya tingkat kesehatan masyarakat.</li>\r\n<li>Berkembangnya produktivitas sektor pertanian dan sektor sektor rill ekonomi desa.</li>\r\n</ol>', 1, '2013-04-01 07:14:06', 999, 1, 'Visi Misi', 0, '', '', '', '', ''),
(32, '', '<div class="contentText">\r\n<div align="justify">Bagian ini berisi informasi dasar mengenai desa kami. Sila klik pada tautan berikut untuk mendapatkan informasi yang lebih rinci.</div>\r\n<div align="justify">&nbsp;</div>\r\n<div align="justify"><ol>\r\n<li>Sejarah Desa</li>\r\n<li>Profil Wilayah Desa</li>\r\n<li>Profil Masyarakat Desa</li>\r\n<li>Profil Potensi Desa</li>\r\n</ol></div>\r\n</div>', 1, '2013-07-29 09:46:44', 999, 1, 'Profil Desa', 0, '', '', '', '', ''),
(35, '', '<p>Susunan Organisasi Pemerintah Desa Terong</p>\r\n<p>Kepala Desa dan Perangkat</p>\r\n<p>1).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Purwono</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 02 Maret 1961</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 03 Rw. 05</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kepala Desa</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 081 392 028 007</p>\r\n<p>&nbsp;</p>\r\n<p>2).&nbsp;&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Wijaya Adi Nugraha</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 22 Juni 1983</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 01 Rw. 05</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Sekretaris Desa</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 081 327 960 967</p>\r\n<p>&nbsp;</p>\r\n<p>3).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Ari Dewi Utami</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 02 Februari 1992</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 02 Rw. 03</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Pemerintahan</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; :&nbsp;&nbsp;&nbsp; 081 327 404 858</p>\r\n<p>&nbsp;</p>\r\n<p>4).&nbsp;&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Basuki</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 02 Juni 1973</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 03 Rw. 05</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Pembangunan</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 082 326 844 747</p>\r\n<p>&nbsp;</p>\r\n<p>5).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Dwi Rahayu</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 9 Maret 1986</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 01 Rw. 06</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Keuangan</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 085 713 536 650</p>\r\n<p>&nbsp; </p>\r\n<p>6).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Erna Setyani</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 5 November 1979</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 03 Rw. 05</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Kesra</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 081 327 769 231</p>\r\n<p>&nbsp;</p>\r\n<p>7).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Dwi Yogi Artati</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kebumen, 26 Desember 1967</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 01 Rw. 05</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kaur Umum</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 081 391 682 880</p>\r\n<p>&nbsp;</p>\r\n<p>8).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Agus Kharin</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 22 Agustus 1976</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 02 Rw. 04</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus I</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 085 328 018 996</p>\r\n<p>&nbsp;</p>\r\n<p>9).&nbsp;&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Suyoto</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 21 September 1966</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 01 Rw. 03</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus II</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 085 291 491 221</p>\r\n<p>&nbsp;</p>\r\n<p>10).&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Ali Fikri</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 10 Mei 1977</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 03 Rw. 01</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus III</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 085 726 032 433</p>\r\n<p>&nbsp;</p>\r\n<p>11).&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kasmin</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 24 November 1955</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 02 Rw. 06</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus IV</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; :&nbsp;&nbsp;&nbsp; -</p>\r\n<p>&nbsp;</p>\r\n<p>12).&nbsp; Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Sukasih</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Banjarnegara, 11 Juli 1981</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Desa Madukara, Rt. 02 Rw. 07</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Jabatan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; Kadus V</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; No. HP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp; 087 937 769 387</p>\r\n<p><br /><br />&nbsp;</p>', 1, '2013-07-29 10:18:20', 999, 1, 'Pemerintah Desa', 0, '', '', '', '', ''),
(36, '', '<p>Anda dapat menghubungi kami melalui :</p>\r\n<p>Alamat : Jl. Raya Madukara-Gununggiana No. 06 Kec. Madukara Kab. Banjarnegara</p>\r\n<p>&nbsp;</p>', 1, '2013-07-29 10:28:31', 999, 1, 'Kontak Kami', 0, '', '', '', '', ''),
(38, '', '<p>Susunan Kepengurusan LP3M Desa Madukara</p>\r\n<table style="width: 366px; height: 376px;" border="0">\r\n<tbody>\r\n<tr>\r\n<td>No</td>\r\n<td>Jabatan</td>\r\n<td>Nama</td>\r\n</tr>\r\n<tr>\r\n<td>1</td>\r\n<td>Ketua</td>\r\n<td>\r\n<p>Sodikin</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>2</td>\r\n<td>Wakil Ketua</td>\r\n<td>\r\n<p>Waldiman, S.Pd</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>3</td>\r\n<td>Sekretaris</td>\r\n<td>\r\n<p>Catur Wahyu Setyo Nugroho</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>4</td>\r\n<td>Bendahara</td>\r\n<td>\r\n<p>Sumadiwirya</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>5</td>\r\n<td>Seksi Agama</td>\r\n<td>\r\n<p>Suparjo</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>6</td>\r\n<td>Seksi Pendidikan</td>\r\n<td>\r\n<p>Supangadi</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>7</td>\r\n<td>Seksi Pembangunan</td>\r\n<td>\r\n<p>Hudiyono, ST</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>8</td>\r\n<td>Seksi Ekonomi</td>\r\n<td>\r\n<p>Suyono, SE</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>9</td>\r\n<td>Seksi Pemberdayaan Perempuan</td>\r\n<td>\r\n<p>Iman Sri Kuati</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>10</td>\r\n<td>Seksi Kesehatan</td>\r\n<td>\r\n<p>Kasman</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>11</td>\r\n<td>Seksi Pemuda</td>\r\n<td>\r\n<p>Setyanto</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>12</td>\r\n<td>Seksi Keamanan</td>\r\n<td>\r\n<p>Sukari</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 1, '2013-07-29 10:38:33', 999, 1, 'Lembaga Kemasyarakatan', 0, '', '', '', '', ''),
(56, '', '<p><iframe src="http://www.youtube.com/v/L9XFIL4aJoI" frameborder="0" width="560" height="310"></iframe></p>', 1, '2014-04-30 04:09:50', 1, 1, 'Petani Rock', 0, '', '', '', 'religi lirik.docx', 'Coba'),
(57, '', '<p>Menurut Kamus Besar Bahasa Indonesia (KBBI)</p>\r\n<p>ma.du.ka.ra</p>\r\n<p>Klasik nomina (kata benda) lebah</p>\r\n<p>Nomina (kata benda) kain sutra berbenang warna emas</p>\r\n<p>&nbsp;</p>\r\n<p>Berikut ini adalah nama-nama pemimpin Desa Madukara sejak tahun...</p>\r\n<table border="0">\r\n<tbody>\r\n<tr>\r\n<td>NO</td>\r\n<td>NAMA</td>\r\n<td>TAHUN</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>', 1, '2014-04-30 10:20:39', 999, 1, 'Sejarah Desa', 0, '', '', '', '', ''),
(59, '', '<ol>\r\n<li><strong>a.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Jumlah Penduduk</strong></li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<table style="width: 372px;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Jumlah jiwa</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Jumlah laki-laki</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Jumlah perempuan</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Jumlah Kepala Keluarga</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">KK</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li><strong>b.&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Tingkat Pendidikan</strong></li>\r\n</ol>\r\n<table style="width: 373px;" border="0" cellspacing="0" cellpadding="0" align="left">\r\n<tbody>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Belum sekolah</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Usia 7-45 tahun tidak pernah sekolah</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Pernah sekolah SD tetapi tidak tamat</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Pendidikan terakhir</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Tamat SD/sederajat</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">SLTP/sederajat</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">SLTA/sederajat</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">D-1</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">D-2</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">D-3</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">S-1</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">S-2</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">S-3</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="121">&nbsp;</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>\r\n<ol>\r\n<li><strong>c.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Mata Pencaharian</strong></li>\r\n</ol>\r\n<p><strong>&nbsp;</strong></p>\r\n<table style="width: 372px;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Petani</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">246</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Buruh tani</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">125</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Buruh/swasta</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">136</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Pegawai Negeri</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">35</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Pengrajin</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">&nbsp;</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Pedagang</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">9</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Peternak</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">-</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Nelayan</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">-</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Montir</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">8</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Dokter</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">-</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">POLRI/ABRI</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">1</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Pensiunan</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">36</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Perangkat Desa</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">15</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Pembuat Bata</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">3</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>&nbsp;</strong></p>\r\n<ol>\r\n<li><strong>d.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>AGAMA</strong></li>\r\n</ol>\r\n<table style="width: 372px;" border="0" cellspacing="0" cellpadding="0">\r\n<tbody>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Islam</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">2215</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Kristen</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">5</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Katholik</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">&nbsp;</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Hindu</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">&nbsp;</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td valign="bottom" nowrap="nowrap" width="168">\r\n<p align="right">Budha</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="120">\r\n<p align="right">1</p>\r\n</td>\r\n<td valign="bottom" nowrap="nowrap" width="84">\r\n<p align="right">orang</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><strong>&nbsp;</strong></p>\r\n<p><strong>&nbsp;</strong></p>', 1, '2014-04-30 10:23:24', 999, 1, 'Profil Potensi Desa', 0, '', '', '', '', ''),
(73, '', '<p><strong>Tentang SID</strong> <br /> Sistem Informasi Desa (SID) adalah sebuah platform teknologi informasi komunikasi untuk mendukung pengelolaan sumber daya komunitas di tingkat desa. Ini bersifat terbuka bagi siapa saja yang akan bergabung dalam gerakan membangun kemandirian komunitas. Konsep pengelolaan sumber daya berada dalam payung besar gagasan Lumbung Komunitas yang dikelola oleh COMBINE Resource Institution.<br /> <strong><br /></strong> <strong>Sekilas pandang sistem informasi desa</strong><br /> Aplikasi Gratis untuk desa yang berbasis Opensource, SID merupakan inisiatif Combine resource institution, sebuah organisasi masyarakat sipil yang sangat tekun dan dedikatif dalam mengembangkan informasi dan komunikasi alternatif berbasis masyarakat.<br /> <strong><br /></strong> <strong>Awal mula SID</strong><br /> "Awalnya ada keinginan dari pemerintah Desa Balerante yang berharap pelayanan pemerintah desa bisa seperti pengunjung rumah sakit yang ingin mencari data pasien rawat inap, tinggal ketik nama di komputer, maka data tersebut akan keluar"<br /> (Mart Widarto, pengelola Program Lumbung Komunitas)<br /> Program ini mulai dibuat dari awal 2006: <br /> 1. (2006) komunitas melakukan komunikasi dan diskusi lepas tentang sebuah sistem yang bisa digunakan untuk menyimpan data.<br /> 2. (2008) Rangkaian FDG dengan pemerintah desa membahas tentang tata kelola pendokumentasian di desa<br /> 3. (2009) Ujicoba SID yang sudah dikembangkan di balerante<br /> 4. (2009-2010) Membangun SID (aplikasi) dibeberapa desa yang lain: terong (bantul), Nglegi (Gunungkidul) <br /> 5. (2011) Kandangan (Temanggung) Gilangharjo (bantul) Girikarto (gunungkidul) Talun (klaten) Pager Gunung (magelang) <br /> 6. hingga saat ini 2013 sudah banyak desa pengguna SID.<br /> <br /> <strong>SID sebagai tanggapan atas kebutuhan:</strong><br /> Kalau dulu untuk mencari data penduduk menurut kelompok umur saja kesulitan karena tidak mempunyai databasenya. Dengan adanya SID menjadi lebih mudah.<br /> (Nuryanto, Kabag Pelayanan Pemdes Terong)<br /> <br /> Membangun sebuah sistem bukan hanya membuatkan software dan meninggalkan begitu saja, namun ada upaya untuk memadukan sistem dengan kebutuhan yang ada pada desa. sehingga software dapat memenuhi kebutuhan yang telah ada bukan memaksakan desa untuk mengikuti dan berpindah sistem. inilah yang melatari combine melaksanakan alur pengaplikasian software.<br /> 1. Bentuk tim kerja bersama pemerintah desa<br /> 2. Diskusikan basis data apa saja yang diperlukan untuk warga<br /> 3. Himpun data kependudukan warga dari Kartu Keluarga (KK)<br /> 4. Daftarkan proyek SID dan dapatkan aplikasi softwarenya di http://abcd.lumbungkomunitas.net<br /> 5. Install aplikasi software SID di komputer desa<br /> 6. Entry data penduduk ke SID<br /> 7. Basis data kependudukan sudah bisa dimanfaatkan<br /> 8. Diskusikan rencana pengembangan SID sesuai kebutuhan desa<br /> 9. Sebarluaskan informasi desa melalui beragam media untuk warga<br /> (Elanto Wijoyono, pengelola Program Lumbung Komunitas)<br /> <br /> Pemberdayaan data desa yang dibangun diharapkan dapat menjunjung kesejahteraan masyarakat desa, data-data tersebut dapat diperuntukkan untuk riset lebih lanjut tentang kemiskinan, tanggap bencana, sumberdaya desa yang bisa diekspose keluar dan dengan menghubungkan dari desa ke desa dapat mencontohkan banyak hal dalam keberhasilan pemberdayaannya.<br /> (sumber: Buku Sistem Informasi Desa) <br /> <strong><br /></strong> <strong>Hal-hal penting yang harus diperhatikan dalam mengaplikasikan SID</strong><br /> 1. SID mencoba masuk keranah paling kecil dari penduduk, dengan tujuan menyatukan warga masyarakat bersama perangkat desa bersama-sama memajukan desa dengan memanfaatkan informasi dan jaringan. Konsep gotong royong sebagai kearifan lokal dipertahankan dan dikuatkan kembali.<br /> 2. Data yang dikumpulkan dijaga kerahasiaanya dari publik, Keamanan data pribadi warga mengacu pada Undang-Undang Nomor 23 Tahun 2006 tentang Administrasi Kependudukan. Penerapan sistem informasi administrasi kependudukan diatur dalam Keputusan Presiden (Keppres) No. 88/2004 tentang pengelolaan administrasi kependudukan, Undang-Undang (UU) No. 23 tahun 2006 tentang administrasi kependudukan dan Peraturan Menteri Dalam Negeri (Permendagri) No. 18/2005 serta Peraturan Pemerintah (PP) No. 37 tahun 2007 tentang administrasi kependudukan. Pencatatan data penduduk suatu daerah yang melalui sistem informasi administrasi kependudukan menjadi tanggung jawab pemerintah kabupaten dan kota dimana dalam pelaksanaannya diawali dari desa dan kelurahan sebagai awal dari pendataan penduduk disuatu daerah.<br /> 3. Software SID hanyalah sebuah alat, yang membutuhkan ketrampilan dari pengguna alat. alat ini bisa menjadi kekuatan desa apabila digunakan dengan semestinya, namun juga bisa menjadi bumerang ketika jatuh ketangan yang salah.<br /> <strong><br /></strong> <strong>Pengembangan dengan ACCESS</strong><br /> ACCESS yang memiliki pengalaman melakukan participatory poverty assessment dengan pendekatan Community Led Action and participatory Process (CLAPP) dimana melibatkan warga secara partisipatif dalam menyusun dan menghasilkan data yang valid. Yang kemudian Memanfaatkan SAID (Sistem Administrasi dan Informasi Desa) sebagai &acirc;&euro;&oelig;mesin&acirc;&euro; untuk memanfaatkan database partisipatif yang diperoleh. <br /> ACCESS bekerjasama dengan Combine Resource Institution (CRI) bersama mengembangkan SAID di sejumlah desa di wilayah dampingan ACCESS, dan beberapa daerah telah menyatakan minatnya sebagai bagian dari upaya mereka menyediakan informasi terbaru yang lebih akurat di level yang paling bawah yaitu desa/kelurahan. Hal ini dirasakan karena Indonesia masih menghadapi kesulitan terkait dengan ketepatan data dan SAID membantu menyediakan data tersebut dari desa ke atas.</p>', 1, '2014-05-16 06:21:08', 1, 1, 'Selamat Bergabung dengan SID', 0, '', '', '', '', ''),
(79, '', '<p style="text-align: justify;">This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they are addressed. If you have received this email in error please notify the system administrator. Please note that any views or opinions presented in this email are solely those of the author and do not necessarily represent those of the company. Finally, the recipient should check this email and any attachments for the presence of viruses. The company accepts no liability for any damage caused by any virus transmitted by this email.</p>', 1, '2014-10-24 09:57:06', 7, 1, 'Bakpia Ketan', 0, '', '', '', '', ''),
(81, '', '<p>Jelajah Desa merupakan paket wisata menjelajah Desa Wisata Bumi Pertiwi mengunjungi masing sanggar dan menikmati alam desa.<br />Jelajah Desa ini masing-masing peserta dikenai biaya: Rp. 15.000,-/ Orang.<br />Dengan peserta minimal 10 Orang<br />Fasilitas : Pemandu</p>', 1, '2014-11-06 07:33:38', 7, 1, 'Jelajah Desa yang Mengesankan', 0, '', '', '', '', ''),
(82, '', '<p style="text-align: justify;">Halaman ini berisi tautan menuju informasi mengenai Basis Data Desa. Ada dua jenis data yang dimuat dalam sistem ini, yakni basis data kependudukan dan basis data sumber daya desa. Sila klik pada tautan berikut untuk mendapatkan tampilan data statistik per kategori.</p>\r\n<ol>\r\n<li style="text-align: justify;">Data Wilayah Administratif&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Pendidikan&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Pekerjaan&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Golongan Darah&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Agama&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Jenis Kelamin&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Kelompok Umur&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Penerima Raskin&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Penerima Jamkesmas&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Warga Negara&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n<li style="text-align: justify;">Data Kelas Sosial&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</li>\r\n</ol>\r\n<p style="text-align: justify;">Data yang tampil adalah statistik yang didapatkan dari proses olah data dasar yang dilakukan secara <em>offline</em> di kantor desa secara rutin/harian. Data dasar di kantor desa diunggah ke dalam sistem <em>online</em> di website ini secara berkala. Sila hubungi kontak pemerintah desa untuk mendapatkan data dan informasi desa termutakhir.</p>', 1, '2014-11-06 08:26:37', 999, 1, 'Data Desa', 0, '', '', '', '', ''),
(84, '', '<p style="text-align: justify;">1. Pada komputer/PC server, buka web-browser (direkomendasikan <span style="text-decoration: underline;">Mozilla Firefox</span> atau <span style="text-decoration: underline;">Chrome</span>)</p>\r\n<p style="text-align: justify; padding-left: 30px;">Ketik:<span style="color: #0000ff;"> localhot/phpmyadmin</span></p>\r\n<p>2. Muncul halaman <span style="text-decoration: underline;">PHPMyAdmin</span>. Periksa kolom kiri.</p>\r\n<p style="padding-left: 30px;">Klik/Pilih: &ldquo;sid&rdquo;</p>\r\n<p>3. Muncul halaman yang menampilkan deretan isi tabel &ldquo;<span style="text-decoration: underline;">sid</span>&ldquo;.</p>\r\n<p style="padding-left: 30px;">Klik/Pilih: &ldquo;Export&rdquo; pada bagian menu atas di kolom kanan</p>\r\n<p>4. Muncul halaman <span style="text-decoration: underline;">Export</span>. Kolom isian yang ada tak perlu diubah. Lihat bagian kanan bawah.</p>\r\n<p style="padding-left: 30px;">Klik: &ldquo;Go&rdquo;</p>\r\n<p>5. Muncul jendela pilihan lokasi untuk menyimpan file database.</p>\r\n<p style="padding-left: 30px;">Klik: &ldquo;Save&rdquo;<br /> Klik: &ldquo;OK&rdquo;</p>\r\n<p>6. File database SID 3.0 akan tersimpan otomatis di folder Download (tergantung setting komputer masing-masing). File tersimpan dalam sebagai &ldquo;sid.sql&rdquo;</p>\r\n<p>7. Simpan/amankan file &ldquo;sid.sql&rdquo; di media lain: Hard-disk eksternal, CD, <em>online storage</em>, dan sebagainya.</p>\r\n<p>8. Lakukan proses <em>back-up</em> database ini secara berkala.</p>\r\n<p>.<br /> Selamat mencoba!</p>', 1, '2014-11-06 10:25:34', 1, 1, 'Panduan Back-Up Data (Export Database) SID 3.0', 0, '', '', '', '', ''),
(85, '', '<div class="contentText">\r\n<div align="justify">Bagian ini berisi informasi mengenai PemerintahanDesa. Sila klik pada tautan berikut untuk mendapatkan informasi yang lebih rinci.</div>\r\n<div align="justify">&nbsp;</div>\r\n<ol>\r\n<li>Visi dan Misi</li>\r\n<li>Pemerintah Desa</li>\r\n<li>Badan Permusyawaratan Desa</li>\r\n</ol></div>', 1, '2014-11-07 02:53:54', 999, 1, 'Pemerintahan Desa', 0, '', '', '', '', ''),
(87, '', '<p>PEMBUATAN KTP</p>\r\n<p>Kartu Tanda Penduduk adalah identitas resmi penduduk sebagai bukti diri yang terbitkan oleh instansi pelaksana yang berlaku di seluruh Indonesia. KTP merupakan alat bukti sah yang menjadi dasar dalam layanan masyarakat.</p>\r\n<p>Syarat-syarat pembuatan KTP</p>\r\n<p>A. WNI</p>\r\n<p>a. Surat Pengantar dari Desa/Kelurahan yang diketaui oleh kecamatan.</p>\r\n<p>b. Mengisi formulir permohonan KTP.</p>\r\n<p>c. Sudah berusia 17 tahun.</p>\r\n<p>d. Belum berumur 17 tahun tetapi sudah menikah.</p>\r\n<p>e. Fotokopi akta kelahiran.</p>\r\n<p>f. Surat keterangan kependudukan bagi penduduk yang mengajukan perubahan data.</p>\r\n<p>g. Fotokopi surat nikah bagi yang suda menikah.</p>\r\n<p>h. Fotokopi surat cerai bagi yang sudah cerai.</p>\r\n<p>i. Fotokopi Kartu Keuarga.</p>\r\n<p>j. Semua jenis fotokopi dokumen yang diperlukan sebagaimana tersebut di atas harus dlegaisasi oleh instansi yang berwenang.</p>\r\n<p>&nbsp;</p>\r\n<p>Untuk penggantian KTP :</p>\r\n<p>a. Surat Pengantar dari Desa/Kelurahan.</p>\r\n<p>b. KTP lama bagi yang sudah habis masa berlakunya (untuk diperpanjang masa berlaku KTP)</p>\r\n<p>c. KTP yang rusak bagi KTPnya rusak.''</p>\r\n<p>d. Surat Kehilangan dari Kepolisian bagi KTP yang hilang.</p>\r\n<p>&nbsp;</p>', 1, '2015-06-11 03:28:26', 1, 59, 'Layanan Bidang Pendaftaran Penduduk', 0, '', '', '', 'ppls2(2).xls', 'Layanan Bidang Pendaftaran Penduduk'),
(89, '', '<p>This email and any files transmitted with it are confidential and intended solely for the use of the individual or entity to whom they yang berlaku di seluruh Indonesia.</p>', 2, '2015-06-17 13:47:36', 17, 1, 'teks 1', 0, '', '', '', '', ''),
(90, '', '<p>PEMBUATAN KTP Kartu Tanda Penduduk adalah identitas resmi penduduk sebagai bukti diri yang terbitkan oleh instansi pelaksana yang berlaku di seluruh Indonesia.</p>', 2, '2015-06-17 13:47:55', 17, 1, 'teks 2', 0, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama_desa` varchar(100) NOT NULL,
  `kode_desa` varchar(100) NOT NULL,
  `nama_kepala_desa` varchar(100) NOT NULL,
  `nip_kepala_desa` varchar(100) NOT NULL,
  `kode_pos` varchar(6) NOT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `kode_kecamatan` varchar(100) NOT NULL,
  `nama_kepala_camat` varchar(100) NOT NULL,
  `nip_kepala_camat` varchar(100) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `kode_kabupaten` varchar(100) NOT NULL,
  `nama_propinsi` varchar(100) NOT NULL,
  `kode_propinsi` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `zoom` tinyint(4) NOT NULL,
  `map_tipe` varchar(20) NOT NULL,
  `path` text NOT NULL,
  `alamat_kantor` varchar(200) DEFAULT NULL,
  `g_analytic` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `nama_desa`, `kode_desa`, `nama_kepala_desa`, `nip_kepala_desa`, `kode_pos`, `nama_kecamatan`, `kode_kecamatan`, `nama_kepala_camat`, `nip_kepala_camat`, `nama_kabupaten`, `kode_kabupaten`, `nama_propinsi`, `kode_propinsi`, `logo`, `lat`, `lng`, `zoom`, `map_tipe`, `path`, `alamat_kantor`, `g_analytic`) VALUES
(1, 'Bumi Pertiwi', '012', 'Jarwo', '--', '53482', 'Nusantara', '08', 'Sukirman', '23425525025', 'Sejahtera', '04', 'Banjar Raya', '33', 'gkk.png', '-7.859884774594698', '110.36593542465971', 11, 'roadmap', '(-7.743118383096033, 110.34478571265936);(-7.748901613635884, 110.3416958078742);(-7.755705312573212, 110.33826258033514);(-7.764549956678239, 110.33551599830389);(-7.7730542466061285, 110.33242609351873);(-7.780197716998335, 110.33208277076483);(-7.7893820001133784, 110.33105280250311);(-7.798566081843957, 110.3307094797492);(-7.801967542443794, 110.32658960670233);(-7.80604925864044, 110.32555963844061);(-7.81659350759561, 110.32418634742498);(-7.822715852513199, 110.32452967017889);(-7.823736234596529, 110.3303661569953);(-7.826797365863762, 110.33757593482733);(-7.827817737957529, 110.35577204078436);(-7.832579441358312, 110.35989191383123);(-7.8359806247460675, 110.36160852760077);(-7.83836143658561, 110.37190821021795);(-7.834960272646731, 110.38289453834295);(-7.834960272646731, 110.3911342844367);(-7.837681206020989, 110.39319422096014);(-7.8380213214422705, 110.40521051734686);(-7.8216954679332495, 110.41104700416327);(-7.80264783124394, 110.40898706763983);(-7.782578846759991, 110.41070368140936);(-7.783599326803616, 110.42821314185858);(-7.765570480561039, 110.43233301490545);(-7.758766941202343, 110.40315058082342);(-7.758086581210773, 110.39388086646795);(-7.760127657883125, 110.38667108863592);(-7.750942734864957, 110.37911798804998);(-7.748561425802341, 110.36504175513983);(-7.745159532352903, 110.35371210426092);', 'Jl. Tengah Raya Semakin Tinggi. email desaku@sid.web.id Telp (007) 7860341', 'gsgsdgsdgsg');

-- --------------------------------------------------------

--
-- Table structure for table `data_persil`
--

CREATE TABLE IF NOT EXISTS `data_persil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` varchar(64) NOT NULL,
  `nama` varchar(128) NOT NULL COMMENT 'nomer persil',
  `persil_jenis_id` tinyint(2) NOT NULL,
  `id_clusterdesa` varchar(64) NOT NULL,
  `alamat_ext` varchar(64) NOT NULL,
  `luas` decimal(7,2) NOT NULL,
  `kelas` varchar(128) DEFAULT NULL,
  `peta` text,
  `no_sppt_pbb` varchar(128) NOT NULL,
  `persil_peruntukan_id` tinyint(2) NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nik` (`nik`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_persil_jenis`
--

CREATE TABLE IF NOT EXISTS `data_persil_jenis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) NOT NULL,
  `ndesc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `data_persil_jenis`
--

INSERT INTO `data_persil_jenis` (`id`, `nama`, `ndesc`) VALUES
(1, 'Leter C', 'Untuk tanah yang memiliki surat minim itu biasanya berupa leter C. Letter C ini diperoleh dari kantor desa dimana tanah itu berada, letter C ini merupakan tanda bukti berupa catatan yang berada di Kantor Desa atau Kelurahan.'),
(2, 'Leter D', 'Leter D adalah'),
(4, 'SHM', 'Sertifikat Hak Milik adalah bl ab a'),
(5, 'HGB', 'Hak Guna Bangunan adalah');

-- --------------------------------------------------------

--
-- Table structure for table `data_persil_log`
--

CREATE TABLE IF NOT EXISTS `data_persil_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persil_id` int(11) NOT NULL,
  `persil_transaksi_jenis` tinyint(2) NOT NULL,
  `pemilik_lama` varchar(24) NOT NULL,
  `pemilik_baru` varchar(24) NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tabel untuk menyimpan catatan transaksi atas data persil' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_persil_peruntukan`
--

CREATE TABLE IF NOT EXISTS `data_persil_peruntukan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) NOT NULL,
  `ndesc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `data_persil_peruntukan`
--

INSERT INTO `data_persil_peruntukan` (`id`, `nama`, `ndesc`) VALUES
(1, 'Sawah', 'Sawah adalah'),
(2, 'Pekarangan', 'Pekarangan adalah bla bla bla'),
(3, 'Perumahan', 'Perumahan adalah');

-- --------------------------------------------------------

--
-- Table structure for table `detail_log_penduduk`
--

CREATE TABLE IF NOT EXISTS `detail_log_penduduk` (
  `id` int(10) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE IF NOT EXISTS `dokumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `satuan` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dokumen`
--

INSERT INTO `dokumen` (`id`, `satuan`, `nama`, `enabled`, `tgl_upload`) VALUES
(1, 'Book1.xls', 'Pindah Keluarga', 1, '2015-12-14 06:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `gambar_gallery`
--

CREATE TABLE IF NOT EXISTS `gambar_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parrent` int(4) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(2) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipe` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gambar_gallery`
--

INSERT INTO `gambar_gallery` (`id`, `parrent`, `gambar`, `nama`, `enabled`, `tgl_upload`, `tipe`) VALUES
(1, 0, 'DSC_0040.JPG', 'Pindah Keluarga', 1, '2015-12-14 06:00:07', 0),
(2, 1, 'jjj.JPG', 'Surat Kematian', 1, '2015-12-14 06:00:34', 2);

-- --------------------------------------------------------

--
-- Table structure for table `garis`
--

CREATE TABLE IF NOT EXISTS `garis` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `path` text NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `ref_line` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `desk` text NOT NULL,
  `id_cluster` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gis_simbol`
--

CREATE TABLE IF NOT EXISTS `gis_simbol` (
  `simbol` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gis_simbol`
--

INSERT INTO `gis_simbol` (`simbol`) VALUES
('accident.png'),
('accident_2.png'),
('administration.png'),
('administration_2.png'),
('aestheticscenter.png'),
('agriculture.png'),
('agriculture2.png'),
('agriculture3.png'),
('agriculture4.png'),
('aircraft-small.png'),
('airplane-sport.png'),
('airplane-tourism.png'),
('airport-apron.png'),
('airport-runway.png'),
('airport-terminal.png'),
('airport.png'),
('airport_2.png'),
('amphitheater-tourism.png'),
('amphitheater.png'),
('ancientmonument.png'),
('ancienttemple.png'),
('ancienttempleruin.png'),
('animals.png'),
('animals_2.png'),
('anniversary.png'),
('apartment.png'),
('apartment_2.png'),
('aquarium.png'),
('arch.png'),
('archery.png'),
('artgallery.png'),
('atm.png'),
('atv.png'),
('audio.png'),
('australianfootball.png'),
('bags.png'),
('bank.png'),
('bank_2.png'),
('bankeuro.png'),
('bankpound.png'),
('bar.png'),
('bar_2.png'),
('baseball.png'),
('basketball.png'),
('baskteball2.png'),
('beach.png'),
('beach_2.png'),
('beautiful.png'),
('beautiful_2.png'),
('bench.png'),
('biblio.png'),
('bicycleparking.png'),
('bigcity.png'),
('billiard.png'),
('bobsleigh.png'),
('bomb.png'),
('bookstore.png'),
('bowling.png'),
('bowling_2.png'),
('boxing.png'),
('bread.png'),
('bread_2.png'),
('bridge.png'),
('bridgemodern.png'),
('bullfight.png'),
('bungalow.png'),
('bus.png'),
('bus_2.png'),
('butcher.png'),
('cabin.png'),
('cablecar.png'),
('camping.png'),
('camping_2.png'),
('campingsite.png'),
('canoe.png'),
('car.png'),
('car_2.png'),
('carrental.png'),
('carrepair.png'),
('carrepair_2.png'),
('carwash.png'),
('casino.png'),
('casino_2.png'),
('castle.png'),
('cathedral.png'),
('cathedral2.png'),
('cave.png'),
('cemetary.png'),
('chapel.png'),
('church.png'),
('church2.png'),
('church_2.png'),
('cinema.png'),
('cinema_2.png'),
('circus.png'),
('citysquare.png'),
('climbing.png'),
('clothes-female.png'),
('clothes-male.png'),
('clothes.png'),
('clothes_2.png'),
('clouds.png'),
('clouds_2.png'),
('cloudsun.png'),
('cloudsun_2.png'),
('club.png'),
('club_2.png'),
('cluster.png'),
('cluster2.png'),
('cluster3.png'),
('cluster4.png'),
('cluster5.png'),
('cocktail.png'),
('coffee.png'),
('coffee_2.png'),
('communitycentre.png'),
('company.png'),
('company_2.png'),
('computer.png'),
('computer_2.png'),
('concessionaire.png'),
('conference.png'),
('construction.png'),
('convenience.png'),
('convent.png'),
('corral.png'),
('country.png'),
('court.png'),
('cricket.png'),
('cross.png'),
('crossingguard.png'),
('cruise.png'),
('currencyexchange.png'),
('customs.png'),
('cycling.png'),
('cycling_2.png'),
('cyclingfeedarea.png'),
('cyclingmountain1.png'),
('cyclingmountain2.png'),
('cyclingmountain3.png'),
('cyclingmountain4.png'),
('cyclingmountainnotrated.png'),
('cyclingsport.png'),
('cyclingsprint.png'),
('cyclinguncategorized.png'),
('dam.png'),
('dancinghall.png'),
('dates.png'),
('dates_2.png'),
('daycare.png'),
('days-dim.png'),
('days-dom.png'),
('days-jeu.png'),
('days-jue.png'),
('days-lun.png'),
('days-mar.png'),
('days-mer.png'),
('days-mie.png'),
('days-qua.png'),
('days-qui.png'),
('days-sab.png'),
('days-sam.png'),
('days-seg.png'),
('days-sex.png'),
('days-ter.png'),
('days-ven.png'),
('days-vie.png'),
('dentist.png'),
('deptstore.png'),
('disability.png'),
('disability_2.png'),
('disabledparking.png'),
('diving.png'),
('doctor.png'),
('doctor_2.png'),
('dog-leash.png'),
('dog-offleash.png'),
('door.png'),
('down.png'),
('downleft.png'),
('downright.png'),
('downthenleft.png'),
('downthenright.png'),
('drinkingfountain.png'),
('drinkingwater.png'),
('drugs.png'),
('drugs_2.png'),
('elevator.png'),
('embassy.png'),
('entrance.png'),
('escalator-down.png'),
('escalator-up.png'),
('exit.png'),
('expert.png'),
('explosion.png'),
('factory.png'),
('factory_2.png'),
('fallingrocks.png'),
('family.png'),
('farm.png'),
('farm_2.png'),
('fastfood.png'),
('fastfood_2.png'),
('festival-itinerant.png'),
('festival.png'),
('findajob.png'),
('findjob.png'),
('findjob_2.png'),
('fire-extinguisher.png'),
('fire.png'),
('firemen.png'),
('firemen_2.png'),
('fireworks.png'),
('firstaid.png'),
('fishing.png'),
('fishing_2.png'),
('fishingshop.png'),
('fitnesscenter.png'),
('fjord.png'),
('flood.png'),
('flowers.png'),
('flowers_2.png'),
('followpath.png'),
('foodtruck.png'),
('forest.png'),
('fortress.png'),
('fossils.png'),
('fountain.png'),
('friday.png'),
('friday_2.png'),
('friends.png'),
('friends_2.png'),
('garden.png'),
('gateswalls.png'),
('gazstation.png'),
('gazstation_2.png'),
('geyser.png'),
('gifts.png'),
('girlfriend.png'),
('girlfriend_2.png'),
('glacier.png'),
('golf.png'),
('golf_2.png'),
('gondola.png'),
('gourmet.png'),
('grocery.png'),
('gun.png'),
('gym.png'),
('hairsalon.png'),
('handball.png'),
('hanggliding.png'),
('hats.png'),
('headstone.png'),
('headstonejewish.png'),
('helicopter.png'),
('highway.png'),
('highway_2.png'),
('hiking-tourism.png'),
('hiking.png'),
('hiking_2.png'),
('historicalquarter.png'),
('home.png'),
('home_2.png'),
('horseriding.png'),
('horseriding_2.png'),
('hospital.png'),
('hospital_2.png'),
('hostel.png'),
('hotairballoon.png'),
('hotel.png'),
('hotel1star.png'),
('hotel2stars.png'),
('hotel3stars.png'),
('hotel4stars.png'),
('hotel5stars.png'),
('hotel_2.png'),
('house.png'),
('hunting.png'),
('icecream.png'),
('icehockey.png'),
('iceskating.png'),
('im-user.png'),
('info.png'),
('info_2.png'),
('jewelry.png'),
('jewishquarter.png'),
('jogging.png'),
('judo.png'),
('justice.png'),
('justice_2.png'),
('karate.png'),
('karting.png'),
('kayak.png'),
('laboratory.png'),
('lake.png'),
('laundromat.png'),
('left.png'),
('leftthendown.png'),
('leftthenup.png'),
('library.png'),
('library_2.png'),
('lighthouse.png'),
('liquor.png'),
('lock.png'),
('lockerrental.png'),
('magicshow.png'),
('mainroad.png'),
('massage.png'),
('military.png'),
('military_2.png'),
('mine.png'),
('mobilephonetower.png'),
('modernmonument.png'),
('moderntower.png'),
('monastery.png'),
('monday.png'),
('monday_2.png'),
('monument.png'),
('mosque.png'),
('motorbike.png'),
('motorcycle.png'),
('movierental.png'),
('museum-archeological.png'),
('museum-art.png'),
('museum-crafts.png'),
('museum-historical.png'),
('museum-naval.png'),
('museum-science.png'),
('museum-war.png'),
('museum.png'),
('museum_2.png'),
('music-classical.png'),
('music-hiphop.png'),
('music-live.png'),
('music-rock.png'),
('music.png'),
('music_2.png'),
('nanny.png'),
('newsagent.png'),
('nordicski.png'),
('nursery.png'),
('observatory.png'),
('oilpumpjack.png'),
('olympicsite.png'),
('ophthalmologist.png'),
('pagoda.png'),
('paint.png'),
('palace.png'),
('panoramic.png'),
('panoramic180.png'),
('park-urban.png'),
('park.png'),
('park_2.png'),
('parkandride.png'),
('parking.png'),
('parking_2.png'),
('party.png'),
('patisserie.png'),
('pedestriancrossing.png'),
('pend.png'),
('pens.png'),
('perfumery.png'),
('personal.png'),
('personalwatercraft.png'),
('petroglyphs.png'),
('pets.png'),
('phones.png'),
('photo.png'),
('photodown.png'),
('photodownleft.png'),
('photodownright.png'),
('photography.png'),
('photoleft.png'),
('photoright.png'),
('photoup.png'),
('photoupleft.png'),
('photoupright.png'),
('picnic.png'),
('pizza.png'),
('pizza_2.png'),
('places-unvisited.png'),
('places-visited.png'),
('planecrash.png'),
('playground.png'),
('playground_2.png'),
('poker.png'),
('poker_2.png'),
('police.png'),
('police2.png'),
('police_2.png'),
('pool-indoor.png'),
('pool.png'),
('pool_2.png'),
('port.png'),
('port_2.png'),
('postal.png'),
('postal_2.png'),
('powerlinepole.png'),
('powerplant.png'),
('powersubstation.png'),
('prison.png'),
('publicart.png'),
('racing.png'),
('radiation.png'),
('rain_2.png'),
('rain_3.png'),
('rattlesnake.png'),
('realestate.png'),
('realestate_2.png'),
('recycle.png'),
('recycle_2.png'),
('recycle_3.png'),
('regroup.png'),
('regulier.png'),
('resort.png'),
('restaurant-barbecue.png'),
('restaurant-buffet.png'),
('restaurant-fish.png'),
('restaurant-romantic.png'),
('restaurant.png'),
('restaurant_2.png'),
('restaurantafrican.png'),
('restaurantchinese.png'),
('restaurantchinese_2.png'),
('restaurantfishchips.png'),
('restaurantgourmet.png'),
('restaurantgreek.png'),
('restaurantindian.png'),
('restaurantitalian.png'),
('restaurantjapanese.png'),
('restaurantjapanese_2.png'),
('restaurantkebab.png'),
('restaurantkorean.png'),
('restaurantmediterranean.png'),
('restaurantmexican.png'),
('restaurantthai.png'),
('restaurantturkish.png'),
('revolution.png'),
('right.png'),
('rightthendown.png'),
('rightthenup.png'),
('riparian.png'),
('ropescourse.png'),
('rowboat.png'),
('rugby.png'),
('ruins.png'),
('sailboat-sport.png'),
('sailboat-tourism.png'),
('sailboat.png'),
('salle-fete.png'),
('satursday.png'),
('satursday_2.png'),
('sauna.png'),
('school.png'),
('school_2.png'),
('schrink.png'),
('schrink_2.png'),
('sciencecenter.png'),
('seals.png'),
('seniorsite.png'),
('shadow.png'),
('shelter-picnic.png'),
('shelter-sleeping.png'),
('shoes.png'),
('shoes_2.png'),
('shoppingmall.png'),
('shore.png'),
('shower.png'),
('sight.png'),
('skateboarding.png'),
('skiing.png'),
('skiing_2.png'),
('skijump.png'),
('skilift.png'),
('smallcity.png'),
('smokingarea.png'),
('sneakers.png'),
('snow.png'),
('snowboarding.png'),
('snowmobiling.png'),
('snowshoeing.png'),
('soccer.png'),
('soccer2.png'),
('soccer_2.png'),
('spaceport.png'),
('spectacle.png'),
('speed20.png'),
('speed30.png'),
('speed40.png'),
('speed50.png'),
('speed60.png'),
('speed70.png'),
('speed80.png'),
('speed90.png'),
('speed100.png'),
('speed110.png'),
('speed120.png'),
('speed130.png'),
('speedhump.png'),
('spelunking.png'),
('stadium.png'),
('statue.png'),
('steamtrain.png'),
('stop.png'),
('stoplight.png'),
('stoplight_2.png'),
('strike.png'),
('strike1.png'),
('subway.png'),
('sun.png'),
('sun_2.png'),
('sunday.png'),
('sunday_2.png'),
('supermarket.png'),
('supermarket_2.png'),
('surfing.png'),
('suv.png'),
('synagogue.png'),
('tailor.png'),
('tapas.png'),
('taxi.png'),
('taxi_2.png'),
('taxiway.png'),
('teahouse.png'),
('telephone.png'),
('templehindu.png'),
('tennis.png'),
('tennis2.png'),
('tennis_2.png'),
('tent.png'),
('terrace.png'),
('text.png'),
('textiles.png'),
('theater.png'),
('theater_2.png'),
('themepark.png'),
('thunder.png'),
('thunder_2.png'),
('thursday.png'),
('thursday_2.png'),
('toilets.png'),
('toilets_2.png'),
('tollstation.png'),
('tools.png'),
('tower.png'),
('toys.png'),
('toys_2.png'),
('trafficenforcementcamera.png'),
('train.png'),
('train_2.png'),
('tram.png'),
('trash.png'),
('truck.png'),
('truck_2.png'),
('tuesday.png'),
('tuesday_2.png'),
('tunnel.png'),
('turnleft.png'),
('turnright.png'),
('university.png'),
('university_2.png'),
('up.png'),
('upleft.png'),
('upright.png'),
('upthenleft.png'),
('upthenright.png'),
('usfootball.png'),
('vespa.png'),
('vet.png'),
('video.png'),
('videogames.png'),
('videogames_2.png'),
('villa.png'),
('waitingroom.png'),
('water.png'),
('waterfall.png'),
('watermill.png'),
('waterpark.png'),
('waterskiing.png'),
('watertower.png'),
('waterwell.png'),
('waterwellpump.png'),
('wedding.png'),
('wednesday.png'),
('wednesday_2.png'),
('wetland.png'),
('white1.png'),
('white20.png'),
('wifi.png'),
('wifi_2.png'),
('windmill.png'),
('windsurfing.png'),
('windturbine.png'),
('winery.png'),
('wineyard.png'),
('workoffice.png'),
('world.png'),
('worldheritagesite.png'),
('yoga.png'),
('youthhostel.png'),
('zipline.png'),
('zoo.png'),
('zoo_2.png');

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE IF NOT EXISTS `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(100) NOT NULL,
  `tipe` int(4) NOT NULL DEFAULT '1',
  `urut` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `parrent` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`, `tipe`, `urut`, `enabled`, `parrent`) VALUES
(1, 'Berita Desa', 1, 1, 1, 0),
(2, 'Produk Desa', 1, 3, 1, 0),
(4, 'Agenda Desa', 2, 2, 1, 0),
(5, 'Peraturan Desa', 2, 5, 1, 0),
(6, 'Laporan Desa', 2, 6, 1, 0),
(8, 'Panduan Layanan Desa', 2, 3, 1, 0),
(15, 'Berita Daerah', 1, 0, 1, 1),
(17, 'teks_berjalan', 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kelompok`
--

CREATE TABLE IF NOT EXISTS `kelompok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_master` int(11) NOT NULL,
  `id_ketua` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ketua` (`id_ketua`),
  KEY `id_master` (`id_master`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_anggota`
--

CREATE TABLE IF NOT EXISTS `kelompok_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok` int(11) NOT NULL,
  `id_penduduk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_kelompok` (`id_kelompok`,`id_penduduk`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_master`
--

CREATE TABLE IF NOT EXISTS `kelompok_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kelompok` varchar(50) NOT NULL,
  `deskripsi` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `kelompok_master`
--

INSERT INTO `kelompok_master` (`id`, `kelompok`, `deskripsi`) VALUES
(1, 'Kelompok Ternak', '<p>Kelompok yang memelihara ternak</p>'),
(2, 'dasa wisma', ''),
(3, 'PKK', '<h2 style="color: black; font-weight: normal; margin: 1em 0px 0.25em; overflow: hidden; padding: 0px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: #aaaaaa; font-size: 1.5em; font-family: ''Linux Libertine'', Georgia, Times, serif; line-height: 1.3; font-style: normal; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-');

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi_analisis_keluarga`
--

CREATE TABLE IF NOT EXISTS `klasifikasi_analisis_keluarga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `jenis` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `id_artikel` int(7) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE IF NOT EXISTS `kontak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `kontak`
--

INSERT INTO `kontak` (`id`, `id_pend`, `no_hp`) VALUES
(1, 1, '65878789757');

-- --------------------------------------------------------

--
-- Table structure for table `kontak_grup`
--

CREATE TABLE IF NOT EXISTS `kontak_grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_grup` varchar(30) NOT NULL,
  `id_kontak` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `kontak_grup`
--

INSERT INTO `kontak_grup` (`id`, `nama_grup`, `id_kontak`) VALUES
(1, 'TES', 0),
(2, 'TES', 1);

-- --------------------------------------------------------

--
-- Table structure for table `line`
--

CREATE TABLE IF NOT EXISTS `line` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int(4) NOT NULL,
  `parrent` int(4) DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_bulanan`
--

CREATE TABLE IF NOT EXISTS `log_bulanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pend` int(11) NOT NULL,
  `lk` int(11) NOT NULL,
  `pr` int(11) NOT NULL,
  `kk` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_penduduk`
--

CREATE TABLE IF NOT EXISTS `log_penduduk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) NOT NULL,
  `id_detail` int(4) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` varchar(2) NOT NULL,
  `tahun` varchar(4) NOT NULL,
  `tgl_peristiwa` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_pend` (`id_pend`,`id_detail`,`tgl_peristiwa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_perubahan_penduduk`
--

CREATE TABLE IF NOT EXISTS `log_perubahan_penduduk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pend` int(11) NOT NULL,
  `id_cluster` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_surat`
--

CREATE TABLE IF NOT EXISTS `log_surat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_format_surat` int(4) NOT NULL,
  `id_pend` int(11) NOT NULL,
  `id_pamong` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE IF NOT EXISTS `lokasi` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `desk` text NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `lat` varchar(30) NOT NULL,
  `lng` varchar(30) NOT NULL,
  `ref_point` int(9) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_point` (`ref_point`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `media_sosial`
--

CREATE TABLE IF NOT EXISTS `media_sosial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` text NOT NULL,
  `link` text NOT NULL,
  `nama` varchar(100) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `media_sosial`
--

INSERT INTO `media_sosial` (`id`, `gambar`, `link`, `nama`, `enabled`) VALUES
(1, 'fb.png', 'https://www.facebook.com/combine.ri', 'Facebook', 1),
(2, 'twt.png', 'https://twitter.com/combineri', 'Twitter', 1),
(3, 'goo.png', 'http://plus.google.com/', 'Google Pluss', 1),
(4, 'yb.png', 'http://www.youtube.com/channel/UCk3eN9fI_eLGYzAn_lOlgXQ', 'Youtube', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `link` varchar(500) NOT NULL,
  `tipe` int(4) NOT NULL,
  `parrent` int(4) NOT NULL DEFAULT '1',
  `link_tipe` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `nama`, `link`, `tipe`, `parrent`, `link_tipe`, `enabled`) VALUES
(16, 'Profil Desa', 'artikel/32', 1, 1, 1, 1),
(17, 'Pemerintahan Desa', 'artikel/85', 1, 1, 1, 1),
(19, 'Lembaga Masyarakat', 'artikel/38', 1, 1, 1, 1),
(23, 'Teras Desa', '', 2, 1, 1, 1),
(24, 'Data Desa', 'artikel/82', 1, 1, 1, 1),
(31, 'Data Wilayah Administratif', 'statistik/15', 3, 24, 1, 1),
(32, 'Data Pendidikan dalam KK', 'statistik/0', 3, 24, 1, 1),
(33, 'Data Pendidikan Ditempuh', 'statistik/17', 3, 24, 1, 1),
(34, 'Data Pekerjaan', 'statistik/1', 3, 24, 1, 1),
(35, 'Data Agama', 'statistik/3', 3, 24, 1, 1),
(36, 'Data Jenis Kelamin', 'statistik/4', 3, 24, 1, 1),
(40, 'Data Golongan Darah', 'statistik/7', 3, 24, 1, 1),
(51, 'Data Kelompok Umur', 'statistik/12', 3, 24, 1, 1),
(54, 'Sejarah Desa', 'artikel/57', 3, 16, 0, 1),
(57, 'Visi dan Misi', 'artikel/8', 3, 17, 1, 1),
(58, 'Pemerintah Desa', 'artikel/35', 3, 17, 1, 1),
(62, 'Berita Desa', '', 2, 1, 1, 1),
(63, 'Agenda Desa', 'artikel/41', 2, 1, 1, 2),
(64, 'Peraturan Desa', 'peraturan', 2, 1, 1, 1),
(65, 'Panduan Layanan Desa', '#', 2, 1, 1, 1),
(66, 'Produk Desa', 'produk', 2, 1, 1, 1),
(68, 'Undang undang', 'artikel/42', 3, 64, 1, 2),
(69, 'Peraturan Pemerintah', 'artikel/43', 3, 64, 1, 2),
(70, 'Peraturan Daerah', '', 3, 64, 1, 2),
(71, 'Peraturan Bupati', '', 3, 64, 1, 2),
(72, 'Peraturan Bersama KaDes', '', 3, 64, 1, 2),
(73, 'Informasi Publik', '#', 2, 1, 1, 1),
(75, 'Rencana Kerja Anggaran', '', 3, 73, 1, 1),
(76, 'RAPB Desa', '', 3, 73, 1, 1),
(77, 'APB Desa', '', 3, 73, 1, 1),
(78, 'DPA', '', 3, 73, 1, 1),
(80, 'Profil Potensi Desa', 'artikel/59', 3, 16, 1, 1),
(84, 'LKMD', 'artikel/62', 3, 18, 1, 1),
(85, 'PKK', 'artikel/63', 3, 18, 1, 1),
(86, 'Karang Taruna', 'artikel/64', 3, 18, 1, 1),
(87, 'RT RW', 'artikel/65', 3, 18, 1, 1),
(88, 'Linmas', 'artikel/70', 3, 18, 1, 1),
(89, 'TKP2KDes', 'artikel/66', 3, 18, 1, 1),
(90, 'KPAD', 'artikel/67', 3, 18, 1, 1),
(91, 'Kelompok Ternak', 'artikel/68', 3, 18, 1, 1),
(92, 'Kelompok Tani', 'artikel/69', 3, 18, 1, 1),
(93, 'Kelompok Ekonomi Lainya', 'artikel/71', 3, 18, 1, 1),
(98, 'LKPJ', 'D:\\PEMERINTAHAN\\diklat\\lkpj2014', 3, 73, 1, 1),
(99, 'LPPD', '', 3, 73, 1, 1),
(100, 'ILPPD', '', 3, 73, 1, 1),
(101, 'Peraturan Desa', 'artikel/44', 3, 64, 1, 2),
(102, 'Peraturan Kepala Desa', 'artikel/45', 3, 64, 1, 2),
(103, 'Keputusan Kepala Desa', 'artikel/46', 3, 64, 1, 2),
(104, 'PBB', '', 3, 73, 1, 1),
(106, 'Data Warga Negara', 'statistik/13', 3, 24, 1, 1),
(108, 'Data Kelas Sosial', 'statistik_k/1', 3, 24, 1, 2),
(109, 'Kontak', 'artikel/36', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE IF NOT EXISTS `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  KEY `outbox_sender` (`SenderID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `outbox`
--

INSERT INTO `outbox` (`UpdatedInDB`, `InsertIntoDB`, `SendingDateTime`, `SendBefore`, `SendAfter`, `Text`, `DestinationNumber`, `Coding`, `UDH`, `Class`, `TextDecoded`, `ID`, `MultiPart`, `RelativeValidity`, `SenderID`, `SendingTimeOut`, `DeliveryReport`, `CreatorID`) VALUES
('2015-12-07 17:13:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '23:59:59', '00:00:00', NULL, '65878789757', 'Default_No_Compression', NULL, -1, 'coba kirim pesan ke banyak', 1, 'false', -1, NULL, '0000-00-00 00:00:00', 'default', '');

-- --------------------------------------------------------

--
-- Table structure for table `point`
--

CREATE TABLE IF NOT EXISTS `point` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `tipe` int(4) NOT NULL,
  `parrent` int(4) NOT NULL DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `polygon`
--

CREATE TABLE IF NOT EXISTS `polygon` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int(4) NOT NULL,
  `parrent` int(4) DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parrent` (`parrent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(256) NOT NULL,
  `ndesc` text NOT NULL,
  `sasaran` tinyint(1) NOT NULL DEFAULT '0',
  `sdate` datetime NOT NULL,
  `edate` datetime NOT NULL,
  `userID` int(11) NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `program_peserta`
--

CREATE TABLE IF NOT EXISTS `program_peserta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `peserta` decimal(18,0) NOT NULL,
  `sasaran` tinyint(1) NOT NULL,
  `userID` int(11) NOT NULL,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ref_bedah_rumah`
--

CREATE TABLE IF NOT EXISTS `ref_bedah_rumah` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ref_bedah_rumah`
--

INSERT INTO `ref_bedah_rumah` (`id`, `nama`) VALUES
(1, 'Ya'),
(2, 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `ref_blt`
--

CREATE TABLE IF NOT EXISTS `ref_blt` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ref_blt`
--

INSERT INTO `ref_blt` (`id`, `nama`) VALUES
(1, 'Ya'),
(2, 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `ref_jamkesmas`
--

CREATE TABLE IF NOT EXISTS `ref_jamkesmas` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ref_jamkesmas`
--

INSERT INTO `ref_jamkesmas` (`id`, `nama`) VALUES
(1, 'Ya'),
(2, 'Tidak'),
(3, 'LAINNYA');

-- --------------------------------------------------------

--
-- Table structure for table `ref_kelas_sosial`
--

CREATE TABLE IF NOT EXISTS `ref_kelas_sosial` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ref_kelas_sosial`
--

INSERT INTO `ref_kelas_sosial` (`id`, `nama`) VALUES
(1, 'Tidak Miskin'),
(2, 'Sedang'),
(3, 'Miskin'),
(4, 'Sangat Miskin');

-- --------------------------------------------------------

--
-- Table structure for table `ref_pkh`
--

CREATE TABLE IF NOT EXISTS `ref_pkh` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ref_pkh`
--

INSERT INTO `ref_pkh` (`id`, `nama`) VALUES
(1, 'Ya'),
(2, 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `ref_raskin`
--

CREATE TABLE IF NOT EXISTS `ref_raskin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ref_raskin`
--

INSERT INTO `ref_raskin` (`id`, `nama`) VALUES
(1, 'Ya'),
(2, 'Tidak');

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

CREATE TABLE IF NOT EXISTS `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`,`SequencePosition`),
  KEY `sentitems_date` (`DeliveryDateTime`),
  KEY `sentitems_tpmr` (`TPMR`),
  KEY `sentitems_dest` (`DestinationNumber`),
  KEY `sentitems_sender` (`SenderID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting_sms`
--

CREATE TABLE IF NOT EXISTS `setting_sms` (
  `autoreply_text` varchar(160) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setting_sms`
--

INSERT INTO `setting_sms` (`autoreply_text`) VALUES
('Terima kasih pesan Anda telah kami terima.');

-- --------------------------------------------------------

--
-- Table structure for table `sys_traffic`
--

CREATE TABLE IF NOT EXISTS `sys_traffic` (
  `Tanggal` date NOT NULL,
  `ipAddress` text NOT NULL,
  `Jumlah` int(10) NOT NULL,
  PRIMARY KEY (`Tanggal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sys_traffic`
--

INSERT INTO `sys_traffic` (`Tanggal`, `ipAddress`, `Jumlah`) VALUES
('2016-04-16', '127.0.0.1{}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tweb_alamat_sekarang`
--

CREATE TABLE IF NOT EXISTS `tweb_alamat_sekarang` (
  `id` int(11) NOT NULL,
  `jalan` varchar(100) NOT NULL,
  `rt` varchar(100) NOT NULL,
  `rw` varchar(100) NOT NULL,
  `dusun` varchar(100) NOT NULL,
  `desa` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kabupaten` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_cacat`
--

CREATE TABLE IF NOT EXISTS `tweb_cacat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tweb_cacat`
--

INSERT INTO `tweb_cacat` (`id`, `nama`) VALUES
(1, 'CACAT FISIK'),
(2, 'CACAT NETRA/BUTA'),
(3, 'CACAT RUNGU/WICARA'),
(4, 'CACAT MENTAL/JIWA'),
(5, 'CACAT FISIK DAN MENTAL'),
(6, 'CACAT LAINNYA'),
(7, 'TIDAK CACAT');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_desa_pamong`
--

CREATE TABLE IF NOT EXISTS `tweb_desa_pamong` (
  `pamong_id` int(5) NOT NULL AUTO_INCREMENT,
  `pamong_nama` varchar(100) DEFAULT NULL,
  `pamong_nip` varchar(20) DEFAULT NULL,
  `pamong_nik` varchar(20) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT '0',
  `pamong_status` varchar(45) DEFAULT NULL,
  `pamong_tgl_terdaftar` date DEFAULT NULL,
  PRIMARY KEY (`pamong_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tweb_desa_pamong`
--

INSERT INTO `tweb_desa_pamong` (`pamong_id`, `pamong_nama`, `pamong_nip`, `pamong_nik`, `jabatan`, `pamong_status`, `pamong_tgl_terdaftar`) VALUES
(1, 'Jarwo', '', '', 'Kepala Desa', '1', '2015-05-19'),
(2, 'Jarwo', '', '', '(A/n) Kepala Desa', '1', '2015-05-19');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_golongan_darah`
--

CREATE TABLE IF NOT EXISTS `tweb_golongan_darah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tweb_golongan_darah`
--

INSERT INTO `tweb_golongan_darah` (`id`, `nama`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'AB'),
(4, 'O'),
(5, 'A+'),
(6, 'A-'),
(7, 'B+'),
(8, 'B-'),
(9, 'AB+'),
(10, 'AB-'),
(11, 'O+'),
(12, 'O-'),
(13, 'TIDAK TAHU');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_keluarga`
--

CREATE TABLE IF NOT EXISTS `tweb_keluarga` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_kk` varchar(160) DEFAULT NULL,
  `nik_kepala` varchar(200) DEFAULT NULL,
  `tgl_daftar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kelas_sosial` int(4) DEFAULT NULL,
  `raskin` int(4) NOT NULL DEFAULT '2',
  `id_bedah_rumah` int(2) NOT NULL DEFAULT '2',
  `id_pkh` int(2) NOT NULL DEFAULT '2',
  `id_blt` int(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `nik_kepala` (`nik_kepala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `nik` decimal(16,0) NOT NULL,
  `id_kk` int(11) DEFAULT '0',
  `kk_level` tinyint(2) NOT NULL DEFAULT '0',
  `id_rtm` int(11) NOT NULL,
  `rtm_level` int(11) NOT NULL,
  `sex` tinyint(4) unsigned DEFAULT NULL,
  `tempatlahir` varchar(100) NOT NULL,
  `tanggallahir` date NOT NULL,
  `agama_id` int(10) unsigned NOT NULL,
  `pendidikan_kk_id` int(10) unsigned NOT NULL,
  `pendidikan_id` int(10) unsigned NOT NULL,
  `pendidikan_sedang_id` int(10) unsigned NOT NULL,
  `pekerjaan_id` int(10) unsigned NOT NULL,
  `status_kawin` tinyint(4) unsigned NOT NULL,
  `warganegara_id` int(10) unsigned NOT NULL,
  `dokumen_pasport` varchar(45) DEFAULT NULL,
  `dokumen_kitas` int(10) DEFAULT NULL,
  `ayah_nik` varchar(16) NOT NULL,
  `ibu_nik` varchar(16) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `golongan_darah_id` int(11) NOT NULL,
  `id_cluster` int(11) NOT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `alamat_sebelumnya` varchar(200) NOT NULL,
  `alamat_sekarang` varchar(200) NOT NULL,
  `status_dasar` tinyint(4) NOT NULL DEFAULT '1',
  `hamil` int(1) DEFAULT NULL,
  `cacat_id` int(11) DEFAULT NULL,
  `sakit_menahun_id` int(11) NOT NULL,
  `jamkesmas` int(11) NOT NULL DEFAULT '2',
  `akta_lahir` varchar(40) NOT NULL,
  `akta_perkawinan` varchar(40) NOT NULL,
  `tanggalperkawinan` date NOT NULL,
  `akta_perceraian` varchar(40) NOT NULL,
  `tanggalperceraian` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_agama`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_agama` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- Dumping data for table `tweb_penduduk_agama`
--

INSERT INTO `tweb_penduduk_agama` (`id`, `nama`) VALUES
(1, 'ISLAM'),
(2, 'KRISTEN'),
(3, 'KATHOLIK'),
(4, 'HINDU'),
(5, 'BUDHA'),
(6, 'KHONGHUCU'),
(7, 'Kepercayaan Terhadap Tuhan YME / Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_hubungan`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_hubungan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tweb_penduduk_hubungan`
--

INSERT INTO `tweb_penduduk_hubungan` (`id`, `nama`) VALUES
(1, 'KEPALA KELUARGA'),
(2, 'SUAMI'),
(3, 'ISTRI'),
(4, 'ANAK'),
(5, 'MENANTU'),
(6, 'CUCU'),
(7, 'ORANGTUA'),
(8, 'MERTUA'),
(9, 'FAMILI LAIN'),
(10, 'PEMBANTU'),
(11, 'LAINNYA');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_kawin`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_kawin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tweb_penduduk_kawin`
--

INSERT INTO `tweb_penduduk_kawin` (`id`, `nama`) VALUES
(1, 'BELUM KAWIN'),
(2, 'KAWIN'),
(3, 'CERAI HIDUP'),
(4, 'CERAI MATI');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_mandiri`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_mandiri` (
  `nik` varchar(20) NOT NULL,
  `pin` varchar(60) NOT NULL,
  `tanggal_buat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime NOT NULL,
  UNIQUE KEY `nik` (`nik`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_map`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_map` (
  `id` int(11) NOT NULL,
  `lat` varchar(24) NOT NULL,
  `lng` varchar(24) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_pekerjaan`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_pekerjaan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=90 ;

--
-- Dumping data for table `tweb_penduduk_pekerjaan`
--

INSERT INTO `tweb_penduduk_pekerjaan` (`id`, `nama`) VALUES
(1, 'BELUM/TIDAK BEKERJA'),
(2, 'MENGURUS RUMAH TANGGA'),
(3, 'PELAJAR/MAHASISWA'),
(4, 'PENSIUNAN'),
(5, 'PEGAWAI NEGERI SIPIL (PNS)'),
(6, 'TENTARA NASIONAL INDONESIA (TNI)'),
(7, 'KEPOLISIAN RI (POLRI)'),
(8, 'PERDAGANGAN'),
(9, 'PETANI/PERKEBUNAN'),
(10, 'PETERNAK'),
(11, 'NELAYAN/PERIKANAN'),
(12, 'INDUSTRI'),
(13, 'KONSTRUKSI'),
(14, 'TRANSPORTASI'),
(15, 'KARYAWAN SWASTA'),
(16, 'KARYAWAN BUMN'),
(17, 'KARYAWAN BUMD'),
(18, 'KARYAWAN HONORER'),
(19, 'BURUH HARIAN LEPAS'),
(20, 'BURUH TANI/PERKEBUNAN'),
(21, 'BURUH NELAYAN/PERIKANAN'),
(22, 'BURUH PETERNAKAN'),
(23, 'PEMBANTU RUMAH TANGGA'),
(24, 'TUKANG CUKUR'),
(25, 'TUKANG LISTRIK'),
(26, 'TUKANG BATU'),
(27, 'TUKANG KAYU'),
(28, 'TUKANG SOL SEPATU'),
(29, 'TUKANG LAS/PANDAI BESI'),
(30, 'TUKANG JAHIT'),
(31, 'TUKANG GIGI'),
(32, 'PENATA RIAS'),
(33, 'PENATA BUSANA'),
(34, 'PENATA RAMBUT'),
(35, 'MEKANIK'),
(36, 'SENIMAN'),
(37, 'TABIB'),
(38, 'PARAJI'),
(39, 'PERANCANG BUSANA'),
(40, 'PENTERJEMAH'),
(41, 'IMAM MASJID'),
(42, 'PENDETA'),
(43, 'PASTOR'),
(44, 'WARTAWAN'),
(45, 'USTADZ/MUBALIGH'),
(46, 'JURU MASAK'),
(47, 'PROMOTOR ACARA'),
(48, 'ANGGOTA DPR-RI'),
(49, 'ANGGOTA DPD'),
(50, 'ANGGOTA BPK'),
(51, 'PRESIDEN'),
(52, 'WAKIL PRESIDEN'),
(53, 'ANGGOTA MAHKAMAH KONSTITUSI'),
(54, 'ANGGOTA KABINET KEMENTERIAN'),
(55, 'DUTA BESAR'),
(56, 'GUBERNUR'),
(57, 'WAKIL GUBERNUR'),
(58, 'BUPATI'),
(59, 'WAKIL BUPATI'),
(60, 'WALIKOTA'),
(61, 'WAKIL WALIKOTA'),
(62, 'ANGGOTA DPRD PROVINSI'),
(63, 'ANGGOTA DPRD KABUPATEN/KOTA'),
(64, 'DOSEN'),
(65, 'GURU'),
(66, 'PILOT'),
(67, 'PENGACARA'),
(68, 'NOTARIS'),
(69, 'ARSITEK'),
(70, 'AKUNTAN'),
(71, 'KONSULTAN'),
(72, 'DOKTER'),
(73, 'BIDAN'),
(74, 'PERAWAT'),
(75, 'APOTEKER'),
(76, 'PSIKIATER/PSIKOLOG'),
(77, 'PENYIAR TELEVISI'),
(78, 'PENYIAR RADIO'),
(79, 'PELAUT'),
(80, 'PENELITI'),
(81, 'SOPIR'),
(82, 'PIALANG'),
(83, 'PARANORMAL'),
(84, 'PEDAGANG'),
(85, 'PERANGKAT DESA'),
(86, 'KEPALA DESA'),
(87, 'BIARAWATI'),
(88, 'WIRASWASTA'),
(89, 'LAINNYA');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_pendidikan`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_pendidikan` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tweb_penduduk_pendidikan`
--

INSERT INTO `tweb_penduduk_pendidikan` (`id`, `nama`) VALUES
(1, 'BELUM MASUK TK/KELOMPOK BERMAIN'),
(2, 'SEDANG TK/KELOMPOK BERMAIN'),
(3, 'TIDAK PERNAH SEKOLAH'),
(4, 'SEDANG SD/SEDERAJAT'),
(5, 'TIDAK TAMAT SD/SEDERAJAT'),
(6, 'SEDANG SLTP/SEDERAJAT'),
(7, 'SEDANG SLTA/SEDERAJAT'),
(8, 'SEDANG  D-1/SEDERAJAT'),
(9, 'SEDANG D-2/SEDERAJAT'),
(10, 'SEDANG D-3/SEDERAJAT'),
(11, 'SEDANG  S-1/SEDERAJAT'),
(12, 'SEDANG S-2/SEDERAJAT'),
(13, 'SEDANG S-3/SEDERAJAT'),
(14, 'SEDANG SLB A/SEDERAJAT'),
(15, 'SEDANG SLB B/SEDERAJAT'),
(16, 'SEDANG SLB C/SEDERAJAT'),
(17, 'TIDAK DAPAT MEMBACA DAN MENULIS HURUF LATIN/ARAB'),
(18, 'TIDAK SEDANG SEKOLAH');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_pendidikan_kk`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_pendidikan_kk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tweb_penduduk_pendidikan_kk`
--

INSERT INTO `tweb_penduduk_pendidikan_kk` (`id`, `nama`) VALUES
(1, 'TIDAK / BELUM SEKOLAH'),
(2, 'BELUM TAMAT SD/SEDERAJAT'),
(3, 'TAMAT SD / SEDERAJAT'),
(4, 'SLTP/SEDERAJAT'),
(5, 'SLTA / SEDERAJAT'),
(6, 'DIPLOMA I / II'),
(7, 'AKADEMI/ DIPLOMA III/S. MUDA'),
(8, 'DIPLOMA IV/ STRATA I'),
(9, 'STRATA II'),
(10, 'STRATA III');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_sex`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_sex` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tweb_penduduk_sex`
--

INSERT INTO `tweb_penduduk_sex` (`id`, `nama`) VALUES
(1, 'LAKI-LAKI'),
(2, 'PEREMPUAN');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_status`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tweb_penduduk_status`
--

INSERT INTO `tweb_penduduk_status` (`id`, `nama`) VALUES
(1, 'TETAP'),
(2, 'TIDAK AKTIF'),
(3, 'PENDATANG');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_umur`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_umur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  `dari` int(11) DEFAULT NULL,
  `sampai` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `tweb_penduduk_umur`
--

INSERT INTO `tweb_penduduk_umur` (`id`, `nama`, `dari`, `sampai`, `status`) VALUES
(1, 'BALITA', 0, 5, NULL),
(2, 'ANAK-ANAK', 6, 17, NULL),
(3, 'DEWASA', 18, 30, NULL),
(4, 'TUA', 31, 120, NULL),
(6, 'Dibawah 1 Tahun', 0, 1, 1),
(9, '2 s/d 4 Tahun', 2, 4, 1),
(12, '5 s/d 9 Tahun', 5, 9, 1),
(13, '10 s/d 14 Tah', 10, 14, 1),
(14, '15 s/d 19 Tahun', 15, 19, 1),
(15, '20 s/d 24 Tahun', 20, 24, 1),
(16, '25 s/d 29 Tahun', 25, 29, 1),
(17, '30 s/d 34 Tahun', 30, 34, 1),
(18, '35 s/d 39 Tahun ', 35, 39, 1),
(19, '40 s/d 44 Tahun', 40, 44, 1),
(20, '45 s/d 49 Tahun', 45, 49, 1),
(21, '50 s/d 54 Tahun', 50, 54, 1),
(22, '55 s/d 59 Tahun', 55, 59, 1),
(23, '60 s/d 64 Tahun', 60, 64, 1),
(24, '65 s/d 69 Tahun', 65, 69, 1),
(25, '70 s/d 74 Tahun', 70, 74, 1),
(26, 'Diatas 75 Tahun', 75, 99999, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_warganegara`
--

CREATE TABLE IF NOT EXISTS `tweb_penduduk_warganegara` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tweb_penduduk_warganegara`
--

INSERT INTO `tweb_penduduk_warganegara` (`id`, `nama`) VALUES
(1, 'WNI'),
(2, 'WNA'),
(3, 'DUA KEWARGANEGARAAN');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_rtm`
--

CREATE TABLE IF NOT EXISTS `tweb_rtm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik_kepala` int(11) NOT NULL,
  `no_kk` varchar(20) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kelas_sosial` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_rtm_hubungan`
--

CREATE TABLE IF NOT EXISTS `tweb_rtm_hubungan` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tweb_rtm_hubungan`
--

INSERT INTO `tweb_rtm_hubungan` (`id`, `nama`) VALUES
(1, 'Kepala Rumah Tangga'),
(2, 'Anggota');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_sakit_menahun`
--

CREATE TABLE IF NOT EXISTS `tweb_sakit_menahun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tweb_sakit_menahun`
--

INSERT INTO `tweb_sakit_menahun` (`id`, `nama`) VALUES
(1, 'JANTUNG'),
(2, 'LEVER'),
(3, 'PARU-PARU'),
(4, 'KANKER'),
(5, 'STROKE'),
(6, 'DIABETES MELITUS'),
(7, 'GINJAL'),
(8, 'MALARIA'),
(9, 'LEPRA/KUSTA'),
(10, 'HIV/AIDS'),
(11, 'GILA/STRESS'),
(12, 'TBC'),
(13, 'ASTHMA'),
(14, 'TIDAK ADA/TIDAK SAKIT');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_status_dasar`
--

CREATE TABLE IF NOT EXISTS `tweb_status_dasar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tweb_status_dasar`
--

INSERT INTO `tweb_status_dasar` (`id`, `nama`) VALUES
(1, 'HIDUP'),
(2, 'MATI'),
(3, 'PINDAH'),
(4, 'HILANG');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_surat_atribut`
--

CREATE TABLE IF NOT EXISTS `tweb_surat_atribut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_surat` int(11) NOT NULL,
  `id_tipe` tinyint(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `long` tinyint(4) NOT NULL,
  `kode` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_surat_format`
--

CREATE TABLE IF NOT EXISTS `tweb_surat_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `url_surat` varchar(100) NOT NULL,
  `kode_surat` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `tweb_surat_format`
--

INSERT INTO `tweb_surat_format` (`id`, `nama`, `url_surat`, `kode_surat`) VALUES
(1, 'Keterangan Pengantar', 'surat_ket_pengantar', 'FS-00X/DES'),
(2, 'Keterangan Penduduk', 'surat_ket_penduduk', 'FS-00X/DES'),
(3, 'Biodata Penduduk', 'surat_bio_penduduk', 'FS-00X/DES'),
(5, 'Keterangan Pindah Penduduk', 'surat_ket_pindah_penduduk', 'FS-00X/DES'),
(6, 'Keterangan Jual Beli', 'surat_ket_jual_beli', 'FS-00X/DES'),
(7, 'Pengantar Pindah Antar Kabupaten/ Provinsi', 'surat_pindah_antar_kab_prov', 'FS-00X/DES'),
(8, 'Pengantar SKCK', 'surat_ket_catatan_kriminal', 'FS-00X/DES'),
(9, 'Keterangan KTP dalam Proses', 'surat_ket_ktp_dlm_proses', 'FS-00X/DES'),
(10, 'Keterangan Beda Nama', 'surat_ket_beda_nama', 'FS-00X/DES'),
(11, 'Keterangan Bepergian / Jalan', 'surat_jalan', 'FS-00X/DES'),
(12, 'Keterangan Kurang Mampu', 'surat_ket_kurang_mampu', 'FS-00X/DES'),
(13, 'Pengantar Izin Keramaian', 'surat_izin_keramaian', 'FS-00X/DES'),
(14, 'Pengantar Laporan Kehilangan', 'surat_lap_kehilangan', 'FS-00X/DES'),
(15, 'Keterangan Usaha', 'surat_ket_usaha', 'FS-00X/DES'),
(16, 'Keterangan JAMKESOS', 'surat_ket_jamkesos', 'FS-00X/DES'),
(17, 'Keterangan Domisili Usaha', 'surat_ket_domisili_usaha', 'FS-00X/DES'),
(18, 'Keterangan Kelahiran', 'surat_ket_kelahiran', 'FS-00X/DES'),
(19, 'Keterangan Kehilangan', 'surat_ket_kehilangan', 'FS-00X/DES'),
(20, 'Permohonan Akta Lahir', 'surat_permohonan_akta', 'FS-00X/DES'),
(21, 'Pernyataan Akta Lahir', 'surat_pernyataan_akta', 'FS-00X/DES'),
(22, 'Permohonan Duplikat Kelahiran', 'surat_permohonan_duplikat_kelahiran', 'FS-00X/DES'),
(24, 'Keterangan Kematian', 'surat_ket_kematian', 'FS-00X/DES'),
(25, 'Keterangan Lahir Mati', 'surat_ket_lahir_mati', 'FS-00X/DES'),
(26, 'Keterangan Untuk Nikah (N-1)', 'surat_ket_nikah', 'FS-00X/DES'),
(27, 'Keterangan Asal Usul (N-2)', 'surat_ket_asalusul', 'FS-00X/DES'),
(28, 'Persetujuan Mempelai (N-3)', 'surat_persetujuan_mempelai', 'FS-00X/DES'),
(29, 'Keterangan Tentang Orang Tua (N-4)', 'surat_ket_orangtua', 'FS-00X/DES'),
(30, 'Izin Orang Tua(N-5)', 'surat_izin_orangtua', 'FS-00X/DES'),
(31, 'Keterangan Kematian Suami/Istri(N-6)', 'surat_ket_kematian_suami_istri', 'FS-00X/DES'),
(32, 'Pemberitahuan Kehendak Nikah (N-7)', 'surat_kehendak_nikah', 'FS-00X/DES'),
(33, 'Keterangan Pergi Kawin', 'surat_ket_pergi_kawin', 'FS-00X/DES'),
(34, 'Keterangan Wali', 'surat_wali', 'FS-00X/DES'),
(35, 'Keterangan Wali Hakim', 'surat_wali_hakim', 'FS-00X/DES'),
(36, 'Pengantar Permohonan Duplikat Surat Nikah', 'surat_permohonan_duplikat_surat_nikah', 'FS-00X/DES'),
(37, 'Permohonan Cerai', 'surat_permohonan_cerai', 'FS-00X/DES'),
(38, 'Keterangan Pengantar Rujuk/Cerai', 'surat_ket_rujuk_cerai', 'FS-00X/DES'),
(39, 'Ubah Sesuaikan', 'surat_ubah_sesuaikan', 'FS-00X/DES');

-- --------------------------------------------------------

--
-- Table structure for table `tweb_wil_clusterdesa`
--

CREATE TABLE IF NOT EXISTS `tweb_wil_clusterdesa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rt` varchar(10) NOT NULL DEFAULT '0',
  `rw` varchar(10) NOT NULL DEFAULT '0',
  `dusun` varchar(50) NOT NULL DEFAULT '0',
  `id_kepala` int(11) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `zoom` int(5) NOT NULL,
  `path` text NOT NULL,
  `map_tipe` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rt` (`rt`,`rw`,`dusun`),
  KEY `id_kepala` (`id_kepala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `id_grup` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_login` datetime NOT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `session` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `id_grup`, `email`, `last_login`, `active`, `nama`, `company`, `phone`, `foto`, `session`) VALUES
(1, 'admin', 'edc64352387aa108dac115ec1493d5d4', 1, 'admin@combine.or.id', '2015-12-07 05:13:52', 1, 'Administrator', 'ADMIN', '321', '', 'a8d4080245664ed2049c1b2ded7cac30'),
(56, 'redaksi', 'edc64352387aa108dac115ec1493d5d4', 3, '', '2015-03-25 16:20:01', 1, 'Redaksi', NULL, '', '', '39b3cc1ca3f8b095a171b19b1f307358'),
(57, 'operator', 'd8578edf8458ce06fbc5bb76a58c5ca4', 2, '', '2014-10-24 20:17:42', 1, 'Operator Desa', NULL, '', '', '9304194147916440da8be6d8f26f62f0'),
(58, 'kontributor', '5226e8adee665022dcbbdfc1b2699184', 4, 'tes@combine.or.id', '2015-09-02 11:35:48', 1, 'Kontributor', NULL, '009', '', '9a156690dff2a49a3d62d04f0ca36185');

-- --------------------------------------------------------

--
-- Table structure for table `user_grup`
--

CREATE TABLE IF NOT EXISTS `user_grup` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_grup`
--

INSERT INTO `user_grup` (`id`, `nama`) VALUES
(1, 'Administrator'),
(2, 'Operator'),
(3, 'Redaksi'),
(4, 'Kontributor');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
