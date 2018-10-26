object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 223
  Width = 333
  object SQLConexao: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=arecoteste'
      'User_Name=root'
      'Password=areia654'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    Left = 112
    Top = 64
  end
end
