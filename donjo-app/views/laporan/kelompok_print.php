<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>Cetak Laporan Kelompok Rentan</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<?php echo base_url()?>assets/css/report.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">

<!-- Print Body -->
<div id="body">

	   <table  width="100%"><?php foreach($config as $data){?>	
				<tbody><tr>			
				<td width="37%"><h4>PEMERINTAH KABUPATEN/KOTA <?php echo unpenetration($data['nama_kabupaten'])?></h4></td>
																	
				<td align= "right" width="17%"><h4>LAMPIRAN A - 9</h4></td>		</tr>	
				<tr>				
					<td></td>
					<td width="100%"><h3>LAPORAN BULANAN DESA/KELURAHAN</h3></td>
					
									
				</tr>
				</tbody></table>
				<br>
				<table>
				<tbody><tr>						
					<td>Desa/Kelurahan</td>
					<td width="3%">:</td>
					<td width="38.5%"><?php echo unpenetration($data['nama_desa'])?></h4></td>
					<td></td>	

				</tr>
				<tr>					
					<td>Kecamatan</td>
					<td width="3%">:</td>
					<td width="38.5%"><?php echo unpenetration($data['nama_kecamatan'])?></td>
					<td></td>	
			<?php }?>	
				</tr>
				<tr>						
					<td>Laporan Bulan</td>
					<td width="3%">:</td>
			<?php $bln = date("m");?>
					<td><?php echo $bln?> </td>
					<td width="40%"></td>	
				</tr>
				<?php if($dusun){?>
				<tr>						
					<td>Dusun</td>
					<td width="3%">:</td>
					<td>
					<?php echo $dusun?>
					</td>
					<td width="40%"></td>	
				</tr>
				<?php }?>
		</tbody></table>
		<br>
	<table class="border thick">
	
<thead>
<?php if($_SESSION['dusun']!=''){?>
<tr>
	<h3>DATA PILAH DUSUN <?php echo $_SESSION['dusun'] ?></h3>
</tr>
<?php } ?>
<tr class="border thick">
	<th rowspan="2"><div align="center">DUSUN</div></th>
	<th rowspan="2"><div align="center">RW</div></th>
	<th rowspan="2"><div align="center">RT</div></th>
	<th colspan="2"><div align="center">KK</div></th>
	<th colspan="6"><div align="center">Kondisi dan Kelompok Umur</div></th>
	<th rowspan="2"><div align="center">Cacat</div></th>
	<th colspan="2"><div align="center">Sakit Menahun</div></th>
	<th rowspan="2"><div align="center">Hamil</div></th>
</tr>
<tr>
	<th><div align="center">L</div></th>
	<th><div align="center">P</div></th>
	<th><div align="center">Dibawah 1 Tahun</div></th>
	<th><div align="center">1-5 Tahun</div></th>
	<th><div align="center">6-12 Tahun</div></th>
	<th><div align="center">13-15 Tahun</div></th>
	<th><div align="center">16-18 Tahun</div></th>
	<th><div align="center">Diatas 60 Tahun</div></th>
	<th><div align="center">L</div></th>
	<th><div align="center">P</div></th>
</tr>
</thead>
<tbody>
<?php 
	$bayi=0;
	$balita=0;
	$sd=0;
	$smp=0;
	$sma=0;
	$lansia=0;
	$cacat=0;
	$sakit_L=0;
	$sakit_P=0;
	$hamil=0;
?>
<?php foreach($main as $data){?>
<td align="right"><?php echo $data['dusunnya']?></td>
<td align="right"><?php echo $data['rw']?></td>
<td align="right"><?php echo $data['rt']?></td>
<td align="right"><?php echo $data['L']?></td>
<td align="right"><?php echo $data['P']?></td>
<td width="13%" align="right"><?php echo $data['bayi']?></td>
<td width="14%" align="right"><?php echo $data['balita']?></td>
<td width="13%" align="right"><?php echo $data['sd']?></td>
<td width="15%" align="right"><?php echo $data['smp']?></td>
<td width="15%" align="right"><?php echo $data['sma']?></td>
<td width="13%" align="right"><?php echo $data['lansia']?></td>
<td align="right"><?php echo $data['cacat']?></td>
<td align="right"><?php echo $data['sakit_L']?></td>
<td align="right"><?php echo $data['sakit_P']?></td>
<td align="right"><?php echo $data['hamil']?></td>
<?php 
	$bayi=$bayi+$data['bayi'];
	$balita=$balita+$data['balita'];
	$sd=$sd+$data['sd'];
	$smp=$smp+$data['smp'];
	$sma=$sma+$data['sma'];
	$lansia=$lansia+$data['lansia'];
	$cacat=$cacat+$data['cacat'];
	$sakit_L=$sakit_L+$data['sakit_L'];
	$sakit_P=$sakit_P+$data['sakit_P'];
	$hamil=$hamil+$data['hamil'];
?>
</tr>
  <?php }?>
  </tbody>
  
<thead>
	<tr>
		<th colspan="5" align="center"><div align="center">Total</div></th>
		<th><div align="right"><?php  echo $bayi;?></div></th>
		<th><div align="right"><?php  echo $balita;?></div></th>
		<th><div align="right"><?php  echo $sd;?></div></th>
		<th><div align="right"><?php  echo $smp;?></div></th>
		<th><div align="right"><?php  echo $sma;?></div></th>
		<th><div align="right"><?php  echo $lansia;?></div></th>
		<th><div align="right"><?php  echo $cacat;?></div></th>
		<th><div align="right"><?php  echo $sakit_L;?></div></th>
		<th><div align="right"><?php  echo $sakit_P;?></div></th>
		<th><div align="right"><?php  echo $hamil;?></div></th>
	</tr>
</thead>
</table>   


<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

    </div>
	</div>
   <label>Tanggal cetak : &nbsp; </label><?php echo tgl_indo(date("Y m d"))?>
</div>

</body></html>
