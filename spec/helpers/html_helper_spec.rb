describe HtmlHelper do
  it '"to_table should" return table' do
    table = helper.to_table([{ 'a' => 1, 'b' => 2 }, { 'a' => 3, 'b' => 1}])
    table.should be_instance_of String
    table[/table/].should be == 'table'
    table[/td/].should be == 'td'
    table[/tr/].should be == 'tr'
    table[/th/].should be == 'th'
  end
end
