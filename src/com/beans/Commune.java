package com.beans;

public class Commune {
	
	private Object codeCommune;
	private Object nomCommune;
	private Object codePostal;
	private Object libelle;
	private Object ligne;
	private Object latitude;
	private Object longitude;
	
	public Commune(Object codeCommune, Object nomCommune, Object codePostal, Object libelle, Object ligne, Object latitude, Object longitude) {
		this.codeCommune=codeCommune;
		this.nomCommune=nomCommune;
		this.codePostal=codePostal;
		this.libelle=libelle;
		this.ligne=ligne;
		this.latitude=latitude;
		this.longitude=longitude;
	}

	public Object getCodeCommune() {
		return codeCommune;
	}
	public void setCodeCommune(Object codeCommune) {
		this.codeCommune = codeCommune;
	}

	public Object getNomCommune() {
		return nomCommune;
	}
	public void setNomCommune(Object nomCommune) {
		this.nomCommune = nomCommune;
	}

	public Object getCodePostal() {
		return codePostal;
	}
	public void setCodePostal(Object codePostal) {
		this.codePostal = codePostal;
	}

	public Object getLibelle() {
		return libelle;
	}
	public void setLibelle(Object libelle) {
		this.libelle = libelle;
	}

	public Object getLigne() {
		return ligne;
	}
	public void setLigne(Object ligne) {
		this.ligne = ligne;
	}

	public Object getLatitude() {
		return latitude;
	}
	public void setLatitude(Object latitude) {
		this.latitude = latitude;
	}

	public Object getLongitude() {
		return longitude;
	}
	public void setLongitude(Object longitude) {
		this.longitude = longitude;
	}
	
}
