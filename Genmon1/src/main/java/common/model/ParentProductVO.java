package common.model;

public class ParentProductVO {

   private String pid;                // 상품id
   private String pname;            // 상품명
   private int price;                // 상품정가
   private String pcontent;          // 상품설명
   private String pmaterial;         // 소재

   ////////////////////////////
   
   public ParentProductVO() {}

   public ParentProductVO(String pid, String pname, int price, String pcontent, String pmaterial) {
      super();
      this.pid = pid;
      this.pname = pname;
      this.price = price;
      this.pcontent = pcontent;
      this.pmaterial = pmaterial;
   }

   public String getPid() {
      return pid;
   }

   public void setPid(String pid) {
      this.pid = pid;
   }

   public String getPname() {
      return pname;
   }

   public void setPname(String pname) {
      this.pname = pname;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public String getPcontent() {
      return pcontent;
   }

   public void setPcontent(String pcontent) {
      this.pcontent = pcontent;
   }

   public String getPmaterial() {
      return pmaterial;
   }

   public void setPmaterial(String pmaterial) {
      this.pmaterial = pmaterial;
   }

   
}