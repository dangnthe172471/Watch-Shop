
package model;

public class Comment {

    private int id;
    private String content;
    private int voted;
    private Account account;
    private Product product;

    public Comment() {
    }

    public Comment(int id, String content, int voted, Account account, Product product) {
        this.id = id;
        this.content = content;
        this.voted = voted;
        this.account = account;
        this.product = product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getVoted() {
        return voted;
    }

    public void setVoted(int voted) {
        this.voted = voted;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
