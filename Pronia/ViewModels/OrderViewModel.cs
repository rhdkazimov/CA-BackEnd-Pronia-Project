namespace Pronia.ViewModels
{
    public class OrderViewModel
    {
        public OrderCreateViewModel Order { get; set; }
        public List<CheckoutItem> CheckoutItems { get; set; } = new List<CheckoutItem>();
        public decimal TotalPrice { get; set; }
    }
}
