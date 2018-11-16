interface IEnumerableItem {
  /**
   * The name of the item.
   * What you will see on the UI (unless rendering is used).
   */
  label: string;
  /**
   * The value of the item.
   * Used to differentiate/pass values when using the item.
   */
  value: string;
  /**
   * Override the rendering of the item.
   * Instead of using the label, use a custom ReactNode.
   */
  rendering?: React.ReactNode;
}

export default IEnumerableItem;
