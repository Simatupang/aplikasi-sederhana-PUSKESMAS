program PuskesmasDayeuhkolot;
uses crt;

//const nMax = 1000;
type datapasien = record
        Nama : string;
        JK : String;
        usia : integer;
        riwayatPenyakit : string;
        noIdentitas : integer;
        end;

//tabPasient = array [1..Nmax] of dataPasien;

var


        tabPuskesmas : array [1..100] of dataPasien;
        tabPosyandu : array [1..100] of dataPasien;
        tabPosLansia : array [1..100] of dataPasien;
        //tabPasien : array [1..100] of dataPasien;
        //filedata : file of dataPasien;
        indeks : integer;
        pasien : datapasien;
        nama, JK : string;
        usia, noIdentitas : integer;
        riwayatPenyakit : string;


procedure sortingUsiaSelectionSort (var pasien : dataPasien; n : integer);
var
        i, j, imin, temp : integer;
begin
        for i := n downto 2 do
        begin
                imin :=1;
                for j:= 2 to i do
                begin
                        if tabPuskesmas[j].usia < tabPuskesmas[imin].usia then
                                begin
                                imin := j;
                                end;
                end;
                temp := tabPuskesmas[i].usia;
                tabPuskesmas[i].usia := tabPuskesmas[imin].usia;
                tabPuskesmas[imin].usia := temp;

        end;
end;

procedure sortingUsiabubblesort2(var tabPosyandu : array of dataPasien; n: integer);
var
	i,j,temp,pass: integer;
	stop: boolean;
begin
	i:=1;
	pass:=1;
	stop:=false;
	while(pass<=n-1) and (not stop) do
	begin
		stop:=true;
		for j:=n downto pass+1 do
		begin
			if (tabPosyandu[j].usia < tabPosyandu[j-1].usia) then
			begin
				stop:=false;
				temp:=TabPosyandu[j].usia;
				tabPosyandu[j].usia:=tabPosyandu[j-1].usia;
				tabPosyandu[j-1].usia:=temp;
			end;
		end;
	pass:=pass+1;
	i:=i+1;
	end;
end;

procedure sortingusiabubblesort1(var tabPosLansia : array of dataPasien; n:integer);
var
	i,j,temp: integer;
begin
	for i:=1 to n-1 do
	begin
		for j:=n downto i+1 do
		begin
			if(tabPosLansia[j].usia < tabPosLansia[j-1].usia) then
			begin
				temp:=tabPosLansia[j-1].usia;
				tabPosLansia[j-1].usia:=tabPosLansia[j].usia;
				tabPosLansia[j].usia:=temp;
			end;
		end;
	end;
end;


procedure printdata(var pasien : dataPasien; n : Integer);
var
        i : integer;
begin
        for i:= 1 to n do
        begin
                writeln('------------------------');
                writeln('Data pasien ke -',i);
                writeln('Nama : ',tabPuskesmas[i].nama);
                writeln('Jenis Kelamin : ',tabPuskesmas[i].JK);
                writeln('USIA : ',tabPuskesmas[i].usia);
                writeln('Riwayat Penyakit : ',tabpuskesmas[i].riwayatPenyakit);
                writeln('Nomor Identitas : ', tabPuskesmas[i].noIdentitas);
        end;
end;

procedure inputmenu ();
var
        pil, pilihan, plhn : Char;
        i, j, x, nmax, umur : integer;
begin
        writeln('DAFTAR MENU');
        writeln();
        writeln('Silahkan pilih Menu dibawah ini');
        writeln('1. Tambahkan Data Pasien Baru');
        writeln('2. Lihat Data Pasien'); // dengan sorting melihat data berdasarkan usia, nomor identitas
        writeln('3. Hapus Data Pasien');
        writeln('4. Edit Data Pasien'); //seracing berdasarkan nmr identitas trus edit trus simpan
        writeln('5. Lihat Pembagian Dana POSYANDU, POS LANSIA, DAN PUSKESMAS'); //sorting berdasarkan penggunaan uang
        writeln('0. Keluar');

        write('Pilihan Anda : '); readln(pil);

        case pil of

        '1' :   begin
                        clrscr;
                        writeln('pilihan Anda : ');
                        writeln('1. Add Pasien PUSKESMAS');
                        writeln('2. Add Pasien POSYANDU');
                        writeln('3. Add Pasien POS LANSIA');
                        writeln('4. Kembali Ke Menu Utama');

                        write('Pilihan : '); readln(pilihan);
                        write('Jumlah Pasien yang ingin ditambahkan : '); readln(nMax);

                        if(pilihan = '1') then
                                begin

                                for i:= 1 to nMax do
                                        for j:= nMax to i+1 do
                                        begin
                                        writeln('Pasien PUSKESMAS');
                                        write(' Nama : '); readln(tabPuskesmas[j].nama);
                                        write(' Jenis Kelamin : '); readln(tabPuskesmas[j].JK);
                                        write(' USIA : '); readln(tabPuskesmas[j].usia);
                                        write(' Riwayat Penyakit : '); readln(tabPuskesmas[j].riwayatPenyakit);
                                        write(' nomor Identitas : '); readln(tabPuskesmas[j].noIdentitas);

                                        writeln;
                                        writeln('>> Berhasil Ditambahkan <<');
                                        writeln;
                                        end;

                                inputmenu;
                                end
                        else if ( Pilihan = '2') then
                                Begin
                                for i:= 1 to nMax do
                                        for j:=nMax to i+1 do
                                        begin
                                        writeln('Pasien POSYANDU');
                                        write(' Nama : '); readln(tabPosyandu[j].nama);
                                        write(' Jenis Kelamin : '); readln(tabPosyandu[j].JK);
                                        write(' USIA : '); readln(tabPosyandu[j].usia);
                                        write(' Riwayat Penyakit : '); readln(tabPosyandu[j].riwayatPenyakit);
                                        write(' nomor Identitas : '); readln(tabPosyandu[j].noIdentitas);

                                        writeln;
                                        writeln('>> Berhasil ditambahkan <<');
                                        end;

                                inputmenu;
                                end

                        else if (pilihan = '3') then
                                begin
                                for i:= 1 to nMax do
                                        for j:= nMax to i+1 do
                                        begin
                                        writeln('Pasien POS LANSIA');
                                        write(' Nama : '); readln(tabPosLansia[j].nama);
                                        write(' Jenis Kelamin : '); readln(tabPosLansia[j].JK);
                                        write(' USIA : '); readln(tabPosLansia[j].usia);
                                        write(' Riwayat Penyakit: '); readln(tabPosLansia[j].riwayatPenyakit);
                                        write(' nomor Identitas : '); readln(tabPosLansia[j].noIdentitas);

                                        writeln;
                                        writeln('>> Berhasil Ditambahkan <<');
                                        end;

                                inputmenu;
                                end
                        else
                                inputmenu;

        end;


        '2' :   begin
                clrscr;
                writeln('pilih Pasien yang ingin Anda Lihat : ');
                writeln('1. Pasien PUSKESMAS');
                writeln('2. Pasien POSYANDU');
                writeln('3. Pasien POS LANSIA');
                writeln('4. Kembali Ke Menu Utama');

                write('Pilihan : '); readln(plhn);
                //write('Usia Pasien yang ingin diLihat : '); readln(umur);
                if (plhn = '1') then
                        begin
                        sortingusiaSelectionSort(pasien, nMax);
                        printdata(pasien, nMax);
                        end
                else if (plhn = '2') then
                        begin
                        sortingusiabubblesort2(tabPosyandu, nMax);
                        //printdata(tabPosyandu, nMax);
                        end
                else if (plhn = '3') then
                        begin
                        sortingusiabubblesort1(tabPosLansia, nMax);
                        //printdata(tabPosLansia, nMax);
                        end
                else
                        begin
                        writeln('Menu tidak Ada');
                        end;


        end;

        '3' :   Begin
                end;
        else
                writeln('MENU TIDAK DITEMUKAN');
                clrscr;
                inputmenu;

end;
end;
begin

        clrscr;
        inputmenu;
        readln;

end.
