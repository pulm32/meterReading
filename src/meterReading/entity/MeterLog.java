package meterReading.entity;

import java.util.Date;

public class MeterLog {
    private String meterId;
    private Date date;
    private float display;

    public MeterLog (){}

    public MeterLog (String meterId,Date date,float display){
        this.meterId = meterId;
        this.date = date;
        this.display = display;
    }

    public String getMeterId() {
        return meterId;
    }

    public void setMeterId(String meterId) {
        this.meterId = meterId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getDisplay() {
        return display;
    }

    public void setDisplay(float display) {
        this.display = display;
    }
}
