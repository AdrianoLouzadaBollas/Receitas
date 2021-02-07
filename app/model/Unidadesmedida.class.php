<?php
/**
 * Unidadesmedida Active Record
 * @author  Adriano Louzada Bollas
 */
class Unidadesmedida extends TRecord
{
    const TABLENAME = 'unidadesmedida';
    const PRIMARYKEY= 'id';
    const IDPOLICY =  'max'; // {max, serial}
    
    
    /**
     * Constructor method
     */
    public function __construct($id = NULL, $callObjectLoad = TRUE)
    {
        parent::__construct($id, $callObjectLoad);
        parent::addAttribute('unidade');
    }


}
