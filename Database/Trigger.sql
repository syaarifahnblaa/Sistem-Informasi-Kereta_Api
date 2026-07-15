CREATE OR REPLACE TRIGGER tDELPerjalanan
BEFORE DELETE
ON Perjalanan
FOR EACH ROW
BEGIN
    insertPerjalanan(
        :OLD.Perjalanan_id,
        :OLD.waktu_keberangkatan,
        :OLD.waktu_kedatangan,
        :OLD.tanggal_perjalanan,
        :OLD.kereta_id,
        :OLD.rute_id,
        :OLD.stasiun_id
    );
END;
