
namespace Automacao_N9010A
{
    partial class Principal
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Principal));
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.BtConfirmar = new System.Windows.Forms.Button();
            this.TextBoxIP = new System.Windows.Forms.TextBox();
            this.LIP = new System.Windows.Forms.Label();
            this.BtConfig = new System.Windows.Forms.Button();
            this.LogoLabelo = new System.Windows.Forms.PictureBox();
            this.BtItem10 = new System.Windows.Forms.Button();
            this.BtItem11 = new System.Windows.Forms.Button();
            this.BtItem12 = new System.Windows.Forms.Button();
            this.TextBoxTecnologias = new System.Windows.Forms.GroupBox();
            this.GridFreqBt = new System.Windows.Forms.DataGridView();
            this.BtAddFreq = new System.Windows.Forms.Button();
            this.GridFreqWifi = new System.Windows.Forms.DataGridView();
            this.ColumnFreq = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnTecno = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.ColumnSpan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnPrints = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.GrupoDasNormas = new System.Windows.Forms.GroupBox();
            this.BtConectado = new System.Windows.Forms.Button();
            this.LConecta = new System.Windows.Forms.Label();
            this.LSelTipo = new System.Windows.Forms.Label();
            this.CBSelTipo = new System.Windows.Forms.ComboBox();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.label4 = new System.Windows.Forms.Label();
            this.TbNomeMetrologista = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.TbNomeEnsaio = new System.Windows.Forms.TextBox();
            this.LCaminhoPasta = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewComboBoxColumn1 = new System.Windows.Forms.DataGridViewComboBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ColumnPrint = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.LogoLabelo)).BeginInit();
            this.TextBoxTecnologias.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.GridFreqBt)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.GridFreqWifi)).BeginInit();
            this.GrupoDasNormas.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.SuspendLayout();
            // 
            // BtConfirmar
            // 
            this.BtConfirmar.BackColor = System.Drawing.SystemColors.Control;
            this.BtConfirmar.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.BtConfirmar.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.BtConfirmar.Location = new System.Drawing.Point(277, 556);
            this.BtConfirmar.Name = "BtConfirmar";
            this.BtConfirmar.Size = new System.Drawing.Size(108, 33);
            this.BtConfirmar.TabIndex = 6;
            this.BtConfirmar.Text = "Confirmar";
            this.BtConfirmar.UseVisualStyleBackColor = false;
            this.BtConfirmar.Click += new System.EventHandler(this.BtConfirmar_Click);
            // 
            // TextBoxIP
            // 
            this.TextBoxIP.AutoCompleteCustomSource.AddRange(new string[] {
            "192.168.0.158",
            "192.168.0.100"});
            this.TextBoxIP.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.Suggest;
            this.TextBoxIP.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.TextBoxIP.Location = new System.Drawing.Point(142, 34);
            this.TextBoxIP.Name = "TextBoxIP";
            this.TextBoxIP.Size = new System.Drawing.Size(117, 22);
            this.TextBoxIP.TabIndex = 12;
            // 
            // LIP
            // 
            this.LIP.AutoSize = true;
            this.LIP.BackColor = System.Drawing.Color.Transparent;
            this.LIP.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.LIP.ForeColor = System.Drawing.Color.Black;
            this.LIP.Location = new System.Drawing.Point(3, 34);
            this.LIP.Name = "LIP";
            this.LIP.Size = new System.Drawing.Size(93, 13);
            this.LIP.TabIndex = 13;
            this.LIP.Text = "Ip da Maquina:";
            // 
            // BtConfig
            // 
            this.BtConfig.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.BtConfig.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.BtConfig.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.BtConfig.Location = new System.Drawing.Point(24, 556);
            this.BtConfig.Name = "BtConfig";
            this.BtConfig.Size = new System.Drawing.Size(108, 29);
            this.BtConfig.TabIndex = 15;
            this.BtConfig.Text = "Configurações";
            this.BtConfig.UseVisualStyleBackColor = false;
            this.BtConfig.Click += new System.EventHandler(this.BtConfig_Click);
            // 
            // LogoLabelo
            // 
            this.LogoLabelo.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.LogoLabelo.Image = ((System.Drawing.Image)(resources.GetObject("LogoLabelo.Image")));
            this.LogoLabelo.Location = new System.Drawing.Point(35, -31);
            this.LogoLabelo.Name = "LogoLabelo";
            this.LogoLabelo.Size = new System.Drawing.Size(265, 99);
            this.LogoLabelo.TabIndex = 16;
            this.LogoLabelo.TabStop = false;
            // 
            // BtItem10
            // 
            this.BtItem10.BackColor = System.Drawing.SystemColors.Control;
            this.BtItem10.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.BtItem10.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.BtItem10.Location = new System.Drawing.Point(12, 26);
            this.BtItem10.Name = "BtItem10";
            this.BtItem10.Size = new System.Drawing.Size(108, 29);
            this.BtItem10.TabIndex = 18;
            this.BtItem10.Text = "Item 10";
            this.BtItem10.UseVisualStyleBackColor = false;
            this.BtItem10.Click += new System.EventHandler(this.BtItem10_Click);
            // 
            // BtItem11
            // 
            this.BtItem11.BackColor = System.Drawing.SystemColors.Control;
            this.BtItem11.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.BtItem11.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.BtItem11.Location = new System.Drawing.Point(138, 26);
            this.BtItem11.Name = "BtItem11";
            this.BtItem11.Size = new System.Drawing.Size(108, 29);
            this.BtItem11.TabIndex = 19;
            this.BtItem11.Text = "Item 11";
            this.BtItem11.UseVisualStyleBackColor = false;
            this.BtItem11.Click += new System.EventHandler(this.BtItem11_Click);
            // 
            // BtItem12
            // 
            this.BtItem12.BackColor = System.Drawing.SystemColors.Control;
            this.BtItem12.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.BtItem12.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.BtItem12.Location = new System.Drawing.Point(265, 26);
            this.BtItem12.Name = "BtItem12";
            this.BtItem12.Size = new System.Drawing.Size(108, 29);
            this.BtItem12.TabIndex = 20;
            this.BtItem12.Text = "Item 12";
            this.BtItem12.UseVisualStyleBackColor = false;
            this.BtItem12.Click += new System.EventHandler(this.BtItem12_Click);
            // 
            // TextBoxTecnologias
            // 
            this.TextBoxTecnologias.Controls.Add(this.GridFreqBt);
            this.TextBoxTecnologias.Controls.Add(this.BtAddFreq);
            this.TextBoxTecnologias.Controls.Add(this.GridFreqWifi);
            this.TextBoxTecnologias.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.TextBoxTecnologias.Location = new System.Drawing.Point(12, 273);
            this.TextBoxTecnologias.Name = "TextBoxTecnologias";
            this.TextBoxTecnologias.Size = new System.Drawing.Size(379, 193);
            this.TextBoxTecnologias.TabIndex = 21;
            this.TextBoxTecnologias.TabStop = false;
            this.TextBoxTecnologias.Text = "Tecnologias para ensaio";
            // 
            // GridFreqBt
            // 
            this.GridFreqBt.AllowUserToAddRows = false;
            this.GridFreqBt.AllowUserToResizeRows = false;
            this.GridFreqBt.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.GridFreqBt.BackgroundColor = System.Drawing.SystemColors.ActiveCaption;
            this.GridFreqBt.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.GridFreqBt.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn1,
            this.dataGridViewComboBoxColumn1,
            this.dataGridViewTextBoxColumn2,
            this.ColumnPrint});
            this.GridFreqBt.GridColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.GridFreqBt.Location = new System.Drawing.Point(10, 26);
            this.GridFreqBt.Name = "GridFreqBt";
            this.GridFreqBt.RowTemplate.Height = 25;
            this.GridFreqBt.Size = new System.Drawing.Size(362, 121);
            this.GridFreqBt.TabIndex = 29;
            // 
            // BtAddFreq
            // 
            this.BtAddFreq.BackColor = System.Drawing.SystemColors.Control;
            this.BtAddFreq.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.BtAddFreq.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.BtAddFreq.Location = new System.Drawing.Point(10, 153);
            this.BtAddFreq.Name = "BtAddFreq";
            this.BtAddFreq.Size = new System.Drawing.Size(362, 27);
            this.BtAddFreq.TabIndex = 26;
            this.BtAddFreq.Text = "Adicionar";
            this.BtAddFreq.UseVisualStyleBackColor = false;
            this.BtAddFreq.Click += new System.EventHandler(this.BtAddFreq_Click);
            // 
            // GridFreqWifi
            // 
            this.GridFreqWifi.AllowUserToAddRows = false;
            this.GridFreqWifi.AllowUserToResizeRows = false;
            this.GridFreqWifi.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.GridFreqWifi.BackgroundColor = System.Drawing.SystemColors.ActiveCaption;
            this.GridFreqWifi.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.GridFreqWifi.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ColumnFreq,
            this.ColumnTecno,
            this.ColumnSpan,
            this.ColumnPrints});
            this.GridFreqWifi.GridColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.GridFreqWifi.Location = new System.Drawing.Point(11, 26);
            this.GridFreqWifi.Name = "GridFreqWifi";
            dataGridViewCellStyle7.ForeColor = System.Drawing.Color.Black;
            this.GridFreqWifi.RowsDefaultCellStyle = dataGridViewCellStyle7;
            this.GridFreqWifi.RowTemplate.DefaultCellStyle.ForeColor = System.Drawing.Color.Black;
            this.GridFreqWifi.RowTemplate.Height = 25;
            this.GridFreqWifi.Size = new System.Drawing.Size(362, 121);
            this.GridFreqWifi.TabIndex = 27;
            // 
            // ColumnFreq
            // 
            dataGridViewCellStyle4.ForeColor = System.Drawing.Color.Black;
            this.ColumnFreq.DefaultCellStyle = dataGridViewCellStyle4;
            this.ColumnFreq.HeaderText = "Frequência";
            this.ColumnFreq.Name = "ColumnFreq";
            // 
            // ColumnTecno
            // 
            dataGridViewCellStyle5.ForeColor = System.Drawing.Color.Black;
            this.ColumnTecno.DefaultCellStyle = dataGridViewCellStyle5;
            this.ColumnTecno.HeaderText = "Tecnologia";
            this.ColumnTecno.Items.AddRange(new object[] {
            "Bluetooth Low Energy",
            "802.11a",
            "802.11b",
            "802.11g",
            "802.11n (20)",
            "802.11n (40)",
            "802.11n (80)",
            "802.11ac (20)",
            "802.11ac (40)",
            "802.11ac (80)",
            "802.11ax (20)",
            "802.11ax (40)",
            "802.11ax (80)",
            "802.11ax (160)"});
            this.ColumnTecno.Name = "ColumnTecno";
            // 
            // ColumnSpan
            // 
            dataGridViewCellStyle6.ForeColor = System.Drawing.Color.Black;
            this.ColumnSpan.DefaultCellStyle = dataGridViewCellStyle6;
            this.ColumnSpan.HeaderText = "Largura";
            this.ColumnSpan.Name = "ColumnSpan";
            // 
            // ColumnPrints
            // 
            this.ColumnPrints.HeaderText = "Prints";
            this.ColumnPrints.Name = "ColumnPrints";
            // 
            // GrupoDasNormas
            // 
            this.GrupoDasNormas.Controls.Add(this.BtItem12);
            this.GrupoDasNormas.Controls.Add(this.BtItem10);
            this.GrupoDasNormas.Controls.Add(this.BtItem11);
            this.GrupoDasNormas.Font = new System.Drawing.Font("Calibri", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.GrupoDasNormas.Location = new System.Drawing.Point(12, 472);
            this.GrupoDasNormas.Name = "GrupoDasNormas";
            this.GrupoDasNormas.Size = new System.Drawing.Size(379, 69);
            this.GrupoDasNormas.TabIndex = 22;
            this.GrupoDasNormas.TabStop = false;
            this.GrupoDasNormas.Text = "Ensaios da Ato n° 237";
            // 
            // BtConectado
            // 
            this.BtConectado.BackColor = System.Drawing.SystemColors.Control;
            this.BtConectado.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.BtConectado.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.BtConectado.Location = new System.Drawing.Point(142, 62);
            this.BtConectado.Name = "BtConectado";
            this.BtConectado.Size = new System.Drawing.Size(117, 29);
            this.BtConectado.TabIndex = 23;
            this.BtConectado.Text = "Conectar";
            this.BtConectado.UseVisualStyleBackColor = false;
            this.BtConectado.Click += new System.EventHandler(this.BtConectado_Click);
            // 
            // LConecta
            // 
            this.LConecta.AutoSize = true;
            this.LConecta.BackColor = System.Drawing.Color.Transparent;
            this.LConecta.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.LConecta.ForeColor = System.Drawing.Color.Red;
            this.LConecta.Location = new System.Drawing.Point(265, 37);
            this.LConecta.Name = "LConecta";
            this.LConecta.Size = new System.Drawing.Size(93, 13);
            this.LConecta.TabIndex = 24;
            this.LConecta.Text = "SEM CONEXÃO";
            // 
            // LSelTipo
            // 
            this.LSelTipo.AutoSize = true;
            this.LSelTipo.BackColor = System.Drawing.Color.Transparent;
            this.LSelTipo.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.LSelTipo.ForeColor = System.Drawing.Color.Black;
            this.LSelTipo.Location = new System.Drawing.Point(24, 229);
            this.LSelTipo.Name = "LSelTipo";
            this.LSelTipo.Size = new System.Drawing.Size(165, 13);
            this.LSelTipo.TabIndex = 26;
            this.LSelTipo.Text = "Selecione o Tipo de Ensaio:";
            // 
            // CBSelTipo
            // 
            this.CBSelTipo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.CBSelTipo.FormattingEnabled = true;
            this.CBSelTipo.Items.AddRange(new object[] {
            "Wifi",
            "Bluetooth"});
            this.CBSelTipo.Location = new System.Drawing.Point(24, 245);
            this.CBSelTipo.Name = "CBSelTipo";
            this.CBSelTipo.Size = new System.Drawing.Size(364, 22);
            this.CBSelTipo.TabIndex = 27;
            this.CBSelTipo.SelectedIndexChanged += new System.EventHandler(this.CBSelTipo_SelectedIndexChanged);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(24, 74);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(370, 152);
            this.tabControl1.TabIndex = 28;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.label4);
            this.tabPage1.Controls.Add(this.TbNomeMetrologista);
            this.tabPage1.Controls.Add(this.label1);
            this.tabPage1.Controls.Add(this.TbNomeEnsaio);
            this.tabPage1.Controls.Add(this.LCaminhoPasta);
            this.tabPage1.Controls.Add(this.button1);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Location = new System.Drawing.Point(4, 23);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(362, 125);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Info Pasta";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label4.ForeColor = System.Drawing.Color.Black;
            this.label4.Location = new System.Drawing.Point(17, 53);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(136, 13);
            this.label4.TabIndex = 29;
            this.label4.Text = "Nome do Metrologista:";
            // 
            // TbNomeMetrologista
            // 
            this.TbNomeMetrologista.Location = new System.Drawing.Point(155, 50);
            this.TbNomeMetrologista.Name = "TbNomeMetrologista";
            this.TbNomeMetrologista.Size = new System.Drawing.Size(117, 22);
            this.TbNomeMetrologista.TabIndex = 30;
            this.TbNomeMetrologista.TextChanged += new System.EventHandler(this.TbNomeMetrologista_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(17, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(104, 13);
            this.label1.TabIndex = 24;
            this.label1.Text = "Nome do ensaio:";
            // 
            // TbNomeEnsaio
            // 
            this.TbNomeEnsaio.Location = new System.Drawing.Point(127, 17);
            this.TbNomeEnsaio.Name = "TbNomeEnsaio";
            this.TbNomeEnsaio.Size = new System.Drawing.Size(145, 22);
            this.TbNomeEnsaio.TabIndex = 25;
            this.TbNomeEnsaio.TextChanged += new System.EventHandler(this.TbNomeEnsaio_TextChanged);
            // 
            // LCaminhoPasta
            // 
            this.LCaminhoPasta.AutoSize = true;
            this.LCaminhoPasta.BackColor = System.Drawing.Color.Transparent;
            this.LCaminhoPasta.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.LCaminhoPasta.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.LCaminhoPasta.Location = new System.Drawing.Point(168, 97);
            this.LCaminhoPasta.Name = "LCaminhoPasta";
            this.LCaminhoPasta.Size = new System.Drawing.Size(0, 13);
            this.LCaminhoPasta.TabIndex = 26;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.SystemColors.Control;
            this.button1.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.button1.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.button1.Location = new System.Drawing.Point(66, 90);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(95, 29);
            this.button1.TabIndex = 28;
            this.button1.Text = "Selecionar";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Font = new System.Drawing.Font("Verdana", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(17, 97);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(43, 13);
            this.label3.TabIndex = 27;
            this.label3.Text = "Pasta:";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.TextBoxIP);
            this.tabPage2.Controls.Add(this.LConecta);
            this.tabPage2.Controls.Add(this.BtConectado);
            this.tabPage2.Controls.Add(this.LIP);
            this.tabPage2.Location = new System.Drawing.Point(4, 23);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(362, 125);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Ip Maquina";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // dataGridViewTextBoxColumn1
            // 
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.Black;
            this.dataGridViewTextBoxColumn1.DefaultCellStyle = dataGridViewCellStyle1;
            this.dataGridViewTextBoxColumn1.HeaderText = "Frequência";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            // 
            // dataGridViewComboBoxColumn1
            // 
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.Black;
            this.dataGridViewComboBoxColumn1.DefaultCellStyle = dataGridViewCellStyle2;
            this.dataGridViewComboBoxColumn1.HeaderText = "Tecnologia";
            this.dataGridViewComboBoxColumn1.Items.AddRange(new object[] {
            "GFSK",
            "PI4 DQPSK",
            "8DPSK"});
            this.dataGridViewComboBoxColumn1.Name = "dataGridViewComboBoxColumn1";
            // 
            // dataGridViewTextBoxColumn2
            // 
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.Black;
            this.dataGridViewTextBoxColumn2.DefaultCellStyle = dataGridViewCellStyle3;
            this.dataGridViewTextBoxColumn2.HeaderText = "Largura";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            // 
            // ColumnPrint
            // 
            this.ColumnPrint.HeaderText = "Prints";
            this.ColumnPrint.Name = "ColumnPrint";
            // 
            // Principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.Color.CornflowerBlue;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ClientSize = new System.Drawing.Size(403, 598);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.CBSelTipo);
            this.Controls.Add(this.LSelTipo);
            this.Controls.Add(this.BtConfirmar);
            this.Controls.Add(this.GrupoDasNormas);
            this.Controls.Add(this.BtConfig);
            this.Controls.Add(this.LogoLabelo);
            this.Controls.Add(this.TextBoxTecnologias);
            this.DoubleBuffered = true;
            this.Font = new System.Drawing.Font("Calibri", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.ForeColor = System.Drawing.SystemColors.Control;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "Principal";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Ensaio Wifi Bluetooth";
            ((System.ComponentModel.ISupportInitialize)(this.LogoLabelo)).EndInit();
            this.TextBoxTecnologias.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.GridFreqBt)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.GridFreqWifi)).EndInit();
            this.GrupoDasNormas.ResumeLayout(false);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button BtConfirmar;
        private System.Windows.Forms.TextBox TextBoxIP;
        private System.Windows.Forms.Label LIP;
        private System.Windows.Forms.Button BtConfig;
        private System.Windows.Forms.PictureBox LogoLabelo;
        private System.Windows.Forms.Button BtItem10;
        private System.Windows.Forms.Button BtItem11;
        private System.Windows.Forms.Button BtItem12;
        private System.Windows.Forms.GroupBox TextBoxTecnologias;
        private System.Windows.Forms.GroupBox GrupoDasNormas;
        private System.Windows.Forms.Button BtConectado;
        private System.Windows.Forms.Label LConecta;
        private System.Windows.Forms.Label LSelTipo;
        private System.Windows.Forms.ComboBox CBSelTipo;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox TbNomeEnsaio;
        private System.Windows.Forms.Label LCaminhoPasta;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox TbNomeMetrologista;
        private System.Windows.Forms.DataGridView GridFreqWifi;
        private System.Windows.Forms.Button BtAddFreq;
        private System.Windows.Forms.DataGridView GridFreqBt;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewComboBoxColumn dataGridViewComboBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewCheckBoxColumn ColumnPrint;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnFreq;
        private System.Windows.Forms.DataGridViewComboBoxColumn ColumnTecno;
        private System.Windows.Forms.DataGridViewTextBoxColumn ColumnSpan;
        private System.Windows.Forms.DataGridViewCheckBoxColumn ColumnPrints;
    }
}

