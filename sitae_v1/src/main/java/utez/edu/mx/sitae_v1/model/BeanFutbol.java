package utez.edu.mx.sitae_v1.model;

public class BeanFutbol {
    private int id;
    private String matricula;

    public BeanFutbol() {
    }

    public BeanFutbol(int id, String matricula) {
        this.id = id;
        this.matricula = matricula;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }
}
