from pkg.main import hello


def test_hello() -> None:
    assert hello() == "hello python"
