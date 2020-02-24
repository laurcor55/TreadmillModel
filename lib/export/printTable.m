function printTable(f, data, totalColumns)
  fprintf(f, '<link href="../minimal-table.css" rel="stylesheet" type="text/css">\n');
  fprintf(f, '<table>\n');

  for ii=1:length(data)
    fprintf(f, '\t<tr>\n');
    if (data{ii}{1} == 0)
      fprintf(f, '\t\t<th colspan="%d">%s</th>\n', totalColumns, data{ii}{2});
    else
      for jj=1:totalColumns
        fprintf(f, '\t\t<td>%s</td>\n',data{ii}{jj});
      end
    end
    fprintf(f, '\t</tr>\n');
  end
  fprintf(f, '</table>\n');
end