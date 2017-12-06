using BibliotecaGames.Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaGames.DAL
{
    public class JogoDao
    {


        public List<Jogo> ObterTodosOsJogos()
        {
            try
            {

                var command = new SqlCommand();
                command.Connection = Conexao.connection;
                command.CommandText = "SELECT * FROM jogos";

                Conexao.Conectar();

                var reader = command.ExecuteReader();

                var jogos = new List<Jogo>();

                while (reader.Read())
                {
                    var jogo = new Jogo();

                    jogo.Id = Convert.ToInt32(reader["id"]);
                    jogo.Imagem = reader["imagem"].ToString();
                    jogo.DataCompra = reader["datacompra"] == DBNull.Value ? (DateTime?) null : Convert.ToDateTime(reader["datacompra"]);
                    jogo.Titulo = reader["titulo"].ToString();
                    jogo.ValorPago = reader["valorpago"] == DBNull.Value ? (Double?) null :  Convert.ToDouble(reader["valorpago"]);

                    jogos.Add(jogo);
                }
                return jogos;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                Conexao.Desconectar();
            }
        }

        public int InserirJogo(Jogo jogo)
        {
           
                try
                {

                    var command = new SqlCommand();
                    command.Connection = Conexao.connection;
                    command.CommandText = @"INSERT INTO[dbo].[jogos]
                                                   ([titulo]
                                                   ,[valorPago]
                                                   ,[dataCompra]
                                                   ,[id_editor]
                                                   ,[id_genero]
                                                   ,[imagem])
                                             VALUES
                                                   (@titulo
                                                   ,@valorPago
                                                   ,@dataCompra
                                                   ,@id_editor
                                                   ,@id_genero
                                                   ,@imagem)";

                command.Parameters.AddWithValue("@titulo", jogo.Titulo);
                command.Parameters.AddWithValue("@valorPago", jogo.ValorPago);
                command.Parameters.AddWithValue("@dataCompra", jogo.DataCompra);
                command.Parameters.AddWithValue("@id_editor", jogo.IdEditor);
                command.Parameters.AddWithValue("@id_genero", jogo.IdGenero);
                command.Parameters.AddWithValue("@imagem", jogo.Imagem);

                Conexao.Conectar();
                return command.ExecuteNonQuery();    
                
                }
                catch (Exception)
                {

                    throw;
                }
                finally
                {
                    Conexao.Desconectar();
                }
            }
        }
}