program puskesmasDayeuhkolot;
uses crt;

type dataPasien = record
        nama : string;
        noIdentitas : integer;
        JK : string;
        penyakit : string;
        usia: integer;
        tRawat : string;

end;

var

        tabPasien : array [1..1000] of dataPasien;
        filedata : file of dataPasien;
        apbd : longint;
        pil,Ul : char;
        i, x : integer;


procedure Menu;
begin
        clrscr;

        writeln('------------------------------------------------------------------------');
        writeln('               P U S K E S M A S   D A Y E U H K O L O T                ');
        writeln('                     SELAMAT DATANG DI MENU UTAMA                       ');
        writeln('alamat : Jln. Telekomunikasi No.1 Terusan Buah Batu, Bandung, Jawa barat');
        writeln('------------------------------------------------------------------------');

        writeln('         1. Tambah Data Pasien    '); writeln;
        writeln('         2. Edit Data Pasien      '); writeln;
        writeln('         3. Hapus Data pasien     '); writeln;
        writeln('         4. tampilkan data Pasien '); writeln;
        writeln('         5. Pembagian Dana Bantuan Pemerintah '); writeln;
        writeln('         6. Cek Data Pasien       '); writeln;
        writeln('         0. Keluar                '); writeln;
        write('            Pilihan Anda : '); pil:=readkey

end;

procedure bukafile;
begin
assign (filedata,'dat.txt');
{$i-};
reset (filedata);
{si+};
end;

procedure TambahDataPasien;
var
        lagi, pil : char;
        ada : boolean;
        i, x, nMax : integer;
        NOCR : word;
begin
        Ul := 'Y';
        lagi :='Y';
        clrscr;
        bukafile;
        if (IOResult<>0) then
                rewrite (filedata);
        repeat
                clrscr;
                ada:=false;
                i:=0;
                writeln('        ------------------------');
                writeln ('          Tambah Data Pasien   ');
                writeln('        ------------------------');
                writeln;
                write('        jumlah pasien    : ');
                readln(nMax);
                for x:= 1 to nMax do
                        begin
                        writeln('Kode : >> '); readln (nocr);
                        while (ada=false) and (i<>filesize(filedata)) do
                                begin
                                        seek(filedata,i);
                                        read(filedata, tabPasien[x]);
                                        if (tabPasien[x].noIdentitas = nocr) then
                                                ada:=true
                                        else
                                                i:= i+1;
                                end;

                                if (ada=true) then
                                        begin
                                        write('Kode "',nocr,'" sudah ada !');
                                        end
                                else
                                        begin
                                        seek(filedata,filesize(filedata));
                                        tabPasien[x].noIdentitas:=nocr;
                                        writeln;
                                        write('        Nama Pasien      : '); readln(tabPasien[x].nama);
                                        writeln;
                                        write('        Nomor Identitas  : '); readln(tabPasien[x].noIdentitas);
                                        writeln;
                                        write('        Usia             : '); readln(tabPasien[x].usia);
                                        writeln;
                                        write('        Riwayat Penyakit : '); readln(tabPasien[x].penyakit);
                                        writeln;
                                        write('        Jenis Kelamin    : '); readln(tabPasien[x].JK);
                                        writeln;
                                        write('        Tempat di Rawat  : '); readln(tabPasien[x].tRawat);

                                        write (filedata, tabPasien[x]);
                                        writeln;
                                        writeln('        S U K S E S');
                                        end;
                        end;
                        writeln;
                        write('Tambah Data Lagi (Y/T) ? '); lagi:=upcase(readkey);

        until (lagi<>'Y');
        close(filedata);
end;

procedure EditDataPasien;
var
        lagi : char;
        ada : boolean;
        i : integer;
        nocr : word;
begin
        ul :='Y';
        lagi:='Y';
        clrscr;
        bukafile;
        if (IOresult <> 0) then
                write ('>> Data Masih Kosong << ')
        else
                begin
                repeat
                        clrscr;
                        ada:=false;
                        i:=0;
                        writeln ('------------------------------------');
                        writeln ('          Edit Data Pasien          ');
                        writeln ('------------------------------------');
                        writeln;
                        write('  Kode : '); readln(nocr);

                        while (ada = false) and (filesize (filedata)<> i) do
                                //for a:= x to max do
                                begin
                                seek (filedata, i);
                                read (filedata, tabPasien[x]);
                                if tabPasien[x].noIdentitas = nocr then
                                        begin
                                        ada:=true;
                                        writeln('--------------------------------');
                                        writeln('||         Data Awal          ||');
                                        writeln('--------------------------------');
                                        write('Nama             : '); writeln (tabPasien[x].nama);
                                        write('Nomor Identitas  : '); writeln (tabpasien[x].noIdentitas);
                                        write('Jenis Kelamin    : '); writeln (tabPasien[x].JK);
                                        write('Riwayat Penyakit : '); writeln (tabPasien[x].penyakit);
                                        write('Usia             : '); writeln (tabPasien[x].usia);
                                        write('Tempat di Rawat  : '); writeln (tabPasien[x].tRawat);
                                        end

                                else
                                        i:= i+1;
                                end;

                                if (ada=true) then
                                        begin
                                        tabPasien[x].noIdentitas:=nocr;
                                        writeln('---------------------------------');
                                        writeln('    >> Data Setelah Diedit <<    ');
                                        writeln('---------------------------------');
                                        write('Nama             : ');readln(tabPasien[x].nama);
                                        write('nomor Identitas  : ');readln(tabPasien[x].noIdentitas);
                                        write('Jenis Kelamin    : ');readln(tabPasien[x].JK);
                                        write('Riwayat Penyakit : ');readln(tabPasien[x].penyakit);
                                        write('Usia             : ');readln(tabPasien[x].usia);
                                        write('Tempat di Rawat  : '); readln(tabPasien[x].tRawat);
                                        seek(filedata,i);
                                        write(filedata,tabPasien[x]);
                                        end
                                else
                                        begin
                                        writeln;
                                        write('Kode Pasien "',nocr,'" Tidak Ada ');
                                        writeln;
                                        end;

                        write('Edit Lagi? Y/T '); lagi:=upcase(readkey);
                until (lagi<>'Y');
                end;
                close(filedata);
end;


procedure HapusDataPasien;
var
        filetmp : file of dataPasien;
        lagi,hapus: char;
        ada : boolean;
        i : integer;
        nocr : word;
begin
        Ul :='Y';
        lagi:='Y';
        clrscr;
        repeat
                bukafile;
                if ioresult<>0 then
                        write('>> Data Masih Kosong << ')
                else
                        begin
                        clrscr;
                        assign(filetmp,'dat.tmp');
                        rewrite(filetmp);
                        ada:=false;
                        i:=0;
                        writeln(' -----------------------');
                        writeln('    Hapus Data Pasien   ');
                        writeln(' -----------------------');
                        writeln;
                        write('  Kode : >> '); readln(nocr);
                        while (ada=false) and (i <> filesize(filedata)) do
                                begin
                                seek(filedata,i);
                                read(filedata,tabPasien[x]);
                                if tabPasien[x].noIdentitas = nocr then
                                        ada:=true
                                else
                                        i:=i+1;
                                end;
                                if (ada=true) then
                                        begin
                                        writeln('---------------------------------------');
                                        write('Nama             : '); writeln(tabPasien[x].nama);
                                        write('Nomor Identitas  : '); writeln(tabPasien[x].noIdentitas);
                                        write('Jenis Kelamin    : '); writeln(tabPasien[x].JK);
                                        write('Riwayat Penyakit : '); writeln(tabPasien[x].penyakit);
                                        write('Usia             : '); writeln(tabPasien[x].usia);
                                        write('Tempat di Rawat  : '); writeln(tabPasien[x].tRawat);
                                        writeln('---------------------------------------');
                                        writeln;
                                        write('Hapus Data Ini ? Y/T ');readln (hapus);
                                        if upcase (hapus)='Y' then
                                                begin
                                                        for i :=1 to filesize(filedata) do
                                                                begin
                                                                        seek(filedata,i-1);
                                                                        read(filedata,tabPasien[x]);
                                                                        if tabPasien[x].noIdentitas<>nocr then
                                                                                write(filetmp,tabPasien[x]);
                                                                end;
                                                        close(filedata);
                                                        assign(filedata,'dat.txt');
                                                        erase(filedata);
                                                        assign(filetmp,'dat.tmp');
                                                        rename(filetmp,'dat.txt');
                                                        write('Kode ',nocr,' Sudah Dihapus ');
                                                end;
                                        end
                else
                        begin
                        write('Kode ini Sudah Dihapus ');
                        end;

                write('Hapus Data Yang Lain ? Y/T '); Lagi :=upcase(readkey);

                end;
        until (lagi<>'Y');

end;

procedure tampilkandataPasien;
var
        i, j, imin, temp : integer;
begin
        for i := x downto 2 do
        begin
                imin :=1;
                for j:= 2 to i do
                begin
                        if tabPasien[j].usia < tabPasien[imin].usia then
                                begin
                                imin := j;
                                end;
                end;
                temp := tabPasien[j].usia;
                tabPasien[j].usia := tabPasien[imin].usia;
                tabPasien[imin].usia := temp;

        end;
        for x:= j to 1 do
                writeln('---------------------------------------');
                write('Nama             : '); writeln(tabPasien[x].nama);
                write('Nomor Identitas  : '); writeln(tabPasien[x].noIdentitas);
                write('Jenis Kelamin    : '); writeln(tabPasien[x].JK);
                write('Riwayat Penyakit : '); writeln(tabPasien[x].penyakit);
                write('Usia             : '); writeln(tabPasien[x].usia);
                write('Tempat di Rawat  : '); writeln(tabPasien[x].tRawat);
                writeln('---------------------------------------');
                writeln;
                readln;
end;

procedure tampil;
var
        ada : boolean;
        i : integer;
begin
        ada := False;
        i:= 0;
        for x := 1 to length(tabPasien) do
                        begin
                        writeln('Kode : >> '); writeln (tabPasien[x].noIdentitas);
                        seek(filedata,i);
                        read(filedata, tabPasien[x]);
                        while (ada=false) and (i<>filesize(filedata)) do
                                        begin
                                        seek(filedata,filesize(filedata));
                                        writeln;
                                        write('        Nama Pasien      : '); writeln(tabPasien[x].nama);
                                        writeln;
                                        write('        Nomor Identitas  : '); writeln(tabPasien[x].noIdentitas);
                                        writeln;
                                        write('        Usia             : '); writeln(tabPasien[x].usia);
                                        writeln;
                                        write('        Riwayat Penyakit : '); writeln(tabPasien[x].penyakit);
                                        writeln;
                                        write('        Jenis Kelamin    : '); writeln(tabPasien[x].JK);
                                        writeln;
                                        write('        Tempat di Rawat  : '); writeln(tabPasien[x].tRawat);
                                        end;
                        end;
        end;
procedure PembagianDana;
var
        Jlh, Jlh1, Jlh2, Jlh3 : integer;
        totKeb,totKekurangan, keb1, keb2, keb3 : Longint;
begin

        clrscr;
        writeln('Masukkan Dana APBD : ');
        readln(apbd);
        write('Masukkan Jumlah Pasien Posyandu : ');
        readln(Jlh1);
        write('Masukkan Jumlah Pasien Pos Lansia : ');
        readln(Jlh2);
        write('Masukkan Jumlah Pasien Puskesmas : ');
        readln(Jlh3);
        jlh := Jlh1+jlh2+jlh3;

        keb1 := Jlh1 * 50000;
        keb2 := Jlh2 * 50000;
        keb3 := Jlh3 * 50000;
        totKeb := keb1 + keb2 + keb3;
        totKekurangan := apbd-totkeb;
        writeln('====================================================================================');
        writeln('Instansi       Jumlah Pasien           Kebutuhan Dana           Kekurangan/Kelebihan');
        writeln('PUSKESMAS           ',Jlh3,'                     ',keb3,'                           ');
        writeln('POSYANDU            ',Jlh1,'                     ',keb1,'                           ');
        writeln('POS LANSIA          ',Jlh2,'                     ',Keb2,'                           ');
        writeln('____________________________________________________________________________________ _');
        writeln('Total               ',Jlh,'                    ',totKeb,'                    ',TotKekurangan);
        readln;
end;

{procedure cekdataPasien;
var

begin

end;
}


procedure closeProgram;
begin
        clrscr;
        writeln;
        writeln;
        writeln;
        writeln;
        writeln('               =================================================               ');
        writeln('               =================================================               ');
        writeln('                   H O V E L Y   W.  Z.  S I M A T U P A N G                   ');
        writeln('                      [1   3   0   1   6   4   1   6   7]                      ');
        writeln('                              [I F - 3 9 GAB 0 2]                              ');
        writeln('                       T E L K O M   U N I V E R S I T Y                       ');
        writeln('                         2        0        1         7                         ');
        writeln('               =================================================               ');
        writeln('               =================================================               ');
        readln;

end;

begin
        repeat
                menu;
                case pil of
                        '1' : TambahDataPasien;
                        '2' : EditDataPasien;
                        '3' : HapusDataPasien;
                        '4' : tampil;
                        '5' : PembagianDana;
                        //'6' : cekdataPasien;
                        '0' : CloseProgram;
                end;
        until ( ul<>'Y' ) or ( pil = '4' );

end.
