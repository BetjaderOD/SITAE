package utez.edu.mx.sitae_v1.model;


public class BeanAuthentication {
    private int id;
    private String email;
    private String password;
    private String rol;
    private String idstudent;
    public BeanAuthentication() {
    }

    public BeanAuthentication(int id, String email, String password, String rol, String idstudent) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.rol = rol;
        this.idstudent = idstudent;
    }

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getIdstudent() {
        return idstudent;
    }

    public void setIdstudent(String idstudent) {
        this.idstudent = idstudent;
    }
}

