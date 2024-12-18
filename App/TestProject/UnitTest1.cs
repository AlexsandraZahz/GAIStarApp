using GAIStarApp;
using GAIStarApp.Helpers;
namespace TestProject
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
            WindowManager.ShowDialogWindow<MainWindow>(12);   
        }

        [Test]
        public void Test1()
        {
            Assert.Pass();
        }
    }
}