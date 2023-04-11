<?php

class CountryModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getVoertuigen()
    {
        $sql = "SELECT  Id
                       ,Kenteken
                       ,Type
                       ,Bouwjaar
                       ,Brandstof
                       ,TypevoertuigId
                FROM   Voertuigen";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}
