/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author harry
 */
@Entity
@Table(name = "CARTDETAILS", catalog = "shopping", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cartdetails.findAll", query = "SELECT c FROM Cartdetails c"),
    @NamedQuery(name = "Cartdetails.findByCid", query = "SELECT c FROM Cartdetails c WHERE c.cid = :cid"),
    @NamedQuery(name = "Cartdetails.findByCref", query = "SELECT c FROM Cartdetails c WHERE c.cref = :cref"),
    @NamedQuery(name = "Cartdetails.findByQuantity", query = "SELECT c FROM Cartdetails c WHERE c.quantity = :quantity")})
public class Cartdetails implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "CID", nullable = false)
    private Integer cid;
    @Column(name = "CREF")
    private Integer cref;
    @Column(name = "QUANTITY")
    private Integer quantity;
    @JoinColumn(name = "PID", referencedColumnName = "PID")
    @ManyToOne
    private Product pid;

    public Cartdetails() {
    }

    public Cartdetails(Integer cid) {
        this.cid = cid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCref() {
        return cref;
    }

    public void setCref(Integer cref) {
        this.cref = cref;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Product getPid() {
        return pid;
    }

    public void setPid(Product pid) {
        this.pid = pid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cid != null ? cid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cartdetails)) {
            return false;
        }
        Cartdetails other = (Cartdetails) object;
        if ((this.cid == null && other.cid != null) || (this.cid != null && !this.cid.equals(other.cid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Cartdetails[ cid=" + cid + " ]";
    }
    
}
