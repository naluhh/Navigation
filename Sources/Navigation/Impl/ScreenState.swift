enum ScreenState {
    case idle
    case instanciated(ScreenControllerWithView)
    case visible(ScreenControllerWithView)
}
