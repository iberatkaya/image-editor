import React, { useState } from "react";
import "./App.css";
import {
  Button,
  Container,
  Form,
  Image,
  Navbar,
  Row,
  Spinner,
} from "react-bootstrap";

function App() {
  let [image, setImage] = useState<File>();
  let [newImage, setNewImage] = useState<string>();
  let [newImageLoading, setNewImageLoading] = useState<boolean>();
  let [height, setHeight] = useState<number>();
  let [width, setWidth] = useState<number>();
  let [preserveRatio, setPreserveRatio] = useState<boolean>();
  let [grayscale, setGrayscale] = useState<boolean>();

  const onImageChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files![0];
    if (file !== null) {
      setImage(file);
      setNewImage(undefined);
    }
  };

  const onHeightChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const num = parseInt(event.target.value);
    if (!isNaN(num)) {
      setHeight(parseInt(event.target.value));
    } else {
      setHeight(undefined);
    }
  };

  const onWidthChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const num = parseInt(event.target.value);
    if (!isNaN(num)) {
      setWidth(parseInt(event.target.value));
    } else {
      setWidth(undefined);
    }
  };

  const onPreserveRatioChange = (
    _: React.ChangeEvent<HTMLInputElement>
  ) => {
    setPreserveRatio(preserveRatio === undefined ? true : !preserveRatio);
  };

  const onGrayscaleChange = (_: React.ChangeEvent<HTMLInputElement>) => {
    setGrayscale(grayscale === undefined ? true : !grayscale);
  };

  return (
    <>
      <Navbar bg="dark" variant="dark" sticky="top">
        <Navbar.Brand>
          Welcome to Image Editor!
        </Navbar.Brand>
      </Navbar>
      <Container
        style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          padding: "12px 0px 12px 0",
          justifyContent: "center",
        }}
      >
        {image !== undefined ? (
          <Row style={{ alignItems: "center" }}>
            <Image
              style={{ maxHeight: "320px", paddingRight: "12px" }}
              src={URL.createObjectURL(image)}
              rounded
            />
            {newImage !== undefined ? (
              <Image
                style={{ maxHeight: "320px" }}
                src={`data:image/jpeg;base64,${newImage}`}
                rounded
              />
            ) : (
              <div />
            )}
            {newImageLoading ? <Spinner animation="border" /> : <div />}
          </Row>
        ) : (
          <div />
        )}
        <Form
          onSubmit={async (e) => {
            try {
              if (image === undefined) {
                alert("Must enter an image!");
                return;
              }
              e.preventDefault();
              var data = new FormData();
              data.append("file", image);

              if (grayscale !== undefined)
                data.append("grayscale", JSON.stringify(grayscale));
              if (height !== undefined)
                data.append("height", JSON.stringify(height));
              if (width !== undefined)
                data.append("width", JSON.stringify(width));
              if (preserveRatio !== undefined)
                data.append(
                  "preserveAspectRatio",
                  JSON.stringify(preserveRatio)
                );

              setNewImage(undefined);
              setNewImageLoading(true);
              const res = await fetch("https://ibk-image-editor.herokuapp.com/upload", {
                method: "POST",
                body: data,
              });
              const json = await res.json();
              console.log(json);
              if (json["status"] === true) {
                setNewImageLoading(false);
                setNewImage(json["file"]);
              } else {
                throw json;
              }
            } catch (e) {
              console.log(e);
              setNewImageLoading(false);
              if (e["error"] === true) {
                alert(e["reason"]);
              } else if (e["status"] === false) {
                alert(e["message"]);
              }
            }
          }}
        >
          <Form.Group>
            <Form.Label>Image</Form.Label>
            <Form.File
              onChange={onImageChange}
              id="custom-file"
              accept="image/*"
              label={image !== undefined ? image?.name : "Image"}
              custom
            />
            <Form.Text className="text-muted">Select your image.</Form.Text>
          </Form.Group>
          <Form.Group>
            <Form.Label>Height</Form.Label>
            <Form.Control
              value={height}
              onChange={onHeightChange}
              type="number"
              placeholder="Enter height"
              min={10}
              max={2000}
            />
            <Form.Text className="text-muted">
              Enter new image height. Leave blank to not change it.
            </Form.Text>
          </Form.Group>
          <Form.Group>
            <Form.Label>Width</Form.Label>
            <Form.Control
              value={width}
              onChange={onWidthChange}
              type="number"
              placeholder="Enter width"
              min={10}
              max={2000}
            />
            <Form.Text className="text-muted">
              Enter new image width. Leave blank to not change it.
            </Form.Text>
          </Form.Group>
          <Form.Group>
            <Form.Check
              checked={preserveRatio ?? false}
              onChange={onPreserveRatioChange}
              type="checkbox"
              label="Preserve Aspect Ratio"
            />
            <Form.Text className="text-muted">
              Check to preserve the aspect ratio if only height or width is
              provided.
            </Form.Text>
          </Form.Group>
          <Form.Group>
            <Form.Check
              checked={grayscale ?? false}
              onChange={onGrayscaleChange}
              type="checkbox"
              label="Grayscale"
            />
            <Form.Text className="text-muted">
              Check to make the image grayscale.
            </Form.Text>
          </Form.Group>
          <Row style={{ justifyContent: "center" }}>
            <Button variant="primary" type="submit">
              Submit
            </Button>
          </Row>
        </Form>
      </Container>
    </>
  );
}

export default App;
