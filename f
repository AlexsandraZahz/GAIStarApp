using System;
using System.Data;
using System.Windows.Forms;

namespace LibraryManagement
{
    public partial class LoanedBooksForm : Form
    {
        private DataGridView dgvLoanedBooks;

        public LoanedBooksForm()
        {
            InitializeComponent();
        }

        public void SetDataSource(DataTable dataSource)
        {
            dgvLoanedBooks.DataSource = dataSource;
        }

        private void InitializeComponent()
        {
            this.dgvLoanedBooks = new DataGridView();
            this.SuspendLayout();

            // DataGridView: Список выданных книг
            this.dgvLoanedBooks.Location = new System.Drawing.Point(12, 12);
            this.dgvLoanedBooks.Size = new System.Drawing.Size(600, 300);
            this.dgvLoanedBooks.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvLoanedBooks.ReadOnly = true;

            this.ClientSize = new System.Drawing.Size(624, 324);
            this.Controls.Add(this.dgvLoanedBooks);
            this.Name = "LoanedBooksForm";
            this.Text = "Список выданных книг";
            this.ResumeLayout(false);
        }
    }
}