package utez.edu.mx.sitae_v1.model;

public class BeanTaller {
    private int id;
    private String name;
    private String type;
    private String place;
    private String horario;
    private String filename;

    public BeanTaller() {
    }

    public BeanTaller(int id, String name, String type, String place, String horario, String filename) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.place = place;
        this.horario = horario;
        this.filename = filename;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

}
