class projects::mdr {
  

  boxen::project { 'mdr':
    #dotenv        => true,
    #elasticsearch => true,
    #mysql         => true,
    source        => 'amilward/MDR'
  }
}