// RsInstrument Exemplos para Analisadores de Espectro
// Procedimentos:
// - Instalar Rohde & Schwarz VISA 5.12.3+ pelo link https://www.rohde-schwarz.com/appnote/1dc02


using System;
using MatheusProductions.KeysightLib;
using MatheusProductions.RodheLib;
using RohdeSchwarz.RsInstrument; // Biblioteca que providencia os comandos. Procure ela no www.nuget.org
using Ivi.Visa.Interop;
using System.Threading;
using System.IO;

namespace MatheusProductions.AutomacaoN9010A
{

    public class AutomacaoN9010A
    {
        ResourceManager rm;
        FormattedIO488 instr;

        public bool ConectaIP(string ip)
        {
            rm = new ResourceManager();
            instr = new FormattedIO488();
            return Keysight.Inicializacao(instr, rm, "TCPIP0::" + ip + "::INSTR");
        }

        private void Start()
        {
            instr.WriteString("*RST;*CLS"); // Reinicialize o instrumento, limpe a fila de erros
            instr.WriteString("INIT:CONT ON"); // Desliga a varredura contínua
            instr.WriteString("DISP:ENAB ON"); // Display update ON - Desligar após a depuração
            instr.IO.Timeout = 2000;// tempo limite de varredura - defina ele mais alto do que o tempo de aquisição do instrumento
        }

        public void Largura_6dB(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try 
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "100", "300", "ON", "MAXH", "POS", "OBW", "99", "-6");
                    instr.WriteString("INIT");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Largura 6db", tPrints);
                    instr.WriteString("FETC:OBW:XDB?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Keysight.SalvaValores("Largura_6dB.csv", nomePasta, val, valFreq, nome);
                }
                else
                {
                    Rodhe.ConfiguraInstr6(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "100", "300", "ON", "MAXH", "POS", "OBW", "99", "6");
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    Rodhe.PegaMarker(instr);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Largura 6db", tPrints, "PNG");
                    instr.WriteString("CALC:MARK1:FUNC:POW:RES? OBW");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Rodhe.SalvaValores("Largura_6dB.csv", nomePasta, val, valFreq, nome);
                }
            }
            catch
            {
            }
        }

        public void Largura_20dB(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                // Seta as configurções basicas
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "30", "100", "ON", "MAXH", "POS", "OBW", "99", "-20");
                    instr.WriteString("INIT");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("FETC:OBW:XDB?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Largura 20db", tPrints);
                    Keysight.SalvaValores("Largura_20dB.csv", nomePasta, val, valFreq, nome);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "30", "100", "ON", "MAXH", "POS", "OBW", "99", "20");
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    Rodhe.PegaMarker(instr);
                    instr.WriteString("CALC:MARK1:FUNC:NDBD:RES?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Largura 20db", tPrints, "PNG");
                    Rodhe.SalvaValores("Largura_20dB.csv", nomePasta, val, valFreq, nome);
                }
            }
            catch 
            {
            }
        }

        public void GetMarkers(string valFreq, string nome, string marca, string ip, int numMarkers, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                if (marca == "Agilent")
                {
                    instr.WriteString("INIT:CONT OFF");
                    Keysight.Pega_Salva_MarkersSCS(instr, "Separacao_Entre_Canais_de_Salto.csv", nomePasta, valFreq, nome, numMarkers);

                }
                else
                {
                    instr.WriteString("INIT:CONT OFF");
                    Rodhe.Pega_Salva_MarkersSCS(instr, "Separacao_Entre_Canais_de_Salto.csv", nomePasta, valFreq, nome, 3);

                }
            }
            catch
            {
            }
        }


        public void GetMarkersNmrOcu(string valFreq, string nome, string marca, string ip, int numMarkers, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                if (marca == "Agilent")
                {
                    Keysight.SalvaValores("Numero_de_Ocupações.csv", nomePasta,Convert.ToString(numMarkers), valFreq, nome);
                }
                else
                {
                    Rodhe.SalvaValores("Numero_de_Ocupações.csv", nomePasta, Convert.ToString(numMarkers), valFreq, nome);
                }
            }
            catch
            {
            }
        }


        public void GetMarkersTempo(string valFreq, string nome, string marca, string ip, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                if (marca == "Agilent")
                {
                    instr.WriteString("INIT:CONT OFF");
                    Keysight.Pega_Salva_MarkerTempodeOcupação(instr, "Tempo_de_Ocupação.csv", nomePasta, valFreq, nome);

                }
                else
                {
                    instr.WriteString("INIT:CONT OFF");
                    Rodhe.Pega_Salva_MarkersSCS(instr, "Tempo_de_Ocupação.csv", nomePasta, valFreq, nome, 3);

                }
            }
            catch
            {
            }
        }




        public bool Separação_Entre_Canais_de_Salto(string valFreq, string ip, string largura_Banda, string RefLevel, string Att, string marca)
        {
            ConectaIP(ip);
            try
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "100", "300", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("INIT"); // Comece a varredura
                    Thread.Sleep(25000);
                    instr.WriteString("INIT:CONT OFF");
                    return false;
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "100", "300", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("*OPC?");
                    Thread.Sleep(25000);
                    instr.WriteString("INIT:CONT OFF");
                    return false;
                    
                }
            }
            catch
            {
                return true;
            }
        }

        public bool TempoDeOcupacao(string valFreq, string ip, string largura_Banda, string RefLevel, string Att, string marca)
        {
            ConectaIP(ip);
            try
            {
                Start();
                double span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstrZeroSpan(instr, valFreq, "Dbm", Att, RefLevel, "0", "1000", "1000", "0.02", "WRIT", "POS", "SAN");
                    instr.WriteString("INIT"); 
                    double potenciaMarker = -40;
                    while (potenciaMarker < -20 )
                    {
                        instr.WriteString("CALC:MARK:AOFF");
                        instr.WriteString("INIT:CONT ON");
                        Thread.Sleep(100);
                        instr.WriteString("INIT:CONT OFF");
                        Thread.Sleep(500);
                        potenciaMarker = Keysight.MedeMarker(instr);
                    }
                    return true;
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, span.ToString(), "1000", "1000", "ON", "WRIT", "0.002", "SAN");
                    instr.WriteString("INIT"); 
                    double potenciaMarker = -20;
                    while (potenciaMarker < -10)
                    {
                        instr.WriteString("CALC:MARK:AOFF");
                        instr.WriteString("INIT:CONT ON");
                        Thread.Sleep(1000);
                        instr.WriteString("INIT:OFF");
                        potenciaMarker = Rodhe.MedeMarker(instr);
                    }
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }



        public void TiraPrint(string valFreq, string ip,string nome, bool tPrints, string marca, string nomePasta,string nomeEnsaio)
        {
            ConectaIP(ip);
            if (marca == "Agilent")
            {
                Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " " + nomeEnsaio, tPrints);
            }
            else
            {
                Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " " + nomeEnsaio, tPrints, "PNG");
            }
        }

        public bool Separação_Entre_Canais_de_SaltoPIe8(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, int numMarkers, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                // Seta as configurções basicas
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "50", "50", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("INIT");
                    Thread.Sleep(20000);
                    instr.WriteString("INIT:CONT OFF");
                    if (Keysight.Pega_Salva_Marker(instr, "Separacao_Entre_Canais_de_Salto.csv", nomePasta, valFreq, "MAXH", nome, numMarkers))
                    {
                        Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Separacao Entre Canais", tPrints);
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "50", "50", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("*OPC?");
                    Thread.Sleep(20000);
                    instr.WriteString("INIT:CONT OFF");
                    if (Rodhe.Pega_Salva_Marker(instr, "Separacao_Entre_Canais_de_Salto.csv", nomePasta, valFreq, nome, numMarkers))
                    {
                        Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Separacao Entre Canais", tPrints, "PNG");
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch 
            {
                return false;
            }
        }

        public void Numero_De_Frequencia_de_Salto(string valFreqI, string valFreqF,  string ip, string RefLevel, string Att, string marca)
        {
            ConectaIP(ip);
            try
            {
                Start();
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstrSalto(instr, valFreqI, valFreqF, "Dbm", Att, RefLevel, "100", "100", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("INIT:CONT ON");   
                }
                else
                {
                    Rodhe.ConfiguraInstrSalto(instr, valFreqI, valFreqF, "Dbm", Att, RefLevel, "100", "100", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("INIT:CONT ON");
                }
            }
            catch
            {
            }
        }

        public void Largura_26dB(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {

                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "100", "300", "ON", "MAXH", "POS", "OBW", "99", "-26");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("FETC:OBW:XDB?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Keysight.SalvaValores("Largura_26db.csv", nomePasta, val, valFreq, nome);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Largura 26db", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "100", "300", "ON", "MAXH", "POS", "OBW", "99", "26");
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    Rodhe.PegaMarker(instr);
                    instr.WriteString("CALC:MARK1:FUNC:NDBD:RES?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Largura 26db", tPrints, "PNG");
                    Rodhe.SalvaValores("Largura_26db.csv", nomePasta, val, valFreq, nome);

                }
            }
            catch
            {
            }
        }


        public void Pico_da_densidade_de_potência(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try 
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "3", "10", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    Keysight.Pega_Salva_Marker(instr, "Pico_da_densidade_de_potência.csv", nomePasta, valFreq, "MAXH", nome);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Pico_da_densidade_de_potência", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "3", "10", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT:CONT ON"); 
                    Thread.Sleep(15000);
                    Rodhe.Pega_Salva_Marker(instr, "Pico_da_densidade_de_potência.csv", nomePasta, valFreq, "MAXH", nome);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Pico_da_densidade_de_potência", tPrints, "PNG");
                }
            }
            catch
            {
            }
        }

        public bool NumeroDeOcupacoes(string valFreq, string ip, string largura_Banda, string RefLevel, string Att, string marca, ref int numMarkers, string nomePasta)
        {
            int cont = 0;
            ConectaIP(ip);
            try 
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstrZeroSpan(instr, valFreq, "Dbm", Att, RefLevel, "0", "300", "300", "1", "WRIT", "POS", "SAN");
                    instr.WriteString("SWE:TIME 1");
                    instr.WriteString("INIT:CONT ON"); // Comece a varredura
                    while (!(cont <= 4 && cont >= 3))
                    {
                        instr.WriteString("INIT:CONT ON");
                        Thread.Sleep(1000);
                        instr.WriteString("INIT:CONT OFF");
                        Thread.Sleep(500);
                        cont = Keysight.ContaMarker(instr);
                    }
                    numMarkers = cont;
                    instr.WriteString("INIT:CONT OFF");
                    SalvaNumMarkers(numMarkers, valFreq, nomePasta, "Numero_de_Ocupacoes.csv");
                    return true;
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, "0", "300", "300", "ON", "WRIT", "POS", "SAN");
                    instr.WriteString("SWE:TIME 1");
                    instr.WriteString("*OPC?");
                    Thread.Sleep(2000);  
                    instr.WriteString("INIT:CONT ON"); // Comece a varredura
                    while (!(numMarkers <= 4 && numMarkers >= 3))
                    {
                        instr.WriteString("CALC:MARK:AOFF");
                        instr.WriteString("INIT:CONT ON");
                        Thread.Sleep(1500);
                        instr.WriteString("INIT:CONT OFF");
                        numMarkers = Rodhe.ContaMarker(instr);
                    }
                    instr.WriteString("INIT:CONT OFF");
                    SalvaNumMarkers(numMarkers, valFreq, nomePasta, "Numero_de_Ocupacoes");
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        private static void SalvaNumMarkers(int count, string freqC, string nomePasta, string nomeArquivo)
        {
            var _ = nomePasta + @"\" + "Numero_de_Ocupacoes" + nomeArquivo + ".csv";
            if (!System.IO.File.Exists(nomePasta + @"\" + "Numero_de_Ocupacoes" + nomeArquivo + ".csv"))
            {
                
                System.IO.FileStream fs = File.Create(_);
                fs.Close();
                File.AppendAllText(_, freqC.ToString() + ";");
                File.AppendAllText(_, "Nmr de ocupacoes" + ";");
                File.AppendAllText(_, count + "\n");
            }
            else
            {
                File.AppendAllText(_, freqC.ToString() + ";");
                File.AppendAllText(_, "Nmr de ocupacoes" + ";");
                File.AppendAllText(_, count + "\n");
            }
        }

        public void Potência_de_pico_máximaBT(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try 
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("INIT:CONT ON"); // Comece a varredura
                    Thread.Sleep(5000);
                    instr.WriteString("INIT:CONT OFF");
                    Keysight.Pega_Salva_Marker(instr, "Potência_de_pico_máxima.csv", nomePasta, valFreq, "MAXH", nome);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Potência_de_pico_máxima", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("*OPC?");
                    Thread.Sleep(5000);
                    instr.WriteString("INIT");
                    Rodhe.Pega_Salva_Marker(instr, "Potência_de_pico_máxima.csv", nomePasta, valFreq, "MAXH", nome);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Potência_de_pico_máxima", tPrints, "PNG");
                }

            }
            catch (RsInstrumentException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public void Valor_médio_da_densidade_espectral_de_potência(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "3", "10", "ON", "AVER", "RMS", "SAN");
                    instr.WriteString("INIT:CONT ON");
                    instr.WriteString("SWE:TIME?");
                    double tempo = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    Thread.Sleep(10000);
                    Thread.Sleep((int)tempo * 1000);
                    Keysight.Pega_Salva_Marker(instr, "Valor_médio_da_densidade_espectral_de_potência.csv", nomePasta, valFreq, "AVER", nome);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Valor_médio_da_densidade_espectral_de_potência", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "3", "10", "ON", "AVER", "RMS", "SAN");
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT:CONT ON");
                    instr.WriteString("SWE:TIME?");
                    double tempo = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    Thread.Sleep(15000);
                    Thread.Sleep((int)tempo * 1000);
                    Rodhe.Pega_Salva_Marker(instr, "Valor_médio_da_densidade_espectral_de_potência.csv", nomePasta, valFreq, "AVER", nome);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Valor_médio_da_densidade_espectral_de_potência", tPrints, "PNG");
                }
            }
            catch (RsInstrumentException e)
            {
                Console.WriteLine(e.Message);
            }

        }

        public void Potência_de_pico_máxima(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "MAXH", "POS", "CHP", largura_Banda);
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("FETC:CHP:CHP?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    string val = Convert.ToString(aux);
                    Keysight.SalvaValores("Potência_de_pico_máxima.csv", nomePasta, val, valFreq, nome);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Potência_de_pico_máxima", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "MAXH", "POS", "ACP", largura_Banda);
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("CALC:MARK:FUNC:POW:RES? ACP");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Rodhe.SalvaValores("Potência_de_pico_máxima.csv", nomePasta, val, valFreq, nome);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Potência_de_pico_máxima", tPrints, "PNG");
                }
            }
            catch 
            {
            }

        }

        public void Valor_médio_da_potência_máxima_de_saída(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "MAXH", "RMS", "CHP", largura_Banda);
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("FETC:CHP:CHP?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Keysight.SalvaValores("Valor_médio_da_potência_máxima_de_saída.csv", nomePasta, val, valFreq, nome);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Valor_médio_da_potência_máxima_de_saída", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "MAXH", "RMS", "CHP", largura_Banda);
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("CALC:MARK:FUNC:POW:RES? ACP");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000;
                    string val = Convert.ToString(aux);
                    Rodhe.SalvaValores("Valor_médio_da_potência_máxima_de_saída.csv", nomePasta, val, valFreq, nome);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Valor_médio_da_potência_máxima_de_saída", tPrints, "PNG");
                }
            }
            catch 
            {
            }

        }

        public void Valor_médio_da_potência_máxima_de_saídaLE(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "MAXH", "RMS", "CHP", largura_Banda);
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    Keysight.Pega_Salva_Marker(instr, "Valor_médio_da_potência_máxima_de_saída.csv", nomePasta, valFreq, "MAXH", nome);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Valor_médio_da_potência_máxima_de_saída", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "MAXH", "RMS", "SAN");
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    Rodhe.Pega_Salva_Marker(instr, "Valor_médio_da_potência_máxima_de_saída.csv", nomePasta, valFreq, "MAXH", nome);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Valor_médio_da_potência_máxima_de_saída", tPrints, "PNG");
                }
            }
            catch
            {
            }
        }

        public void Potencia_De_Saida(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "100", "300", "ON", "MAXH", "POS", "OBW", "99", "-26");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("FETC:OBW:XDB?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000000;
                    string aux1 = Convert.ToString(aux);
                    aux1 = aux1.Replace(',', '.');
                    Keysight.ConfiguraInstr(instr, valFreq, "DBM", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "AVER", "RMS", "CHP", aux1);
                    instr.WriteString("INIT");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("FETC:CHP:CHP?");
                    double aux2 = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    //aux2 /= 1000;
                    string val = Convert.ToString(aux2);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Potencia_De_Saida", tPrints);
                    Keysight.SalvaValores("Potencia_De_Saida.csv", nomePasta, val, valFreq, nome);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "100", "300", "ON", "MAXH", "POS", "OBW", "99", "-26");
                    instr.WriteString("*OPC?");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("CALC:MARK1:FUNC:NDBD:RES?");
                    double aux = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux /= 1000000;
                    string aux1 = Convert.ToString(aux);
                    Rodhe.ConfiguraInstr(instr, valFreq, "DBM", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "AVER", "RMS", "CHP", aux1);
                    instr.WriteString("INIT");
                    Thread.Sleep(15000);
                    instr.WriteString("INIT:CONT OFF");
                    instr.WriteString("CALC:MARK:FUNC:POW:RES?");
                    double aux2 = (double)instr.ReadNumber(IEEEASCIIType.ASCIIType_R8, true);
                    aux2 /= 1000;
                    string val = Convert.ToString(aux2);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Potencia_De_Saida", tPrints, "PNG");
                    Rodhe.SalvaValores("Potencia_De_Saida.csv", nomePasta, val, valFreq, nome);
                }
            }
            catch (RsInstrumentException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public void Densidade_Espectral_de_Potencia(string valFreq, string ip, string nome, string largura_Banda, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);

            try
            {
                Start();
                double Span = int.Parse(largura_Banda) * 1.5;
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "AVER", "RMS", "SAN");
                    instr.WriteString("SWE:TIME?");
                    double tempo = (double)instr.ReadNumber();
                    Thread.Sleep(15000);
                    Thread.Sleep((int)tempo * 1000);
                    Keysight.Pega_Salva_Marker(instr, "Densidade_Espectral_de_Potencia.csv", nomePasta, valFreq, "AVER", nome);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Densidade_Espectral_de_Potencia", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstr(instr, valFreq, "Dbm", Att, RefLevel, Span.ToString(), "1000", "3000", "ON", "AVER", "RMS", "SAN");
                    instr.WriteString("*OPC?");
                    instr.WriteString("SWE:TIME?");
                    double tempo = (double)instr.ReadNumber();
                    Thread.Sleep(15000);
                    Thread.Sleep((int)tempo * 1000);
                    Rodhe.Pega_Salva_Marker(instr, "Densidade_Espectral_de_Potencia.csv", nomePasta, valFreq, "AVER", nome);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + valFreq + " Densidade_Espectral_de_Potencia", tPrints, "PNG");
                }
                
            }
            catch
            {
            }
        }

        public void Espurios(string freqI, string freqF, string ip, string nome, string RefLevel, string Att, bool tPrints, string marca, string nomePasta)
        {
            ConectaIP(ip);
            try
            {
                Start();
                if (marca == "Agilent")
                {
                    Keysight.ConfiguraInstrSalto(instr, freqI, freqF, "Dbm", Att, RefLevel, "100", "300", "ON","MAXH", "POS", "SAN");
                    instr.WriteString("INIT:CONT ON");
                    Thread.Sleep(5000);
                    Keysight.SalvaPrints(instr, nomePasta, nome + " " + freqI + " Espurios", tPrints);
                }
                else
                {
                    Rodhe.ConfiguraInstrSalto(instr, freqI, freqF, "Dbm", Att, RefLevel, "100", "300", "ON", "MAXH", "POS", "SAN");
                    instr.WriteString("INIT:CONT ON"); // Comece a varredura
                    Thread.Sleep(5000);
                    Rodhe.SalvaPrints(instr, nomePasta, nome + " " + freqI + " " + freqF + " Espurios", tPrints, "PNG");
                }
            }
            catch 
            {
            }
        }
    }
}