package vn.iotstar.beautyshop.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Banner {
    private int id;
    private String title;
    private String description;
    private String image;
    private String link;
    private int displayOrder;
    private boolean isActive;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
