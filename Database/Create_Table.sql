create table pegawai (
    pegawai_ID varchar2(2) PRIMARY KEY, 
    nama_depan varchar2(30),
    nama_belakang varchar2(30),
    tanggal_lahir date,
    gaji float,
    jam_kerja number,
    pekerjaan_ID number,
    stasiun_ID number,
    CONSTRAINT fk_pekerjaan FOREIGN KEY (pekerjaan_ID) references pekerjaan(pekerjaan_ID),
    CONSTRAINT Fk_stasiun FOREIGN KEY (stasiun_ID) references stasiun(stasiun_ID)
);


create table pekerjaan(
    pekerjaan_ID number primary key, 
    nama_pekerjaan varchar2(30)
);


create table stasiun(
    stasiun_ID number PRIMARY KEY, 
    nama_stasiun varchar2(30), 
    nama_kota varchar2(30), 
    nama_provinsi varchar2(30), 
    nama_jalan varchar2(30)
);

CREATE TABLE kereta (
    kereta_ID NUMBER PRIMARY KEY,
    nama_kereta VARCHAR2(30),
    status VARCHAR2(30),
    nomor_kursi NUMBER,
    kecepatan_maksimal NUMBER,
    pegawai_ID VARCHAR2(2),
    CONSTRAINT fk_pegawai FOREIGN KEY (pegawai_ID) REFERENCES pegawai(pegawai_ID)
);

CREATE TABLE rute (
    rute_ID VARCHAR2(2) PRIMARY KEY,
    nama_rute VARCHAR2(30),
    panjang_rute NUMBER,
    asal_ID NUMBER,
    tujuan_ID NUMBER,
    CONSTRAINT fk_asal FOREIGN KEY (asal_ID) REFERENCES stasiun (stasiun_ID), 
    CONSTRAINT fk_tujuan FOREIGN KEY (tujuan_ID ) REFERENCES stasiun (stasiun_ID)
);

CREATE TABLE perjalanan (
    perjalanan_ID VARCHAR2(2) PRIMARY KEY,
    waktu_keberangkatan VARCHAR2(30),
    waktu_kedatangan VARCHAR2(30),
    rute_ID VARCHAR2(2),
    kereta_ID NUMBER,
    stasiun_ID NUMBER,
    CONSTRAINT fk_rute FOREIGN KEY (rute_ID) REFERENCES rute(rute_ID),
    CONSTRAINT fk_kereta FOREIGN KEY (kereta_ID ) REFERENCES kereta(kereta_ID), 
    CONSTRAINT fk_stasiun_perjalanan FOREIGN KEY (stasiun_ID ) REFERENCES stasiun(stasiun_ID)
);

CREATE TABLE penumpang (
    penumpang_ID VARCHAR2(2) PRIMARY KEY,
    nama_depan VARCHAR2(30),
    nama_belakang VARCHAR2(30),
    umur NUMBER,
    nomor_kursi NUMBER,
    tiket_ID VARCHAR2(2)
);
alter table penumpang
add constraint fk_pnp
foreign key (tiket_id) references tiket(tiket_id);

CREATE TABLE tiket (
    tiket_ID VARCHAR2(2) PRIMARY KEY,
    status VARCHAR2(30),
    harga FLOAT,
    tanggal_pesan DATE,
    perjalanan_ID VARCHAR2(2),
    penumpang_ID VARCHAR2(2),
    CONSTRAINT fk_perjalanan FOREIGN KEY (perjalanan_ID ) REFERENCES perjalanan(perjalanan_ID ),
    CONSTRAINT fk_penumpang FOREIGN KEY (penumpang_ID) references penumpang(penumpang_ID)
);

CREATE TABLE historyPerjalanan (
    idhistPerjalanan NUMBER,
    perjalanan_id VARCHAR2(5),
    waktu_keberangkatan VARCHAR2(30),
    waktu_kedatangan VARCHAR2(30),
    rute_id VARCHAR2(5),
    kereta_id NUMBER,
    tanggal_perjalanan DATE,
    stasiun_id NUMBER,
    CONSTRAINT pk_histPerjalanan PRIMARY KEY (idhistPerjalanan)
);
