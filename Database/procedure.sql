CREATE OR REPLACE PROCEDURE insertPerjalanan
(
    idPerjalanan VARCHAR2,
    waktu_keberangkatan VARCHAR2,
    waktu_kedatangan VARCHAR2,
    tanggal_perjalanan DATE,
    kereta_id NUMBER,
    rute_id VARCHAR2,
    stasiun_id NUMBER
)
IS
BEGIN
    INSERT INTO historyPerjalanan
    (
        idhistPerjalanan,
        perjalanan_id,
        waktu_keberangkatan,
        waktu_kedatangan,
        rute_id,
        kereta_id,
        tanggal_perjalanan,
        stasiun_id
    )
    VALUES
    (
        idHis_Perjalanan_Seq.NEXTVAL,
        idPerjalanan,
        waktu_keberangkatan,
        waktu_kedatangan,
        rute_id,
        kereta_id,
        tanggal_perjalanan,
        stasiun_id
    );
END;
