<?php
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
include "../config/db.php";

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode(["status" => "error", "message" => "No input"]);
    exit;
}

$user_id       = $conn->real_escape_string($data["user_id"]);
$consent_given = $conn->real_escape_string($data["consent_given"]);

$check = $conn->query(
    "SELECT id FROM consent WHERE user_id='$user_id'"
);

if ($check->num_rows > 0) {
    $sql = "UPDATE consent 
            SET consent_given='$consent_given'
            WHERE user_id='$user_id'";
} else {
    $sql = "INSERT INTO consent (user_id, consent_given, created_at) 
            VALUES ('$user_id', '$consent_given', NOW())";
}

if ($conn->query($sql)) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error",
                      "message" => $conn->error]);
}
?>