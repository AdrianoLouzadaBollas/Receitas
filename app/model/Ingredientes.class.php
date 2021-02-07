<?php
/**
 * Ingredientes Active Record
 * @author  Adriano Louzada Bollas
 */
class Ingredientes extends TRecord
{
    const TABLENAME = 'ingredientes';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'max'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('nome');
    }


}
