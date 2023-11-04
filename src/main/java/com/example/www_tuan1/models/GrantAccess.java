package com.example.www_tuan1.models;

public class GrantAccess {

    private Account account;
    private Role role;
    private boolean isGrant;
    private String note;

    public GrantAccess() {
    }

    public GrantAccess(Account account, Role role, boolean isGrant, String note) {
        this.account = account;
        this.role = role;
        this.isGrant = isGrant;
        this.note = note;
    }



    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isGrant() {
        return isGrant;
    }

    public void setGrant(boolean grant) {
        isGrant = grant;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    @Override
    public String toString() {
        return "GrantAccess{" +
                "account=" + account.getAccountId() +
                ", role=" + role.getRoleId() +
                ", isGrant=" + isGrant +
                ", note='" + note + '\'' +
                '}';
    }
}
