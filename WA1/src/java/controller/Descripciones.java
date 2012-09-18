/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Andres
 */
@Entity
@Table(name = "descripciones")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Descripciones.findAll", query = "SELECT d FROM Descripciones d"),
    @NamedQuery(name = "Descripciones.findByCodigo", query = "SELECT d FROM Descripciones d WHERE d.codigo = :codigo"),
    @NamedQuery(name = "Descripciones.findByCategoria", query = "SELECT d FROM Descripciones d WHERE d.categoria = :categoria"),
    @NamedQuery(name = "Descripciones.findByDescripcion", query = "SELECT d FROM Descripciones d WHERE d.descripcion = :descripcion")})
public class Descripciones implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "codigo")
    private String codigo;
    @Size(max = 45)
    @Column(name = "categoria")
    private String categoria;
    @Size(max = 500)
    @Column(name = "descripcion")
    private String descripcion;
    @JoinColumn(name = "marca", referencedColumnName = "marca")
    @ManyToOne
    private Marcas marca;

    public Descripciones() {
    }

    public Descripciones(String codigo) {
        this.codigo = codigo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Marcas getMarca() {
        return marca;
    }

    public void setMarca(Marcas marca) {
        this.marca = marca;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Descripciones)) {
            return false;
        }
        Descripciones other = (Descripciones) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "controller.Descripciones[ codigo=" + codigo + " ]";
    }
    
}
