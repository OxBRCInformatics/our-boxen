class projects::mdr {
  

  boxen::project { 'mdr':
    #dotenv        => true,
    #elasticsearch => true,
    #mysql         => true,
    #nginx         => true,
    #redis         => true,
    #ruby          => '1.9.3',
    source        => 'amilward/MDR'
  }
}